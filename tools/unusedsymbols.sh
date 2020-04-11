#!/bin/sh
set -e

# Generate the file with ignored labels
rm -f unused_ignore.txt

# Scrape labels from a few select files
sed -n -e 's/^\(BattleTowerMons[0-9][0-9]*\):$/\1/p' data/battle_tower/parties.asm >> unused_ignore.txt
sed -n -e 's/^\(BattleTowerTrainer[0-9][0-9]*DataTable\):$/\1/p' data/battle_tower/unknown.asm >> unused_ignore.txt
sed -n -e 's/^\(IncGradGBPalTable_[0-9][0-9]\)::.*/\1/p' home/fade.asm >> unused_ignore.txt
sed -n -e 's/^\([A-Za-z]*Menu\):.*/\1/p' engine/menus/main_menu.asm | grep -xv MainMenu >> unused_ignore.txt

# Add more labels manually
cat >> unused_ignore.txt << EOF
AI_TryItem.no
AI_TryItem.used_item
AnimateWaterPalette.color1
BattleBGEffect_1c.DMG_PlayerData
BattleTowerTrainerDataEnd
BoxNameInputUpper
BuenaPrizeItems.End
CheckPlayerMoveTypeMatchups.not_very_effective
CheckPlayerTurn
CheckShininess.Shiny
Coord2Attr
Decompress.Literal
Decompress.long
Decompress.negative
DrawHP
EnemyAttackDamage.physical
EngineFlagAction.check
Facings.End
FemalePlayerNameArray
FlinchTarget
FlyMap.JohtoFlyMap
ForcePlayerMonChoice.enemy_fainted_mobile_error
Function24f19
GetIcon
GetNumberedTMHM.skip_two
GetTreeScore.bad
GoldenrodUnderground_MapScripts.Sunday
HDMATransfer_Wait123Scanlines
HandleWeather.player_first
HasRockSmash.no
InitBattleAnimBuffer.milk_drink
InterpretTwoOptionMenu
MalePlayerNameArray
Mobile_GetMenuSelection
NamingScreen_AdvanceCursor_CheckEndOfString
NamingScreen_LoadNextCharacter
POKEDEX_SCX
PlayerAttackDamage.physical
PlayersPCMenuData.PlayersPCMenuList2
Pokedex_GetArea.kanto
Pokedex_LoadGFX.LoadPokedexSlowpokeLZ
Pokedex_UpdateUnownMode.done
PrintBCDDigit.nonzeroDigit
PrintBCDNumber.numberEqualsZero
RadioChannels.kanto
RestorePPEffect.pp_is_maxed_out
SetSeenMon
SmallFarFlagAction.reset
SwitchSpeed
UpdateBGMap.bottom
UsedMoveText_CheckObedience
WaitDMATransfer
_CalcHoursDaysSince
_PrintNum.long
_PrintNum.seven
EOF

# Create objects with all the labels exported
# Excluding wram.o since that includes a lot of labels we aren't interested in.
objs=$(make -n -p | grep '^crystal_obj :=' | sed -e 's/^crystal_obj := //' -e 's/wram.o //')
rm -f $objs
make RGBASM='rgbasm -E' $objs

# Check if any of the ignored labels even exist anymore
python3 -u tools/unusedsymbols.py -D $objs | fgrep --line-buffered -xvf - unused_ignore.txt | tee unused_ignore_gone.txt
find unused_ignore_gone.txt -empty -delete

# Check if any of the ignored labels are actually used
python3 -u tools/unusedsymbols.py $objs | fgrep --line-buffered -xvf - unused_ignore.txt \
    | grep -xv 'BattleTowerMons[12]' | grep -xv 'IncGradGBPalTable_0[0457]' \
    | tee unused_ignore_used.txt
find unused_ignore_used.txt -empty -delete

# Run the program to generate a list of unreferenced labels
# All the labels in unused_ignore.txt are filtered out,
#   as well as those ending with `.anon_dw`
python3 -u tools/unusedsymbols.py -- $objs \
    | sed -u -e '/\.anon_dw$/d' \
    | fgrep --line-buffered -xvf unused_ignore.txt \
    | tee unused.txt

# Clean it up so a regular make won't mess up for the user
rm -f $objs unused_ignore.txt

##### Additional utilities to check for more unused things that a simple grep can't.
echo 'Unused item effects:'
python3 -u tools/unuseditemeffects.py | tee -a unused.txt

find unused.txt -empty -delete

##### This is the end of regular unused symbol checking.
##### From here on out it's grep-based hacks for constants.
teeunused() {
    while read const; do
        if ! fgrep -rw "$const" "$@" > /dev/null; then
            echo "$const" | tee -a unused.txt
        fi
    done
}

echo 'Unused BATTLETOWERACTION:'
sed -ne 's/^\tconst \(BATTLETOWERACTION_[^ ]*\).*/\1/p' \
    constants/battle_tower_constants.asm \
    | teeunused maps

echo 'Unused trainers:'
sed -ne '/^KRIS/,/^NUM_TRAINER_CLASSES/s/^\tconst \(.*\)/\1/p' \
    constants/trainer_constants.asm \
    | teeunused maps

echo 'Unused SFX:'
sed -ne 's/^\tconst \(SFX_[^ ]*\).*/\1/p' \
    constants/sfx_constants.asm \
    | teeunused home engine data maps

echo 'Unused MUSIC:'
sed -ne 's/^\tconst \(MUSIC_[^ ]*\).*/\1/p' \
    constants/music_constants.asm \
    | teeunused home engine data maps

echo 'Unused SCGB:'
sed -ne 's/^\tconst \(SCGB_[^ ]*\).*/\1/p' \
    constants/scgb_constants.asm \
    | teeunused engine

echo 'Unused ANIM_OBJ:'
sed -ne 's/^\tconst \(ANIM_OBJ_[^ ]*\).*/\1/p' \
    constants/battle_anim_constants.asm \
    | teeunused data/moves/animations.asm engine/battle_anims/bg_effects.asm
echo 'Unused ANIM_BG:'
sed -ne 's/^\tconst \(ANIM_BG_[^ ]*\).*/\1/p' \
    constants/battle_anim_constants.asm \
    | teeunused data/moves/animations.asm
echo 'Unused ANIM_GFX:'
sed -ne 's/^\tconst \(ANIM_GFX_[^ ]*\).*/\1/p' \
    constants/battle_anim_constants.asm \
    | egrep -v '^ANIM_GFX_(PLAYERHEAD|ENEMYFEET)$' \
    | teeunused data/moves/animations.asm
echo 'Unused BATTLEANIMFUNC:'
sed -ne 's/^\tconst \(BATTLEANIMFUNC_[^ ]*\).*/\1/p' \
    constants/battle_anim_constants.asm \
    | teeunused data/battle_anims/objects.asm
echo 'Unused BATTLEANIMFRAMESET:'
sed -ne 's/^\tconst \(BATTLEANIMFRAMESET_[^ ]*\).*/\1/p' \
    constants/battle_anim_constants.asm \
    | teeunused data/battle_anims/objects.asm engine/battle_anims/functions.asm
echo 'Unused BATTLEANIMOAMSET:'
sed -ne 's/^\tconst \(BATTLEANIMOAMSET_[^ ]*\).*/\1/p' \
    constants/battle_anim_constants.asm \
    | teeunused data/battle_anims/framesets.asm

echo 'Unused SPRITE_ANIM_INDEX:'
sed -ne 's/^\tconst \(SPRITE_ANIM_INDEX_[^ ]*\).*/\1/p' \
    constants/sprite_anim_constants.asm \
    | teeunused engine
echo 'Unused SPRITE_ANIM_SEQ:'
sed -ne 's/^\tconst \(SPRITE_ANIM_SEQ_[^ ]*\).*/\1/p' \
    constants/sprite_anim_constants.asm \
    | teeunused engine data/sprite_anims/sequences.asm
echo 'Unused SPRITE_ANIM_FRAMESET:'
sed -ne 's/^\tconst \(SPRITE_ANIM_FRAMESET_[^ ]*\).*/\1/p' \
    constants/sprite_anim_constants.asm \
    | egrep -v '_(FAST|00)$' \
    | teeunused engine data/sprite_anims/sequences.asm
echo 'Unused SPRITE_ANIM_OAMSET:'
sed -ne 's/^\tconst \(SPRITE_ANIM_OAMSET_[^ ]*\).*/\1/p' \
    constants/sprite_anim_constants.asm \
    | teeunused data/sprite_anims/framesets.asm

echo 'Unused SPRITEMOVEDATA:'
sed -ne 's/^\tconst \(SPRITEMOVEDATA_[^ ]*\).*/\1/p' \
    constants/map_object_constants.asm \
    | fgrep -xv 'SPRITEMOVEDATA_00' \
    | teeunused home engine maps
echo 'Unused SPRITEMOVEFN:'
sed -ne 's/^\tconst \(SPRITEMOVEFN_[^ ]*\).*/\1/p' \
    constants/map_object_constants.asm \
    | teeunused data/sprites/map_objects.asm
echo 'Unused STEP_TYPE:'
sed -ne 's/^\tconst \(STEP_TYPE_[^ ]*\).*/\1/p' \
    constants/map_object_constants.asm \
    | teeunused engine
echo 'Unused OBJECT_ACTION:'
sed -ne 's/^\tconst \(OBJECT_ACTION_[^ ]*\).*/\1/p' \
    constants/map_object_constants.asm \
    | fgrep -xv 'OBJECT_ACTION_00' \
    | teeunused engine data/sprites/map_objects.asm

echo 'Unused EFFECT:'
sed -ne 's/^\tconst \(EFFECT_[^ ]*\).*/\1/p' \
    constants/move_effect_constants.asm \
    | egrep -v '_(UP|DOWN)(_2|_HIT)?$' \
    | teeunused data/moves/moves.asm
echo 'Unused battle commands:'
sed -ne 's/^\tcommand \([^ ]*\).*/\1/p' \
    macros/scripts/battle_commands.asm \
    | fgrep -xv 'raisesubnoanim' \
    | teeunused data/moves/effects.asm

echo 'Unused music commands:'
sed -ne 's/^\(.*\): MACRO$/\1/p' \
    macros/scripts/audio.asm \
    | teeunused audio/music audio/sfx.asm audio/cries.asm

echo 'Unused battle animation commands:'
sed -ne 's/^\(.*\): MACRO$/\1/p' \
    macros/scripts/battle_anims.asm \
    | fgrep -xv 'anim_4gfx' \
    | fgrep -xv 'anim_5gfx' \
    | fgrep -xv 'anim_minimizeopp' \
    | teeunused data/moves/animations.asm

echo 'Unused event commands:'
sed -ne 's/^\(.*\): MACRO$/\1/p' \
    macros/scripts/events.asm \
    | fgrep -xv 'getcoins' \
    | fgrep -xv 'givemoney' \
    | fgrep -xv 'callstd' \
    | fgrep -xv 'getname' \
    | fgrep -xv 'checkmapscene' \
    | teeunused maps engine

# TODO: Check unused control chars (in the home/text.asm:CheckDict array)

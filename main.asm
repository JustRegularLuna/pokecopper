INCLUDE "constants.asm"


SECTION "bank1", ROMX

INCLUDE "engine/link/place_waiting_text.asm"
INCLUDE "engine/gfx/load_push_oam.asm"
INCLUDE "engine/overworld/map_objects.asm"
INCLUDE "engine/menus/main_menu.asm"
INCLUDE "engine/menus/intro_menu.asm"
INCLUDE "engine/overworld/init_map.asm"
INCLUDE "engine/pokemon/learn.asm"
INCLUDE "engine/pokemon/correct_nick_errors.asm"
INCLUDE "engine/math/math.asm"
INCLUDE "data/items/attributes.asm"
INCLUDE "engine/overworld/npc_movement.asm"
INCLUDE "engine/events/happiness_egg.asm"
INCLUDE "engine/events/shuckle.asm"
INCLUDE "engine/events/haircut.asm"


SECTION "bank2", ROMX

INCLUDE "engine/tilesets/map_palettes.asm"
INCLUDE "engine/overworld/player_object.asm"
INCLUDE "engine/math/sine.asm"
INCLUDE "engine/predef.asm"
INCLUDE "engine/gfx/color.asm"


SECTION "bank3", ROMX

INCLUDE "engine/events/checktime.asm"
INCLUDE "engine/events/engine_flags.asm"
INCLUDE "engine/overworld/variables.asm"
INCLUDE "engine/events/specials.asm"
INCLUDE "engine/smallflag.asm"
INCLUDE "engine/pokemon/health.asm"
INCLUDE "engine/events/overworld.asm"
INCLUDE "engine/items/items.asm"
INCLUDE "engine/overworld/player_step.asm"
INCLUDE "engine/battle/anim_hp_bar.asm"
INCLUDE "engine/pokemon/move_mon.asm"
INCLUDE "engine/pokemon/bills_pc_top.asm"
INCLUDE "engine/pokemon/breedmon_level_growth.asm"
INCLUDE "engine/pokemon/search2.asm"
INCLUDE "engine/events/bug_contest/caught_mon.asm"
INCLUDE "engine/items/item_effects.asm"
INCLUDE "engine/battle_anims/pokeball_wobble.asm"
INCLUDE "engine/pokemon/knows_move.asm"


SECTION "bank4", ROMX

INCLUDE "engine/items/pack.asm"
INCLUDE "engine/overworld/time.asm"
INCLUDE "engine/items/tmhm2.asm"
INCLUDE "engine/menus/naming_screen.asm"
INCLUDE "engine/events/misc_scripts.asm"
INCLUDE "engine/events/heal_machine_anim.asm"
INCLUDE "engine/events/whiteout.asm"
INCLUDE "engine/events/forced_movement.asm"
INCLUDE "engine/events/itemfinder.asm"
INCLUDE "engine/menus/start_menu.asm"
INCLUDE "engine/pokemon/mon_menu.asm"
INCLUDE "engine/overworld/select_menu.asm"
INCLUDE "engine/events/elevator.asm"
INCLUDE "engine/events/bug_contest/contest.asm"
INCLUDE "engine/events/repel.asm"
INCLUDE "engine/events/hidden_item.asm"
INCLUDE "engine/events/std_collision.asm"
INCLUDE "engine/events/bug_contest/judging.asm"
INCLUDE "engine/events/pokerus/apply_pokerus_tick.asm"
INCLUDE "engine/events/bug_contest/contest_2.asm"


SECTION "Player Movement", ROMX

INCLUDE "engine/overworld/player_movement.asm"


SECTION "bank5", ROMX

INCLUDE "engine/rtc/rtc.asm"
INCLUDE "engine/overworld/overworld.asm"
INCLUDE "engine/overworld/tile_events.asm"
INCLUDE "engine/menus/empty_sram.asm"
INCLUDE "engine/menus/save.asm"
INCLUDE "data/maps/spawn_points.asm"
INCLUDE "engine/overworld/load_map_part.asm"
INCLUDE "engine/overworld/spawn_points.asm"
INCLUDE "engine/overworld/map_setup.asm"
INCLUDE "data/tilesets.asm"
INCLUDE "engine/events/pokecenter_pc.asm"
INCLUDE "engine/items/mart.asm"
INCLUDE "engine/events/money.asm"
INCLUDE "data/items/marts.asm"
INCLUDE "engine/events/mom.asm"
INCLUDE "engine/events/daycare.asm"
INCLUDE "engine/events/print_unown.asm"
INCLUDE "engine/events/print_photo.asm"
INCLUDE "engine/link/mystery_gift_gfx.asm"
INCLUDE "engine/pokemon/breeding.asm"


SECTION "Roofs", ROMX

INCLUDE "engine/tilesets/mapgroup_roofs.asm"


SECTION "Clock Reset", ROMX

INCLUDE "engine/rtc/restart_clock.asm"


SECTION "Catch Tutorial", ROMX

INCLUDE "engine/events/catch_tutorial.asm"


SECTION "bank9", ROMX

INCLUDE "data/text_buffers.asm"
INCLUDE "engine/menus/menu.asm"
INCLUDE "engine/items/update_item_description.asm"
INCLUDE "engine/events/pokepic.asm"
INCLUDE "engine/overworld/map_objects_2.asm"
INCLUDE "engine/menus/scrolling_menu.asm"
INCLUDE "engine/items/switch_items.asm"
INCLUDE "engine/menus/menu_2.asm"
INCLUDE "engine/pokemon/mon_submenu.asm"
INCLUDE "engine/battle/menu.asm"
INCLUDE "engine/items/buy_sell_toss.asm"
INCLUDE "engine/menus/trainer_card.asm"
INCLUDE "engine/events/prof_oaks_pc.asm"
INCLUDE "engine/overworld/decorations.asm"
INCLUDE "engine/battle/read_trainer_dvs.asm"
INCLUDE "engine/battle/returntobattle_useball.asm"
INCLUDE "engine/battle/consume_held_item.asm"
INCLUDE "data/moves/effects.asm"


SECTION "bankA", ROMX

INCLUDE "engine/link/link.asm"
INCLUDE "engine/link/mystery_gift.asm"
INCLUDE "engine/overworld/wildmons.asm"


SECTION "bankB", ROMX

INCLUDE "engine/items/print_item_description.asm"
INCLUDE "engine/battle/trainer_huds.asm"
INCLUDE "engine/battle/ai/redundant.asm"
INCLUDE "engine/events/move_deleter.asm"
INCLUDE "engine/link/mystery_gift_2.asm"
INCLUDE "engine/items/tmhm.asm"
INCLUDE "engine/pokemon/print_move_description.asm"
INCLUDE "engine/events/pokerus/pokerus.asm"


SECTION "Effect Commands", ROMX

INCLUDE "engine/battle/effect_commands.asm"


SECTION "Enemy Trainers", ROMX

INCLUDE "engine/battle/ai/items.asm"
INCLUDE "engine/battle/ai/scoring.asm"
INCLUDE "engine/battle/read_trainer_attributes.asm"
INCLUDE "engine/battle/read_trainer_party.asm"


SECTION "Battle Core", ROMX

INCLUDE "engine/battle/core.asm"
INCLUDE "data/battle/effect_command_pointers.asm"


SECTION "bank10", ROMX

INCLUDE "engine/pokedex/pokedex.asm"
INCLUDE "data/moves/moves.asm"
INCLUDE "engine/pokemon/evolve.asm"


SECTION "bank11", ROMX

INCLUDE "engine/events/fruit_trees.asm"
INCLUDE "engine/battle/ai/move.asm"
INCLUDE "engine/pokedex/pokedex_2.asm"
INCLUDE "engine/battle/start_battle.asm"
INCLUDE "engine/gfx/place_graphic.asm"
INCLUDE "engine/pokemon/mail.asm"


SECTION "bank14", ROMX

INCLUDE "engine/pokemon/party_menu.asm"
INCLUDE "engine/events/fishing_gfx.asm"
INCLUDE "engine/events/poisonstep.asm"
INCLUDE "engine/events/sweet_scent.asm"
INCLUDE "engine/events/squirtbottle.asm"
INCLUDE "engine/events/card_key.asm"
INCLUDE "engine/events/basement_key.asm"
INCLUDE "engine/events/sacred_ash.asm"
INCLUDE "engine/pokemon/tempmon.asm"
INCLUDE "engine/pokemon/types.asm"
INCLUDE "engine/battle/getgen1trainerclassname.asm"
INCLUDE "engine/pokemon/mon_stats.asm"
INCLUDE "engine/link/init_list.asm"
INCLUDE "engine/pokemon/experience.asm"
INCLUDE "engine/pokemon/switchpartymons.asm"
INCLUDE "engine/gfx/load_pics.asm"
INCLUDE "engine/pokemon/move_mon_wo_mail.asm"
INCLUDE "data/pokemon/base_stats.asm"
INCLUDE "data/pokemon/unused_pic_banks.asm"

EggPic::
INCBIN "gfx/pokemon/egg/front.2bpp.lz"


SECTION "bank21", ROMX

INCLUDE "engine/printer/printer_serial.asm"
INCLUDE "engine/printer/printer.asm"
INCLUDE "gfx/battle_anims.asm"
INCLUDE "engine/events/halloffame.asm"


SECTION "bank23", ROMX

INCLUDE "engine/menus/savemenu_copytilemapatonce.asm"
INCLUDE "engine/phone/phonering_copytilemapatonce.asm"
INCLUDE "engine/rtc/reset_password.asm"
INCLUDE "engine/menus/delete_save.asm"
INCLUDE "engine/tilesets/timeofday_pals.asm"
INCLUDE "engine/battle/battle_transition.asm"
INCLUDE "engine/events/field_moves.asm"
INCLUDE "engine/events/magnet_train.asm"
INCLUDE "engine/gfx/sprites.asm"
INCLUDE "engine/gfx/mon_icons.asm"
INCLUDE "engine/movie/init_hof_credits.asm"


SECTION "bank24", ROMX

INCLUDE "engine/phone/phone.asm"
INCLUDE "engine/rtc/timeset.asm"
INCLUDE "engine/pokegear/pokegear.asm"
INCLUDE "engine/overworld/landmarks.asm"
INCLUDE "engine/events/fish.asm"
INCLUDE "engine/games/slot_machine.asm"


SECTION "bank26", ROMX


SECTION "bank2E_2", ROMX

INCLUDE "engine/events/checkforhiddenitems.asm"
INCLUDE "engine/events/treemons.asm"
INCLUDE "engine/pokegear/radio.asm"
INCLUDE "engine/pokemon/mail_2.asm"


SECTION "bank31_2", ROMX

INCLUDE "engine/events/pokerus/check_pokerus.asm"
INCLUDE "engine/events/lucky_number.asm"
INCLUDE "engine/pokemon/caught_nickname.asm"


SECTION "bank32", ROMX

INCLUDE "engine/battle_anims/bg_effects.asm"
INCLUDE "data/moves/animations.asm"
INCLUDE "engine/events/poisonstep_pals.asm"

TheEndGFX::
INCBIN "gfx/credits/theend.2bpp"


SECTION "Move Animations", ROMX

INCLUDE "engine/events/bug_contest/display_stats.asm"
INCLUDE "engine/battle_anims/anim_commands.asm"
INCLUDE "engine/battle_anims/core.asm"
INCLUDE "data/battle_anims/objects.asm"
INCLUDE "engine/battle_anims/functions.asm"
INCLUDE "engine/battle_anims/helpers.asm"
INCLUDE "data/battle_anims/framesets.asm"
INCLUDE "data/battle_anims/oam.asm"
INCLUDE "data/battle_anims/object_gfx.asm"


SECTION "Font Inversed", ROMX

FontInversed:
INCBIN "gfx/font/font_inversed.1bpp"


SECTION "bank38", ROMX

INCLUDE "engine/events/diploma.asm"
INCLUDE "engine/events/print_unown_2.asm"
INCLUDE "engine/games/card_flip.asm"
INCLUDE "engine/games/unown_puzzle.asm"
INCLUDE "engine/games/dummy_game.asm"
INCLUDE "engine/pokemon/bills_pc.asm"


SECTION "bank39", ROMX

CopyrightGFX::
INCBIN "gfx/intro/copyright.2bpp"

INCLUDE "engine/menus/options_menu.asm"
INCLUDE "engine/movie/intro.asm"


SECTION "bank3E", ROMX

INCLUDE "engine/gfx/load_font.asm"
INCLUDE "data/collision_permissions.asm"

Shrink1Pic:
INCBIN "gfx/new_game/shrink1.2bpp.lz"

Shrink2Pic:
INCBIN "gfx/new_game/shrink2.2bpp.lz"

INCLUDE "engine/link/time_capsule.asm"
INCLUDE "engine/events/name_rater.asm"
INCLUDE "engine/events/play_slow_cry.asm"
INCLUDE "engine/pokedex/new_pokedex_entry.asm"
INCLUDE "engine/link/time_capsule_2.asm"
INCLUDE "engine/pokedex/unown_dex.asm"
INCLUDE "engine/events/magikarp.asm"
INCLUDE "engine/battle/hidden_power.asm"
INCLUDE "engine/battle/misc.asm"


SECTION "bank3F", ROMX

INCLUDE "engine/tilesets/tileset_anims.asm"
INCLUDE "engine/events/npc_trade.asm"
INCLUDE "engine/events/mom_phone.asm"
INCLUDE "engine/link/mystery_gift_3.asm"


SECTION "Standard Scripts", ROMX

INCLUDE "engine/events/std_scripts.asm"
INCLUDE "engine/events/init_events.asm"
INCLUDE "data/text/std_text.asm"
INCLUDE "data/text/battle.asm"


SECTION "Phone Scripts", ROMX

INCLUDE "engine/phone/scripts/mom.asm"
INCLUDE "engine/phone/scripts/bill.asm"
INCLUDE "engine/phone/scripts/oak.asm"
INCLUDE "engine/phone/scripts/generic.asm"
INCLUDE "engine/phone/scripts/trainers.asm"
INCLUDE "data/phone/text/mom.asm"
INCLUDE "data/phone/text/bill.asm"
INCLUDE "data/phone/text/oak.asm"
INCLUDE "data/phone/text/trainers.asm"


SECTION "Names", ROMX

INCLUDE "data/items/names.asm"
INCLUDE "data/trainers/class_names.asm"
INCLUDE "data/pokemon/names.asm"
INCLUDE "data/moves/names.asm"


SECTION "Move Descriptions", ROMX

INCLUDE "data/moves/descriptions.asm"


SECTION "Item Descriptions", ROMX

INCLUDE "data/items/descriptions.asm"


SECTION "bank70", ROMX

INCLUDE "engine/printer/print_party.asm"


SECTION "bank70_2", ROMX

INCLUDE "engine/rtc/print_hours_mins.asm"
INCLUDE "engine/pokedex/pokedex_3.asm"
INCLUDE "engine/events/catch_tutorial_input.asm"
INCLUDE "engine/pokegear/townmap_convertlinebreakcharacters.asm"

PokegearGFX:
INCBIN "gfx/pokegear/pokegear.2bpp.lz"

INCLUDE "data/credits_strings.asm"


SECTION "Player Pics", ROMX
HiroPic::
INCBIN "gfx/player/hiro.2bpp.lz"

HiroBackpic::
INCBIN "gfx/player/hiro_back.2bpp.lz"

SylviaPic::
INCBIN "gfx/player/sylvia.2bpp.lz"

SylviaBackpic::
INCBIN "gfx/player/sylvia_back.2bpp.lz"

DudeBackpic::
INCBIN "gfx/battle/dude.2bpp.lz"


SECTION "Ghost Pic", ROMX
GhostPic::
INCBIN "gfx/battle/ghost.2bpp.lz"


SECTION "Stadium Data", ROMX

IF DEF(_GOLD)
INCBIN "data/stadium/stadium_gold.bin"
ELIF DEF(_SILVER)
INCBIN "data/stadium/stadium_silver.bin"
ENDC

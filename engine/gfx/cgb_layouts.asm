; Replaces the functionality of sgb.asm to work with CGB hardware.

CheckCGB:
	ldh a, [hCGB]
	and a
	ret

LoadSGBLayoutCGB:
	ld a, b
	cp SCGB_RAM
	jr nz, .not_ram
	ld a, [wSGBPredef]
.not_ram
	cp SCGB_PARTY_MENU_HP_PALS
	jp z, CGB_ApplyPartyMenuHPPals
	call ResetBGPals
	ld l, a
	ld h, 0
	add hl, hl
	ld de, .dw
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .ReturnFromJumpTable
	push de
	jp hl

.ReturnFromJumpTable:
	ret

.dw
	dw _CGB_BattleGrayscale
	dw _CGB_BattleColors
	dw _CGB_PokegearPals
	dw _CGB_StatsScreenHPPals
	dw _CGB_Pokedex
	dw _CGB_SlotMachine
	dw _CGB_BetaTitleScreen
	dw _CGB_GSIntro
	dw _CGB_Diploma
	dw _CGB_MapPals
	dw _CGB_PartyMenu
	dw _CGB_Evolution
	dw _CGB_GSTitleScreen
	dw _CGB0d
	dw _CGB_MoveList
	dw _CGB_BetaPikachuMinigame
	dw _CGB_PokedexSearchOption
	dw _CGB_BetaPoker
	dw _CGB_Pokepic
	dw _CGB_MagnetTrain
	dw _CGB_PackPals
	dw _CGB_TrainerCard
	dw _CGB_PokedexUnownMode
	dw _CGB_BillsPC
	dw _CGB_UnownPuzzle
	dw _CGB_GamefreakLogo
	dw _CGB_PlayerOrMonFrontpicPals
	dw _CGB_TradeTube
	dw _CGB_TrainerOrMonFrontpicPals
	dw _CGB_MysteryGift
	dw _CGB1e
	dw _CGB_Pokedex_5x5

_CGB_BattleGrayscale:
	ld hl, PalPacket_BattleGrayscale + 1
	ld de, wBGPals1
	ld c, 4
	call CopyPalettes
	ld hl, PalPacket_BattleGrayscale + 1
	ld de, wBGPals1 palette PAL_BATTLE_BG_EXP
	ld c, 4
	call CopyPalettes
	ld hl, PalPacket_BattleGrayscale + 1
	ld de, wOBPals1
	ld c, 2
	call CopyPalettes
	jr _CGB_FinishBattleScreenLayout

_CGB_BattleColors:
	ld de, wBGPals1
	call GetBattlemonBackpicPalettePointer
	push hl
	call LoadHLPaletteIntoDE ; PAL_BATTLE_BG_PLAYER
	call GetEnemyFrontpicPalettePointer
	push hl
	call LoadHLPaletteIntoDE ; PAL_BATTLE_BG_ENEMY
	ld a, [wEnemyHPPal]
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld bc, HPBarPals
	add hl, bc
	call LoadPalette_White_Col1_Col2_Black ; PAL_BATTLE_BG_ENEMY_HP
	ld a, [wPlayerHPPal]
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld bc, HPBarPals
	add hl, bc
	call LoadPalette_White_Col1_Col2_Black ; PAL_BATTLE_BG_PLAYER_HP
	ld hl, ExpBarPalette
	call LoadPalette_White_Col1_Col2_Black ; PAL_BATTLE_BG_EXP
	ld de, wOBPals1
	pop hl
	call LoadHLPaletteIntoDE ; PAL_BATTLE_OB_ENEMY
	pop hl
	call LoadHLPaletteIntoDE ; PAL_BATTLE_OB_PLAYER
	ld a, SCGB_BATTLE_COLORS
	ld [wSGBPredef], a
	call ApplyPals
_CGB_FinishBattleScreenLayout:
	ld hl, TilesetBGPalette palette 7
	ld de, wBGPals1 palette 7
	ld bc, 1 palettes
	call CopyBytes
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, PAL_BATTLE_BG_ENEMY_HP
	call ByteFill
	hlcoord 0, 4, wAttrmap
	lb bc, 8, 10
	ld a, PAL_BATTLE_BG_PLAYER
	call FillBoxCGB
	hlcoord 10, 0, wAttrmap
	lb bc, 7, 10
	ld a, PAL_BATTLE_BG_ENEMY
	call FillBoxCGB
	hlcoord 0, 0, wAttrmap
	lb bc, 4, 10
	ld a, PAL_BATTLE_BG_ENEMY_HP
	call FillBoxCGB
	hlcoord 10, 7, wAttrmap
	lb bc, 5, 10
	ld a, PAL_BATTLE_BG_PLAYER_HP
	call FillBoxCGB
	hlcoord 10, 11, wAttrmap
	lb bc, 1, 9
	ld a, PAL_BATTLE_BG_EXP
	call FillBoxCGB
	hlcoord 0, 12, wAttrmap
	ld bc, 6 * SCREEN_WIDTH
	ld a, PAL_BATTLE_BG_TEXT
	call ByteFill
	ld hl, BattleObjectPals
	ld de, wOBPals1 palette PAL_BATTLE_OB_GRAY
	ld bc, 6 palettes
	call CopyBytes
	call ApplyAttrmap
	ret

_CGB_PokegearPals:
	ld a, PAL_POKEGEAR
	call GetPredefPal
	ld de, wBGPals1
	push hl
	call LoadHLPaletteIntoDE
	pop hl
	ld de, wOBPals1
	call _CGB_MapPals.LoadHLOBPaletteIntoDE
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

_CGB_StatsScreenHPPals:
	ld de, wBGPals1
	ld a, [wCurHPPal]
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld bc, HPBarPals
	add hl, bc
	call LoadPalette_White_Col1_Col2_Black ; hp palette
	ld a, [wCurPartySpecies]
	ld bc, wTempMonDVs
	call GetPlayerOrMonPalettePointer
	call LoadHLPaletteIntoDE ; mon palette
	ld hl, ExpBarPalette
	call LoadPalette_White_Col1_Col2_Black ; exp palette
	ld hl, StatsScreenPagePals
	ld de, wBGPals1 palette 3
	ld bc, 3 palettes ; pink, green, and blue page palettes
	call CopyBytes
	call WipeAttrmap

	hlcoord 0, 0, wAttrmap
	lb bc, 8, SCREEN_WIDTH
	ld a, $1 ; mon palette
	call FillBoxCGB

	hlcoord 10, 16, wAttrmap
	ld bc, 10
	ld a, $2 ; exp palette
	call ByteFill

	hlcoord 13, 5, wAttrmap
	lb bc, 2, 2
	ld a, $3 ; pink page palette
	call FillBoxCGB

	hlcoord 15, 5, wAttrmap
	lb bc, 2, 2
	ld a, $4 ; green page palette
	call FillBoxCGB

	hlcoord 17, 5, wAttrmap
	lb bc, 2, 2
	ld a, $5 ; blue page palette
	call FillBoxCGB

	call ApplyAttrmap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

StatsScreenPagePals:
INCLUDE "gfx/stats/pages.pal"

StatsScreenPals:
INCLUDE "gfx/stats/stats.pal"

_CGB_Pokedex:
	call _CGB_Pokedex_Init
	hlcoord 1, 1, wAttrmap
	lb bc, 7, 7
	ld a, $1
	call FillBoxCGB
	jp _CGB_Pokedex_Resume

_CGB_Pokedex_5x5:
	call _CGB_Pokedex_Init
	hlcoord 1, 1, wAttrmap
	lb bc, 5, 5
	ld a, $1
	call FillBoxCGB
	jp _CGB_Pokedex_Resume

_CGB_Pokedex_Init:
	ld de, wBGPals1
	ld a, PAL_REDMON
	call GetPredefPal
	call LoadHLPaletteIntoDE ; dex interface palette
	ld a, [wCurPartySpecies]
	cp $ff
	jr nz, .is_pokemon
	ld hl, PokedexQuestionMarkPalette
	call LoadHLPaletteIntoDE ; green question mark palette
	jr .got_palette

.is_pokemon
	call GetMonPalettePointer
	call LoadHLPaletteIntoDE ; mon palette
.got_palette
	call WipeAttrmap
	ret

_CGB_Pokedex_Resume:
	call InitPartyMenuOBPals
	ld hl, PokedexCursorPalette
	ld de, wOBPals1 palette 7 ; green cursor palette
	ld bc, 1 palettes
	call CopyBytes
	call ApplyAttrmap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

PokedexCursorPalette:
INCLUDE "gfx/pokedex/cursor.pal"

PokedexQuestionMarkPalette:
INCLUDE "gfx/pokedex/question_mark.pal"

_CGB_BillsPC:
	ld de, wBGPals1
	ld a, PAL_REDMON
	call GetPredefPal
	call LoadHLPaletteIntoDE
	ld a, [wCurPartySpecies]
	cp $ff
	jr nz, .GetMonPalette
	ld hl, BillsPCOrangePalette
	call LoadHLPaletteIntoDE
	jr .GotPalette

.GetMonPalette:
	ld bc, wTempMonDVs
	call GetPlayerOrMonPalettePointer
	call LoadHLPaletteIntoDE
.GotPalette:
	call WipeAttrmap
	hlcoord 1, 4, wAttrmap
	lb bc, 7, 7
	ld a, $1
	call FillBoxCGB
	call InitPartyMenuOBPals
	call ApplyAttrmap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

Function95a0:
	ld hl, BillsPCOrangePalette
	call LoadHLPaletteIntoDE
	jr .GotPalette

.GetMonPalette:
	ld bc, wTempMonDVs
	call GetPlayerOrMonPalettePointer
	call LoadHLPaletteIntoDE
.GotPalette:
	call WipeAttrmap
	hlcoord 1, 1, wAttrmap
	lb bc, 7, 7
	ld a, $1
	call FillBoxCGB
	call InitPartyMenuOBPals
	call ApplyAttrmap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

BillsPCOrangePalette:
INCLUDE "gfx/pc/orange.pal"

_CGB_PokedexUnownMode:
	ld de, wBGPals1
	ld a, PAL_REDMON
	call GetPredefPal
	call LoadHLPaletteIntoDE
	ld a, [wCurPartySpecies]
	call GetMonPalettePointer
	call LoadHLPaletteIntoDE
	call WipeAttrmap
	hlcoord 7, 5, wAttrmap
	lb bc, 7, 7
	ld a, $1
	call FillBoxCGB
	call InitPartyMenuOBPals
	call ApplyAttrmap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

_CGB_SlotMachine:
	ld hl, SlotMachinePals
	ld de, wBGPals1
	ld bc, 16 palettes
	call CopyBytes
	call WipeAttrmap
	hlcoord 0, 2, wAttrmap
	lb bc, 10, 3
	ld a, $2
	call FillBoxCGB
	hlcoord 17, 2, wAttrmap
	lb bc, 10, 3
	ld a, $2
	call FillBoxCGB
	hlcoord 0, 4, wAttrmap
	lb bc, 6, 3
	ld a, $3
	call FillBoxCGB
	hlcoord 17, 4, wAttrmap
	lb bc, 6, 3
	ld a, $3
	call FillBoxCGB
	hlcoord 0, 6, wAttrmap
	lb bc, 2, 3
	ld a, $4
	call FillBoxCGB
	hlcoord 17, 6, wAttrmap
	lb bc, 2, 3
	ld a, $4
	call FillBoxCGB
	hlcoord 4, 2, wAttrmap
	lb bc, 2, 12
	ld a, $1
	call FillBoxCGB
	hlcoord 3, 2, wAttrmap
	lb bc, 10, 1
	ld a, $1
	call FillBoxCGB
	hlcoord 16, 2, wAttrmap
	lb bc, 10, 1
	ld a, $1
	call FillBoxCGB
	hlcoord 0, 12, wAttrmap
	ld bc, $78
	ld a, $7
	call ByteFill
	call ApplyAttrmap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

_CGB_BetaTitleScreen:
	ld hl, PalPacket_BetaTitleScreen + 1
	call CopyFourPalettes
	call WipeAttrmap
	ld de, wOBPals1
	ld a, PAL_PACK
	call GetPredefPal
	call LoadHLPaletteIntoDE
	hlcoord 0, 6, wAttrmap
	lb bc, 12, SCREEN_WIDTH
	ld a, $1
	call FillBoxCGB
	call ApplyAttrmap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

_CGB_GSIntro:
	ld b, 0
	ld hl, .Jumptable
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
	dw .ShellderLaprasScene
	dw .JigglypuffPikachuScene
	dw .StartersCharizardScene

.ShellderLaprasScene:
	ld a, PAL_GS_INTRO_SHELLDER_LAPRAS
	call GetPredefPal
	push hl
	push hl
	ld de, wBGPals1
	call LoadHLPaletteIntoDE
	pop hl
	ld de, wOBPals1
	call LoadHLPaletteIntoDE
	pop hl
	call LoadHLPaletteIntoDE
	call WipeAttrmap
	ret

.JigglypuffPikachuScene:
	ld de, wBGPals1
	ld a, PAL_GS_INTRO_JIGGLYPUFF_PIKACHU_BG
	call GetPredefPal
	call LoadHLPaletteIntoDE

	ld de, wOBPals1
	ld a, PAL_GS_INTRO_JIGGLYPUFF_PIKACHU_OB
	call GetPredefPal
	call LoadHLPaletteIntoDE
	call WipeAttrmap
	ret

.StartersCharizardScene:
	ld a, PAL_REDMON ; Charizard
	call GetPredefPal
	ld de, wBGPals1
	call LoadHLPaletteIntoDE
	ld de, wOBPals1
	ld a, PAL_GS_INTRO_STARTERS_TRANSITION
	call GetPredefPal
	call LoadHLPaletteIntoDE
	call WipeAttrmap
	ret

_CGB_BetaPoker:
	ld hl, BetaPokerPals
	ld de, wBGPals1
	ld bc, 5 palettes
	call CopyBytes
	call ApplyPals
	call WipeAttrmap
	call ApplyAttrmap
	ret

_CGB_Diploma:
; Start by loading PAL_MEWMON for 2 object pals
	ld de, wOBPals1
	ld a, PAL_MEWMON
	call GetPredefPal
	push hl
	call _CGB_MapPals.LoadHLOBPaletteIntoDE
	pop hl
	call _CGB_MapPals.LoadHLOBPaletteIntoDE
; then load diploma palettes
	ld hl, PalPacket_Diploma + 1
	call CopyFourPalettes
	call WipeAttrmap
	jp ApplyAttrmap

_CGB_MapPals:
; Get SGB palette
	call LoadSGBLayout.GetMapPalsIndex
	call GetPredefPal
	ld de, wBGPals1
; Copy 7 BG palettes
	ld b, 7
.bg_loop
	call .LoadHLBGPaletteIntoDE
	dec b
	jr nz, .bg_loop
; Copy PAL_BG_TEXT and 6 OB palettes
	ld b, 7
.ob_loop
	call .LoadHLOBPaletteIntoDE
	dec b
	jr nz, .ob_loop
; Copy PAL_OW_TREE and PAL_OW_ROCK
	call .LoadHLBGPaletteIntoDE
	call .LoadHLBGPaletteIntoDE
	ld a, SCGB_MAPPALS
	ld [wSGBPredef], a
	ret

.LoadHLBGPaletteIntoDE:
; morn/day: shades 0, 1, 2, 3 -> 0, 1, 2, 3
; nite: shades 0, 1, 2, 3 -> 1, 2, 2, 3
	push hl
	ld a, [wTimeOfDayPal]
	cp NITE_F
	jr c, .bg_morn_day
	inc hl
	inc hl
	call .LoadHLColorIntoDE
	call .LoadHLColorIntoDE
	dec hl
	dec hl
	call .LoadHLColorIntoDE
	call .LoadHLColorIntoDE
.bg_done
	pop hl
	ret

.bg_morn_day
	call LoadHLPaletteIntoDE
	jr .bg_done

.LoadHLOBPaletteIntoDE:
; shades 0, 1, 2, 3 -> 0, 0, 1, 3
	push hl
	call .LoadHLColorIntoDE
	dec hl
	dec hl
	call .LoadHLColorIntoDE
	call .LoadHLColorIntoDE
	inc hl
	inc hl
	call .LoadHLColorIntoDE
	pop hl
	ret

.LoadHLColorIntoDE:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a
rept PAL_COLOR_SIZE
	ld a, [hli]
	ld [de], a
	inc de
endr
	pop af
	ldh [rSVBK], a
	ret

_CGB_PartyMenu:
	ld hl, PalPacket_PartyMenu + 1
	call CopyFourPalettes
	call InitPartyMenuOBPals
	call ApplyAttrmap
	ret

_CGB_Evolution:
	ld de, wBGPals1
	ld a, c
	and a
	jr z, .pokemon
	ld a, PAL_BLACKOUT
	call GetPredefPal
	call LoadHLPaletteIntoDE
	jr .got_palette

.pokemon
	ld hl, wPartyMon1DVs
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wCurPartyMon]
	call AddNTimes
	ld c, l
	ld b, h
	ld a, [wPlayerHPPal]
	call GetPlayerOrMonPalettePointer
	call LoadPalette_White_Col1_Col2_Black
	ld hl, BattleObjectPals
	ld de, wOBPals1 palette PAL_BATTLE_OB_GRAY
	ld bc, 6 palettes
	call CopyBytes

.got_palette
	call WipeAttrmap
	call ApplyAttrmap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

_CGB_GSTitleScreen:
	ld hl, GSTitleBGPals
	ld de, wBGPals1
	ld bc, 5 palettes
	call CopyBytes
	ld hl, GSTitleOBPals
	ld de, wOBPals1
	ld bc, 2 palettes
	call CopyBytes
	ld a, SCGB_DIPLOMA
	ld [wSGBPredef], a
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

_CGB0d:
	ld hl, PalPacket_Diploma + 1
	call CopyFourPalettes
	call WipeAttrmap
	call ApplyAttrmap
	ret

_CGB_UnownPuzzle:
	ld hl, PalPacket_UnownPuzzle + 1
	call CopyFourPalettes
	ld de, wOBPals1
	ld a, PAL_UNOWN_PUZZLE
	call GetPredefPal
	call LoadHLPaletteIntoDE
	ld hl, wOBPals1
	ld a, LOW(palred 31 + palgreen 0 + palblue 0)
	ld [hli], a
	ld a, HIGH(palred 31 + palgreen 0 + palblue 0)
	ld [hl], a
	call WipeAttrmap
	call ApplyAttrmap
	ret

_CGB_TrainerCard:
	ld de, wBGPals1
	xor a ; CHRIS
	call GetTrainerPalettePointer
	call LoadHLPaletteIntoDE
	ld a, FALKNER
	call GetTrainerPalettePointer
	call LoadHLPaletteIntoDE
	ld a, BUGSY
	call GetTrainerPalettePointer
	call LoadHLPaletteIntoDE
	ld a, WHITNEY
	call GetTrainerPalettePointer
	call LoadHLPaletteIntoDE
	ld a, MORTY
	call GetTrainerPalettePointer
	call LoadHLPaletteIntoDE
	ld a, CHUCK
	call GetTrainerPalettePointer
	call LoadHLPaletteIntoDE
	ld a, JASMINE
	call GetTrainerPalettePointer
	call LoadHLPaletteIntoDE
	ld a, PRYCE
	call GetTrainerPalettePointer
	call LoadHLPaletteIntoDE
	ld a, PAL_GREYMON
	call GetPredefPal
	call LoadHLPaletteIntoDE

	; card border
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, $1 ; falkner
	call ByteFill
	; trainer sprite area
	hlcoord 14, 1, wAttrmap
	lb bc, 7, 5
	xor a ; chris
	call FillBoxCGB
	; top-right corner still uses the border's palette
	hlcoord 18, 1, wAttrmap
	ld [hl], $1
	hlcoord 2, 11, wAttrmap
	lb bc, 2, 4
	ld a, $1 ; falkner
	call FillBoxCGB
	hlcoord 6, 11, wAttrmap
	lb bc, 2, 4
	ld a, $2 ; bugsy
	call FillBoxCGB
	hlcoord 10, 11, wAttrmap
	lb bc, 2, 4
	ld a, $3 ; whitney
	call FillBoxCGB
	hlcoord 14, 11, wAttrmap
	lb bc, 2, 4
	ld a, $4 ; morty
	call FillBoxCGB
	hlcoord 2, 14, wAttrmap
	lb bc, 2, 4
	ld a, $5 ; chuck
	call FillBoxCGB
	hlcoord 6, 14, wAttrmap
	lb bc, 2, 4
	ld a, $6 ; jasmine
	call FillBoxCGB
	hlcoord 10, 14, wAttrmap
	lb bc, 2, 4
	ld a, $7 ; pryce
	call FillBoxCGB
	call ApplyAttrmap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

_CGB_MoveList:
	ld de, wBGPals1
	ld a, PAL_MARIGOLD
	call GetPredefPal
	call LoadHLPaletteIntoDE
	ld a, [wPlayerHPPal]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld bc, HPBarPals
	add hl, bc
	call LoadPalette_White_Col1_Col2_Black
	call WipeAttrmap
	hlcoord 11, 1, wAttrmap
	lb bc, 2, 9
	ld a, $1
	call FillBoxCGB
	call ApplyAttrmap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

_CGB_BetaPikachuMinigame:
	ld hl, PalPacket_BetaPikachuMinigame + 1
	call CopyFourPalettes
	call WipeAttrmap
	call ApplyAttrmap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

_CGB_PokedexSearchOption:
	ld de, wBGPals1
	ld a, PAL_REDMON
	call GetPredefPal
	call LoadHLPaletteIntoDE
	call WipeAttrmap
	call ApplyAttrmap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

_CGB_PackPals:
	ld de, wBGPals1
	ld hl, .PackPals
	ld bc, 8 palettes ; 6 palettes?
	call CopyBytes
	call WipeAttrmap
	hlcoord 0, 0, wAttrmap
	lb bc, 1, 10
	ld a, $1
	call FillBoxCGB
	hlcoord 10, 0, wAttrmap
	lb bc, 1, 10
	ld a, $2
	call FillBoxCGB
	hlcoord 7, 2, wAttrmap
	lb bc, 9, 1
	ld a, $3
	call FillBoxCGB
	hlcoord 0, 7, wAttrmap
	lb bc, 3, 5
	ld a, $4
	call FillBoxCGB
	hlcoord 0, 3, wAttrmap
	lb bc, 3, 5
	ld a, $5
	call FillBoxCGB
	call ApplyAttrmap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

.PackPals:
INCLUDE "gfx/pack/pack.pal"

_CGB_Pokepic:
	call _CGB_MapPals
	call SwapTextboxPalettes
	ld de, SCREEN_WIDTH
	hlcoord 0, 0, wAttrmap
	ld a, [wMenuBorderTopCoord]
.loop
	and a
	jr z, .found_top
	dec a
	add hl, de
	jr .loop

.found_top
	ld a, [wMenuBorderLeftCoord]
	ld e, a
	ld d, $0
	add hl, de
	ld a, [wMenuBorderTopCoord]
	ld b, a
	ld a, [wMenuBorderBottomCoord]
	inc a
	sub b
	ld b, a
	ld a, [wMenuBorderLeftCoord]
	ld c, a
	ld a, [wMenuBorderRightCoord]
	sub c
	inc a
	ld c, a
	ld a, $0
	call FillBoxCGB
	call ApplyAttrmap
	ret

_CGB_MagnetTrain:
	ld hl, PalPacket_MagnetTrain + 1
	call CopyFourPalettes
	call WipeAttrmap
	hlcoord 0, 4, wAttrmap
	lb bc, 10, SCREEN_WIDTH
	ld a, $2
	call FillBoxCGB
	hlcoord 0, 6, wAttrmap
	lb bc, 6, SCREEN_WIDTH
	ld a, $1
	call FillBoxCGB
	call ApplyAttrmap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

_CGB_GamefreakLogo:
	ld de, wBGPals1
	ld a, PAL_GS_INTRO_GAMEFREAK_LOGO
	call GetPredefPal
	push hl
	push hl
	call LoadHLPaletteIntoDE
	ld de, wOBPals1
	pop hl
	call LoadHLPaletteIntoDE
	ld de, wOBPals1 palette 1
	pop hl
	call LoadHLPaletteIntoDE
	call WipeAttrmap
	call ApplyAttrmap
	call ApplyPals
	ret

_CGB_PlayerOrMonFrontpicPals:
	ld de, wBGPals1
	ld a, [wCurPartySpecies]
	ld bc, wTempMonDVs
	call GetPlayerOrMonPalettePointer
	call LoadHLPaletteIntoDE
	call WipeAttrmap
	call ApplyAttrmap
	call ApplyPals
	ret

_CGB1e:
	ld de, wBGPals1
	ld a, [wCurPartySpecies]
	call GetMonPalettePointer
	call LoadHLPaletteIntoDE
	call WipeAttrmap
	call ApplyAttrmap
	ret

_CGB_TradeTube:
	ld hl, PalPacket_TradeTube + 1
	call CopyFourPalettes
	ld hl, PartyMenuOBPals
	ld de, wOBPals1
	ld bc, 1 palettes
	call CopyBytes
	ld de, wOBPals1 palette 7
	ld a, PAL_BLUEMON
	call GetPredefPal
	call LoadHLPaletteIntoDE
	call WipeAttrmap
	ret

_CGB_TrainerOrMonFrontpicPals:
	ld de, wBGPals1
	ld a, [wCurPartySpecies]
	ld bc, wTempMonDVs
	call GetFrontpicPalettePointer
	call LoadHLPaletteIntoDE
	call WipeAttrmap
	call ApplyAttrmap
	call ApplyPals
	ret

_CGB_MysteryGift:
	ld hl, .MysteryGiftPalette
	ld de, wBGPals1
	ld bc, 1 palettes
	call CopyBytes
	call ApplyPals
	call WipeAttrmap
	call ApplyAttrmap
	ret

.MysteryGiftPalette:
	RGB 31, 31, 31
	RGB 09, 31, 31
	RGB 10, 12, 31
	RGB 00, 03, 19

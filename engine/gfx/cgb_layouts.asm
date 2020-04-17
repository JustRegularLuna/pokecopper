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
	call _hl_
	ret

.dw
	dw _CGB_BattleGrayscale
	dw _CGB_BattleColors
	dw _CGB_PokegearPals
	dw _CGB_StatsScreenHPPals
	dw _CGB_Pokedex
	dw _CGB_SlotMachine
	dw _CGB_Diploma
	dw _CGB_MapPals
	dw _CGB_PartyMenu
	dw _CGB_Evolution
	dw _CGB_MoveList
	dw _CGB_PokedexSearchOption
	dw _CGB_Pokepic
	dw _CGB_PackPals
	dw _CGB_TrainerCard
	dw _CGB_PokedexUnownMode
	dw _CGB_BillsPC
	dw _CGB_UnownPuzzle
	dw _CGB_GamefreakLogo
	dw _CGB_PlayerOrMonFrontpicPals
	dw _CGB_TradeTube
	dw _CGB_TrainerOrMonFrontpicPals

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
	add PAL_HP_GREEN
	call GetPredefPal
	call LoadHLPaletteIntoDE ; PAL_BATTLE_BG_ENEMY_HP
	ld a, [wPlayerHPPal]
	add PAL_HP_GREEN
	call GetPredefPal
	call LoadHLPaletteIntoDE ; PAL_BATTLE_BG_PLAYER_HP
	; on the SGB, the EXP Bar was the same color as your HP bar
	ld de, wOBPals1
	pop hl
	call LoadHLPaletteIntoDE ; PAL_BATTLE_OB_ENEMY
	pop hl
	call LoadHLPaletteIntoDE ; PAL_BATTLE_OB_PLAYER
	ld a, SCGB_BATTLE_COLORS
	ld [wSGBPredef], a
	call ApplyPals
_CGB_FinishBattleScreenLayout:
	call InitPartyMenuBGPal7
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
	ld a, PAL_BATTLE_BG_PLAYER_HP ; PAL_BATTLE_BG_EXP originally. Shared HP color on SGB.
	call FillBoxCGB
	hlcoord 0, 12, wAttrmap
	ld bc, 6 * SCREEN_WIDTH
	ld a, PAL_BATTLE_BG_TEXT
	call ByteFill
	call FillBattleObjectPals
	call ApplyAttrmap
	ret

FillBattleObjectPals:
	ld de, wOBPals1 palette PAL_BATTLE_OB_GRAY
	ld a, PAL_GREYMON
	call GetPredefPal
	call LoadHLPaletteIntoDE
	ld a, PAL_YELLOWMON
	call GetPredefPal
	call LoadHLPaletteIntoDE
	ld a, PAL_REDMON
	call GetPredefPal
	call LoadHLPaletteIntoDE
	ld a, PAL_GREENMON
	call GetPredefPal
	call LoadHLPaletteIntoDE
	ld a, PAL_BLUEMON
	call GetPredefPal
	call LoadHLPaletteIntoDE
	ld a, PAL_BROWNMON
	call GetPredefPal
	jp LoadHLPaletteIntoDE

InitPartyMenuBGPal7:
	ld hl, PartyMenuBGPalette
	ld de, wBGPals1 palette 7
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	ret

InitPartyMenuBGPal0:
	ld hl, PartyMenuBGPalette
	ld de, wBGPals1 palette 0
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
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
	add PAL_HP_GREEN
	call GetPredefPal
	push hl
	call LoadHLPaletteIntoDE ; hp palette
	ld a, [wCurPartySpecies]
	ld bc, wTempMonDVs
	call GetPlayerOrMonPalettePointer
	call LoadHLPaletteIntoDE ; mon palette
	pop hl ; EXP Bar matches HP Bar in SGB mode
	call LoadHLPaletteIntoDE ; exp palette
	ld de, wBGPals1 palette 3
	; page button palettes
	ld a, PAL_HP_GREEN
	call GetPredefPal
	call LoadHLPaletteIntoDE
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
	lb bc, 2, 6
	ld a, $3 ; pages palette
	call FillBoxCGB

	call ApplyAttrmap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

_CGB_Pokedex:
	ld de, wBGPals1
	ld a, PAL_REDMON
	call GetPredefPal
	call LoadHLPaletteIntoDE ; dex interface palette
	ld a, [wCurPartySpecies]
	cp $ff
	jr nz, .is_pokemon
	ld a, PAL_GREYMON
	call GetPredefPal
	call LoadHLPaletteIntoDE ; question mark palette
	jr .got_palette

.is_pokemon
	call GetMonPalettePointer
	call LoadHLPaletteIntoDE ; mon palette
.got_palette
	call WipeAttrmap
	hlcoord 1, 1, wAttrmap
	lb bc, 7, 7
	ld a, $1 ; green question mark palette
	call FillBoxCGB
	call InitPartyMenuOBPals
	ld a, PAL_REDMON
	call GetPredefPal
	ld de, wOBPals1 palette 7 ; cursor palette
	call LoadHLPaletteIntoDE
	call ApplyAttrmap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

_CGB_BillsPC:
	ld de, wBGPals1
	ld a, PAL_REDMON
	call GetPredefPal
	call LoadHLPaletteIntoDE
	ld a, [wCurPartySpecies]
	cp $ff
	jr nz, .GetMonPalette
	ld a, PAL_GREYMON
	call GetPredefPal
	call LoadHLPaletteIntoDE
	jr .Resume

.GetMonPalette:
	ld bc, wTempMonDVs
	call GetPlayerOrMonPalettePointer
	call LoadHLPaletteIntoDE
.Resume:
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
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
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
	call ApplyAttrmap
	ret

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
	call InitPartyMenuBGPal0
	call InitPartyMenuBGPal7
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
	call LoadHLPaletteIntoDE
	call FillBattleObjectPals

.got_palette
	call WipeAttrmap
	call ApplyAttrmap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

_CGB_UnownPuzzle:
	ld hl, PalPacket_UnownPuzzle + 1
	call CopyFourPalettes
	ld de, wOBPals1
	ld a, PAL_UNOWN_PUZZLE
	call GetPredefPal
	call LoadHLPaletteIntoDE
	ldh a, [rSVBK]
	push af
	ld a, BANK(wOBPals1)
	ldh [rSVBK], a
	ld hl, wOBPals1
	ld a, LOW(palred 31 + palgreen 0 + palblue 0)
	ld [hli], a
	ld [hl], HIGH(palred 31 + palgreen 0 + palblue 0)
	pop af
	ldh [rSVBK], a
	call WipeAttrmap
	call ApplyAttrmap
	ret

_CGB_TrainerCard:
	; Palettes for border and trainers
	ld de, wBGPals1
	ld a, PAL_CYANMON
	call GetPredefPal
	call LoadHLPaletteIntoDE
	ld a, PAL_REDMON
	call GetPredefPal
	call LoadHLPaletteIntoDE
	ld a, PAL_MEWMON
	call GetPredefPal
	call LoadHLPaletteIntoDE
	; palette for the badges when visible
	ld de, wOBPals1
	ld a, PAL_GREYMON
	call GetPredefPal
	call LoadHLPaletteIntoDE

	; fill screen with gender-specific palette for the card border
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, [wPlayerGender]
	and a
	ld a, $1 ; red
	jr z, .got_gender
	ld a, $0 ; cyan
.got_gender
	call ByteFill
	; fill trainer sprite area with trainer palette
	hlcoord 14, 1, wAttrmap
	lb bc, 7, 5
	ld a, $2
	call FillBoxCGB
	; top-right corner still uses the border's palette
	hlcoord  0, 0, wAttrmap
	ld a, [hl]
	hlcoord 18, 1, wAttrmap
	ld [hl], a
	hlcoord 2, 10, wAttrmap
	lb bc, 6, 16
	ld a, $2 ; trainer faces
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
	add PAL_HP_GREEN
	call GetPredefPal
	call LoadHLPaletteIntoDE
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
; pack pals
	ld de, wBGPals1
	ld a, PAL_PACK
	call GetPredefPal
	call LoadHLPaletteIntoDE
	call WipeAttrmap
	call ApplyAttrmap
	call ApplyPals
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

_CGB_Pokepic:
	call _CGB_MapPals
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

_CGB_GamefreakLogo:
	ld de, wBGPals1
	ld a, PAL_GAMEFREAK_LOGO_BG
	call GetPredefPal
	call LoadHLPaletteIntoDE
	ld hl, .Palette
	ld de, wOBPals1
	call LoadHLPaletteIntoDE
	ld hl, .Palette
	ld de, wOBPals1 palette 1
	call LoadHLPaletteIntoDE
	call WipeAttrmap
	call ApplyAttrmap
	call ApplyPals
	ret

.Palette:
INCLUDE "gfx/splash/logo.pal"

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

_CGB_TradeTube:
	ld hl, PalPacket_TradeTube + 1
	call CopyFourPalettes
	ld hl, PartyMenuOBPals
	ld de, wOBPals1
	ld bc, 1 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM
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

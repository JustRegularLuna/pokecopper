_LoadStandardFont::
	ld de, Font
	ld hl, vTiles1
	lb bc, BANK(Font), 58 ; "A" to "z" (skip "┌" to "┘")
	call Get1bpp
 	ld de, Font + 64 * LEN_1BPP_TILE
 	ld hl, vTiles1 tile $40
	lb bc, BANK(Font), 64 ; $c0 to "←"
 	jp Get1bpp

_LoadFontsExtra::
	jr LoadFrame

_LoadFontsBattleExtra::
	ld de, FontBattleExtra
	ld hl, vTiles2 tile $60
	lb bc, BANK(FontBattleExtra), 25
	call Get2bpp
	jr LoadFrame

LoadFrame:
	ld a, [wTextboxFrame]
	maskbits NUM_FRAMES
	ld bc, 6 * LEN_1BPP_TILE
	ld hl, Frames
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, vTiles0 tile "┌"
	lb bc, BANK(Frames), 6 ; "┌" to "┘"
	call Get1bpp
	ld hl, vTiles2 tile " " ; $7f
	ld de, TextboxSpaceGFX
	lb bc, BANK(TextboxSpaceGFX), 1
	call Get1bpp
	ret

LoadBattleFontsHPBar:
	ld de, FontBattleExtra
	ld hl, vTiles2 tile $60
	lb bc, BANK(FontBattleExtra), 12
	call Get2bpp
	ld hl, vTiles2 tile $70
	ld de, FontBattleExtra + 16 tiles ; "<DO>"
	lb bc, BANK(FontBattleExtra), 3 ; "<DO>" to "『"
	call Get2bpp
	call LoadFrame

LoadHPBar:
	ld de, EnemyHPBarBorderGFX
	ld hl, vTiles2 tile $6c
	lb bc, BANK(EnemyHPBarBorderGFX), 4
	call Get1bpp
	ld de, HPExpBarBorderGFX
	ld hl, vTiles2 tile $73
	lb bc, BANK(HPExpBarBorderGFX), 6
	call Get1bpp
	ld de, ExpBarGFX
	ld hl, vTiles2 tile $55
	lb bc, BANK(ExpBarGFX), 9
	call Get2bpp
	ret

StatsScreen_LoadFont::
	call _LoadFontsBattleExtra
	ld de, EnemyHPBarBorderGFX
	ld hl, vTiles2 tile $6c
	lb bc, BANK(EnemyHPBarBorderGFX), 4
	call Get1bpp
	ld de, HPExpBarBorderGFX
	ld hl, vTiles2 tile $78
	lb bc, BANK(HPExpBarBorderGFX), 1
	call Get1bpp
	ld de, HPExpBarBorderGFX + 3 * LEN_1BPP_TILE
	ld hl, vTiles2 tile $76
	lb bc, BANK(HPExpBarBorderGFX), 2
	call Get1bpp
	ld de, ExpBarGFX
	ld hl, vTiles2 tile $55
	lb bc, BANK(ExpBarGFX), 8
	call Get2bpp
LoadStatsScreenPageTilesGFX:
	ld de, StatsScreenPageTilesGFX
	ld hl, vTiles2 tile $31
	lb bc, BANK(StatsScreenPageTilesGFX), 17
	call Get2bpp
	ret

LoadFontsBattleLevel:
	ld de, FontBattleExtra + 14 tiles
	ld hl, vTiles2 tile "<LV>" ; $6e
	lb bc, BANK(FontBattleExtra), 1
	jp Get2bpp

INCLUDE "gfx/font.asm"

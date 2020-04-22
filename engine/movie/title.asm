_TitleScreen:
	call ClearBGPalettes
	call ClearSprites
	call ClearTilemap

; Turn BG Map update off
	xor a
	ldh [hBGMapMode], a

; Reset timing variables
	ld hl, wJumptableIndex
	ld [hli], a ; wJumptableIndex
	ld [hli], a ; wIntroSceneFrameCounter
	ld [hli], a ; wTitleScreenTimer
	ld [hl], a  ; wTitleScreenTimer + 1

; VRAM bank 0
	ldh [rVBK], a

; Turn LCD off
	call DisableLCD

; Decompress the graphics
	ld hl, TitleScreenGFX1
	ld de, vTiles2
	call Decompress

	ld hl, TitleScreenGFX2
	ld de, vTiles1
	call Decompress

; Load the tilemap to the screen
	ld hl, TitleScreenTilemap
	ld de, wTilemap
	ld bc, TitleScreenTilemap.end - TitleScreenTilemap
	call CopyBytes

; Turn BG Map update on
	ld a, 1
	ldh [hBGMapMode], a

; Load the palette
	ld b, SCGB_TITLE_SCREEN
	call GetSGBLayout
	call SetPalettes

; Reset audio and turn the screen on
	call ChannelsOff
	call EnableLCD
	ret


TitleScreenGFX1:
IF DEF(_REDGOLD)
	INCBIN "gfx/title/title_rg_1.2bpp.lz"
ENDC
IF DEF(_BLUESILVER)
	INCBIN "gfx/title/title_bs_1.2bpp.lz"
ENDC

TitleScreenGFX2:
IF DEF(_REDGOLD)
	INCBIN "gfx/title/title_rg_2.2bpp.lz"
ENDC
IF DEF(_BLUESILVER)
	INCBIN "gfx/title/title_bs_2.2bpp.lz"
ENDC


TitleScreenTilemap:
IF DEF(_REDGOLD)
	INCBIN "gfx/title/title_rg.tilemap"
ENDC
IF DEF(_BLUESILVER)
	INCBIN "gfx/title/title_bs.tilemap"
ENDC
.end

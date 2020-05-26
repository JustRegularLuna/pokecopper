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
	ld de, vTiles1
	call Decompress

	ld hl, TitleScreenGFX2
	ld de, vTiles2 + $1E tiles
	call Decompress

; Fill the screen with background color
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, $80
	rst ByteFill

; Draw the Pokemon logo
	hlcoord 0, 0
	lb bc, 7, 20
	lb de, $80, $14
	call DrawTitleGraphic

; Draw Ho-oh/Lugia
	hlcoord 6, 8
	lb bc, 8, 8
	lb de, $1E, $08
	call DrawTitleGraphic

; Draw the dust
	ld a, $1A + 4
	hlcoord 0, 16
	ld b, 5
.dustLoop
	add -4
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	dec b
	jr nz, .dustLoop

; Draw the copyright text
	ld a, $19
	ld b, SCREEN_WIDTH
	hlcoord 0, 17
.copyrightLoop
	ld [hli], a
	dec b
	jr nz, .copyrightLoop
	hlcoord 3, 17
	lb bc, 1, 13
	lb de, $0c, 13
	call DrawTitleGraphic

; Turn BG Map update on
	ld a, 1
	ldh [hBGMapMode], a

; Load the palette
	ld b, SCGB_TITLE_SCREEN
	call GetSGBLayout
	call SetPalettes

; Reset audio and turn the screen on
	call ChannelsOff
	jp EnableLCD

DrawTitleGraphic:
; input:
;   hl: draw location
;   b: height
;   c: width
;   d: tile to start drawing from
;   e: number of tiles to advance for each bgrows
.bgrows
	push de
	push bc
	push hl
.col
	ld a, d
	ld [hli], a
	inc d
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	pop de
	ld a, e
	add d
	ld d, a
	dec b
	jr nz, .bgrows
	ret

TitleScreenGFX1:
IF DEF(_REDGOLD)
	INCBIN "gfx/title/logo_rg.2bpp.lz"
ELIF DEF(_BLUESILVER)
	INCBIN "gfx/title/logo_bs.2bpp.lz"
ENDC

TitleScreenGFX2:
IF DEF(_REDGOLD)
	INCBIN "gfx/title/title_hooh.2bpp.lz"
ELIF DEF(_BLUESILVER)
	INCBIN "gfx/title/title_lugia.2bpp.lz"
ENDC

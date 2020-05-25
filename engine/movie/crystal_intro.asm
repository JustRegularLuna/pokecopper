Copyright_GFPresents:
	ld de, MUSIC_NONE
	call PlayMusic
	call ClearBGPalettes
	call ClearTilemap
	ld a, HIGH(vBGMap0)
	ldh [hBGMapAddress + 1], a
	xor a ; LOW(vBGMap0)
	ldh [hBGMapAddress], a
	ldh [hJoyDown], a
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, $90
	ldh [hWY], a
	call WaitBGMap
	ld b, SCGB_GAMEFREAK_LOGO
	call GetSGBLayout
	call SetPalettes
	ld c, 10
	call DelayFrames
	farcall Copyright
	call WaitBGMap
	ld c, 100
	call DelayFrames
	call ClearTilemap
	farcall GBCOnlyScreen
	call .GetGFLogoGFX

	ld de, SFX_GAME_FREAK_LOGO_GS
	call PlaySFX

	ld de, .Logo
	hlcoord 8, 4
	call PlaceGamefreakIntroGraphic
	ld c, 30
	call DelayFrames

	ld de, .GameFreak
	hlcoord 5, 10
	call PlaceGamefreakIntroGraphic
	ld c, 50
	call DelayFrames

	ld de, .Presents
	hlcoord 7, 11
	call PlaceGamefreakIntroGraphic
	ld c, 100
	call DelayFrames

	call .StopGamefreakAnim
	scf
	ret

.GetGFLogoGFX:
	ld de, GameFreakLogo
	ld hl, vTiles2
	lb bc, BANK(GameFreakLogo), 28
	call Request2bpp
	farjp ClearSpriteAnims

.StopGamefreakAnim:
	farcall ClearSpriteAnims
	call ClearTilemap
	call ClearSprites
	ld c, 16
	jp DelayFrames

.Logo:
	db   $0D, $0E, $0F
	next $10, $11, $12
	next $13, $14, $15
	next $16, $17, $18
	next $19, $1A, $1B
	db   "@"

.GameFreak:
	db $00, $01, $02, $03, $0D, $04, $05, $03, $01, $06, "@"

.Presents:
	db $07, $08, $09, $0A, $0B, $0C, "@"

PlaceGamefreakIntroGraphic:
.loop
	ld a, [de]
	inc de
	cp "@"
	ret z
	cp "<NEXT>"
	jr z, .new_line
	ld [hli], a
	jr .loop

.new_line
	ld bc, SCREEN_WIDTH - 3
	add hl, bc
	jr .loop

GameFreakLogo:
INCBIN "gfx/splash/logo1.2bpp"
INCBIN "gfx/splash/logo2.2bpp"

SpaceworldIntro:
; TODO: Attempt to port the intro movie from Spaceworld over.
	ret

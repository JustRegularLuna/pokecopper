MovePlayerPicRight:
	hlcoord 6, 4
	ld de, 1
	jr MovePlayerPic

MovePlayerPicLeft:
	hlcoord 13, 4
	ld de, -1
	; fallthrough

MovePlayerPic:
; Move player pic at hl by de * 7 tiles.
	ld c, $8
.loop
	push bc
	push hl
	push de
	xor a
	ldh [hBGMapMode], a
	lb bc, 7, 7
	predef PlaceGraphic
	xor a
	ldh [hBGMapThird], a
	call WaitBGMap
	call DelayFrame
	pop de
	pop hl
	add hl, de
	pop bc
	dec c
	ret z
	push hl
	push bc
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	lb bc, 7, 7
	call ClearBox
	pop bc
	pop hl
	jr .loop

ShowRivalNamingChoices:
	ld hl, RivalNameMenuHeader
	jr ShowPlayerNamingChoices.GotGender

ShowPlayerNamingChoices:
	ld hl, HiroNameMenuHeader
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .GotGender
	ld hl, SylviaNameMenuHeader
.GotGender:
	call LoadMenuHeader
	call VerticalMenu
	ld a, [wMenuCursorY]
	dec a
	call CopyNameFromMenu
	jp CloseWindow

INCLUDE "data/player_names.asm"

GetPlayerIcon:
; Get the player icon corresponding to gender

; Male
	ld de, ChrisSpriteGFX
	ld b, BANK(ChrisSpriteGFX)

	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	ret z

; Female
	ld de, KrisSpriteGFX
	ld b, BANK(KrisSpriteGFX)
	ret

GetCardPic:
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	ld hl, HiroCardPic
	ld a, BANK(HiroCardPic)
	jr z, .GotPic
	ld hl, SylviaCardPic
	ld a, BANK(SylviaCardPic)
.GotPic:
	ld de, vTiles2 tile $00
	ld bc, $23 tiles
	call FarCopyBytes
	ld hl, CardGFX
	ld de, vTiles2 tile $23
	ld bc, 6 tiles
	ld a, BANK(CardGFX)
	jp FarCopyBytes

GetPlayerBackpic:
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr nz, GetSylviaBackpic
	; fallthrough

GetHiroBackpic:
	ld hl, HiroBackpic
	ld de, vTiles2 tile $31
	lb bc, BANK(HiroBackpic), 7 * 7
	predef_jump DecompressGet2bpp

GetSylviaBackpic:
	ld hl, SylviaBackpic
	ld de, vTiles2 tile $31
	lb bc, BANK(SylviaBackpic), 7 * 7
	predef_jump DecompressGet2bpp

HOF_LoadTrainerFrontpic:
	call WaitBGMap
	xor a
	ldh [hBGMapMode], a
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	ld a, HIRO
	jr z, .GotClass
	assert HIRO + 1 == SYLVIA
	inc a ; SYLVIA
.GotClass
	ld [wTrainerClass], a
	ld de, vTiles2
	farcall GetTrainerPic
	call WaitBGMap
	ld a, $1
	ldh [hBGMapMode], a
	ret

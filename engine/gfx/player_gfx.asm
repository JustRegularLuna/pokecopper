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
	call CloseWindow
	ret

INCLUDE "data/player_names.asm"

GetPlayerIcon:
; Get the player icon corresponding to gender

; Male
	ld de, ChrisSpriteGFX
	ld b, BANK(ChrisSpriteGFX)

	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .done

; Female
	ld de, KrisSpriteGFX
	ld b, BANK(KrisSpriteGFX)

.done
	ret

GetCardPic:
	ld hl, HiroCardPic
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .GotClass
	ld hl, SylviaCardPic
.GotClass:
	ld de, vTiles2 tile $00
	ld bc, $23 tiles
	ld a, BANK(HiroCardPic) ; aka BANK(SylviaCardPic)
	call FarCopyBytes
	ld hl, CardGFX
	ld de, vTiles2 tile $23
	ld bc, 6 tiles
	ld a, BANK(CardGFX)
	call FarCopyBytes
	ret

HiroCardPic:
INCBIN "gfx/trainer_card/hiro_card.2bpp"

SylviaCardPic:
INCBIN "gfx/trainer_card/sylvia_card.2bpp"

CardGFX:
INCBIN "gfx/trainer_card/trainer_card.2bpp"

GetPlayerBackpic:
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, GetHiroBackpic
	call GetSylviaBackpic
	ret

GetHiroBackpic:
	ld hl, HiroBackpic
	ld b, BANK(HiroBackpic)
	ld de, vTiles2 tile $31
	ld c, 7 * 7
	predef_jump DecompressGet2bpp

HOF_LoadTrainerFrontpic:
	call WaitBGMap
	xor a
	ldh [hBGMapMode], a
	ld [wTrainerClass], a
	ld de, HiroPic
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .GotPic
	ld de, SylviaPic

.GotPic:
	ld hl, vTiles2
	lb bc, BANK(HiroPic), 7 * 7 ; aka BANK(SylviaPic)
	call Get2bpp
	call WaitBGMap
	ld a, $1
	ldh [hBGMapMode], a
	ret

DrawIntroPlayerPic:
; Draw the player pic at (6,4).

; Get class
	xor a
	ld [wTrainerClass], a

; Load pic
	ld de, HiroPic
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .GotPic
	ld de, SylviaPic
.GotPic:
	ld hl, vTiles2
	lb bc, BANK(HiroPic), 7 * 7 ; aka BANK(SylviaPic)
	call Get2bpp

; Draw
	xor a
	ldh [hGraphicStartTile], a
	hlcoord 6, 4
	lb bc, 7, 7
	predef_jump PlaceGraphic

HiroPic:
INCBIN "gfx/player/hiro.2bpp"

SylviaPic:
INCBIN "gfx/player/sylvia.2bpp"

GetSylviaBackpic:
; Sylvia's backpic is uncompressed.
	ld de, SylviaBackpic
	ld hl, vTiles2 tile $31
	lb bc, BANK(SylviaBackpic), 7 * 7 ; dimensions
	call Get2bpp
	ret

SylviaBackpic:
INCBIN "gfx/player/sylvia_back.2bpp"

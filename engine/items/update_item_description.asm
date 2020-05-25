UpdateItemDescription::
; Print the description for the current item.
	ld a, [wMenuSelection]
	ld [wCurSpecies], a

	hlcoord 0, 12
	lb bc, 4, SCREEN_WIDTH - 2
	call Textbox

	ld a, [wMenuSelection]
	cp -1
	ret z

	decoord 1, 14

	ld a, [wCurSpecies]
	cp TM01
	jr c, .not_a_tm

	ld [wCurItem], a
	push de
	farcall GetTMHMItemMove
	pop hl
	ld a, [wTempTMHM]
	ld [wCurSpecies], a
	predef_jump PrintMoveDescription

.not_a_tm
	push de
	ld hl, ItemDescriptions
	ld a, [wCurSpecies]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	pop hl
	rst PlaceString
	ret

INCLUDE "data/items/descriptions.asm"

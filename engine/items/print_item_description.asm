PrintItemDescription:
; Print the description for item [wCurSpecies] at de.

	ld a, [wCurSpecies]
	cp TM01
	jr c, .not_a_tm

	ld [wCurItem], a
	push de
	farcall GetTMHMItemMove
	pop hl
	ld a, [wTempTMHM]
	ld [wCurSpecies], a
	predef_jump PrintMoveDesc

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

GetPredefPointer::
; Return the bank and address of hPredefID in a and hPredefAddress.

; Save hl for later (back in Predef)
	ld a, h
	ldh [hPredefTemp], a
	ld a, l
	ldh [hPredefTemp + 1], a

	push de
	ldh a, [hPredefID]
	ld e, a
	ld d, 0
	ld hl, PredefPointers
	add hl, de
	add hl, de
	add hl, de
	pop de

	ld a, [hli]
	ldh [hPredefAddress + 1], a
	ld a, [hli]
	ldh [hPredefAddress], a
	ld a, [hl]

	ret

INCLUDE "data/predef_pointers.asm"

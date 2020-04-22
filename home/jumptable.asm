StandardAnonJumpTable::
	ld a, [wJumptableIndex]
AnonJumpTable::
	pop hl
JumpTable::
	push de
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	pop de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

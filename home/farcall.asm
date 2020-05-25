FarCall_de::
; Call a:de.
; Preserves other registers.

	ldh [hTempBank], a
	ldh a, [hROMBank]
	push af
	ldh a, [hTempBank]
	rst Bankswitch
	call _de_
	jr ReturnFarCall

FarCall_hl::
; Call a:hl.
; Preserves other registers.

	ldh [hTempBank], a
	ldh a, [hROMBank]
	push af
	jr DoFarCall

_FarCall::
; Call the following dba pointer on the stack.
; Preserves a, bc, de, hl
	ldh [hFarCallSavedA], a
	ld a, h
	ldh [hPredefTemp + 1], a
	ld a, l
	ldh [hPredefTemp], a
	pop hl
	ld a, [hli]
	ldh [hTempBank], a
	add a
	jr c, .farjp
	inc hl
	inc hl
	push hl
	dec hl
	dec hl
.farjp
	ldh a, [hROMBank]
	push af
	ld a, [hli]
	ld h, [hl]
	ld l, a

DoFarCall:
	ldh a, [hTempBank]
	and $7f
	rst Bankswitch
	call RetrieveHLAndCallFunction

ReturnFarCall::
; We want to retain the contents of f.
; To do this, we can update its preserved value on the stack directly.

	ldh [hFarCallSavedA], a
	push af
	push hl
	ld hl, sp+$2 ; read f
	ld a, [hli]
	inc l ; faster than inc hl (stack is always c0xx)
	ld [hl], a ; write f
	pop hl
	pop af
	pop af
	rst Bankswitch
	ldh a, [hFarCallSavedA]
	ret

RetrieveHLAndCallFunction:
	push hl
	ld hl, hPredefTemp
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ldh a, [hFarCallSavedA]
	ret

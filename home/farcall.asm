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
	ldh a, [hTempBank]
	rst Bankswitch
	call _hl_

ReturnFarCall::
; We want to retain the contents of f.
; To do this, we can pop to bc instead of af.

	ld a, b
	ldh [hFarCallBCBuffer], a
	ld a, c
	ldh [hFarCallBCBuffer + 1], a

; Restore the working bank.
	pop bc
	ld a, b
	rst Bankswitch

	ldh a, [hFarCallBCBuffer]
	ld b, a
	ldh a, [hFarCallBCBuffer + 1]
	ld c, a
	ret

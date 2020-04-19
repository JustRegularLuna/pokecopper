Cosine::
; a = d * cos(a * pi/32)
	add %010000 ; cos(x) = sin(x + pi/2)
	; fallthrough
Sine::
; a = d * sin(a * pi/32)
	ld e, a
	ldh a, [hROMBank]
	push af
	ld a, BANK(_Sine)
	rst Bankswitch
	call _Sine
	ld e, a
	pop af
	rst Bankswitch
	ld a, e
	ret

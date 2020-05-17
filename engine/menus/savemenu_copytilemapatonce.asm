SaveMenu_CopyTilemapAtOnce:
	ldh a, [hCGB]
	and a
	jp z, WaitBGMap

; The following is a modified version of CopyTilemapAtOnce
; that waits for [rLY] to be $60 instead of $80 - 1.
	ldh a, [hBGMapMode]
	push af
	xor a
	ldh [hBGMapMode], a

	ldh a, [hMapAnims]
	push af
	xor a
	ldh [hMapAnims], a

.wait
	ldh a, [rLY]
	cp $60
	jr c, .wait

	di
	ld a, BANK(vBGMap2)
	ldh [rVBK], a
	hlcoord 0, 0, wAttrmap
	call CopyBGMapViaStack
	ld a, BANK(vBGMap0)
	ldh [rVBK], a
	hlcoord 0, 0
	call CopyBGMapViaStack

.wait2
	ldh a, [rLY]
	cp $60
	jr c, .wait2
	ei

	pop af
	ldh [hMapAnims], a
	pop af
	ldh [hBGMapMode], a
	ret

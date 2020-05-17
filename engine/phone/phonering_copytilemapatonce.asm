PhoneRing_CopyTilemapAtOnce:
	ldh a, [hCGB]
	and a
	jp z, WaitBGMap
	ld a, [wSpriteUpdatesEnabled]
	and a
	jp z, WaitBGMap

; The following is a modified version of CopyTilemapAtOnce
; that waits for [rLY] to be LY_VBLANK - 1 instead of $80 - 1.
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
	cp LY_VBLANK - 1
	jr c, .wait

	di
	ld a, BANK(vBGMap2)
	ldh [rVBK], a
	hlcoord 0, 0, wAttrmap
	call CopyBGMapViaStack
	xor a ; BANK(vBGMap0)
	ldh [rVBK], a
	hlcoord 0, 0
	call CopyBGMapViaStack

.wait2
	ldh a, [rLY]
	cp LY_VBLANK - 1
	jr c, .wait2
	ei

	pop af
	ldh [hMapAnims], a
	pop af
	ldh [hBGMapMode], a
	ret

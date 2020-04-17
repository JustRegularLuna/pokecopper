PhoneRing_CopyTilemapAtOnce:
	ldh a, [hCGB]
	and a
	jp z, WaitBGMap
	ld a, [wSpriteUpdatesEnabled]
	and a
	jp z, WaitBGMap

; What follows is a modified version of CopyTilemapAtOnce.
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
	call .CopyTilemapAtOnce
	ld a, BANK(vBGMap0)
	ldh [rVBK], a
	hlcoord 0, 0
	call .CopyTilemapAtOnce
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

.CopyTilemapAtOnce:
	ld [hSPBuffer], sp
	ld sp, hl
	ldh a, [hBGMapAddress + 1]
	ld h, a
	ld l, 0
	ld a, SCREEN_HEIGHT
	ldh [hTilesPerCycle], a
	lb bc, 1 << 1, LOW(rSTAT) ; not in v/hblank

.loop
rept SCREEN_WIDTH / 2
	pop de
.loop\@
	ldh a, [c]
	and b
	jr nz, .loop\@
	ld [hl], e
	inc l
	ld [hl], d
	inc l
endr

	ld de, BG_MAP_WIDTH - SCREEN_WIDTH
	add hl, de
	ldh a, [hTilesPerCycle]
	dec a
	ldh [hTilesPerCycle], a
	jr nz, .loop

	ldh a, [hSPBuffer]
	ld l, a
	ldh a, [hSPBuffer + 1]
	ld h, a
	ld sp, hl
	ret

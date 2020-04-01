SwapTextboxPalettes::
	hlcoord 0, 0
	decoord 0, 0, wAttrMap
	ld b, SCREEN_HEIGHT
.loop
	push bc
	ld c, SCREEN_WIDTH
.innerloop
	xor a
	bit 7, [hl]
	jr z, .next
	set OAM_TILE_BANK, a
.next
	ld [de], a
	res 7, [hl]
	inc hl
	inc de
	dec c
	jr nz, .innerloop
	pop bc
	dec b
	jr nz, .loop
	ret

ScrollBGMapPalettes::
	ld hl, wBGMapBuffer
	ld de, wBGMapPalBuffer
.loop
	xor a
	bit 7, [hl]
	jr z, .next
	set OAM_TILE_BANK, a
.next
	ld [de], a
	res 7, [hl]
	inc hl
	inc de
	dec c
	jr nz, .loop
	ret

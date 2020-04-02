SwapTextboxPalettes::
	hlcoord 0, 0
	decoord 0, 0, wAttrMap
	ld b, SCREEN_HEIGHT
.loop
	push bc
	ld c, SCREEN_WIDTH
	call GetBGMapTilePalettes
	pop bc
	dec b
	jr nz, .loop
	ret

ScrollBGMapPalettes::
	ld hl, wBGMapBuffer
	ld de, wBGMapPalBuffer
	; fallthrough
GetBGMapTilePalettes:
.loop
	xor a
	bit 7, [hl]
	jr z, .next
	or VRAM_BANK_1
.next
	ld [de], a
	res 7, [hl]
	inc hl
	inc de
	dec c
	jr nz, .loop
	ret

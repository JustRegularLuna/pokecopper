_LoadMapPart::
	ld hl, wSurroundingTiles
	ld a, [wMetatileStandingY]
	and a
	jr z, .top_row
	ld bc, SURROUNDING_WIDTH * 2
	add hl, bc

.top_row
	ld a, [wMetatileStandingX]
	and a
	jr z, .left_column
	inc hl
	inc hl

.left_column
	decoord 0, 0
	ld b, SCREEN_HEIGHT
.loop
	ld c, SCREEN_WIDTH
.loop2
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop2
	ld a, l
	add METATILE_WIDTH
	ld l, a
	adc h
	sub l
	ld h, a
	dec b
	jr nz, .loop
	ret

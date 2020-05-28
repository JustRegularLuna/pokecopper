HBlankCopy1bpp:
	di
	ld [hSPBuffer], sp

; Source
	ld hl, hRequestedVTileSource
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld sp, hl

; Destination
	ld hl, hRequestedVTileDest
	ld a, [hli]
	ld h, [hl]
	ld l, a

	jr .innerLoop

.outerLoop
	ldh a, [rLY]
	cp LY_REQUEST
	jr nc, ContinueHBlankCopy

.innerLoop
	pop bc
	pop de

.waitNoHBlank
	ldh a, [rSTAT]
	and %11
	jr z, .waitNoHBlank

.waitHBlank
	ldh a, [rSTAT]
	and %11
	jr nz, .waitHBlank

	ld a, c
	ld [hli], a
	ld [hli], a
	ld a, b
	ld [hli], a
	ld [hli], a
	ld a, e
	ld [hli], a
	ld [hli], a
	ld a, d
	ld [hli], a
	ld [hli], a

	ld a, l
	and $f
	jr nz, .innerLoop

	ldh a, [hTilesPerCycle]
	dec a
	ldh [hTilesPerCycle], a
	jr nz, .outerLoop

	jr DoneHBlankCopy

ContinueHBlankCopy:
	ld [hRequestedVTileSource], sp
	ld sp, hl
	ld [hRequestedVTileDest], sp
	scf
	; fallthrough

DoneHBlankCopy:
	ldh a, [hSPBuffer]
	ld l, a
	ldh a, [hSPBuffer + 1]
	ld h, a
	ld sp, hl
	reti

HBlankCopy2bpp::
	di
	ld [hSPBuffer], sp

; Source
	ld hl, hRequestedVTileSource
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld sp, hl

; Destination
	ld hl, hRequestedVTileDest
	ld a, [hli]
	ld h, [hl]
	ld l, a

	sub HIGH(VRAM_Begin)
	cp HIGH(VRAM_End) - HIGH(VRAM_Begin)
	jr nc, .innerLoop
	jp HBlankCopyVRAM

.outerLoop
	ldh a, [rLY]
	cp LY_REQUEST
	jr nc, ContinueHBlankCopy

.innerLoop
	pop bc
	pop de

.waitNoHBlank
	ldh a, [rSTAT]
	and %11
	jr z, .waitNoHBlank

.waitHBlank
	ldh a, [rSTAT]
	and %11
	jr nz, .waitHBlank

	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
rept 2
	pop de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
endr

	ld a, l
	and $f
	jr nz, .innerLoop

	ldh a, [hTilesPerCycle]
	dec a
	ldh [hTilesPerCycle], a
	jr nz, .outerLoop

	jr DoneHBlankCopy

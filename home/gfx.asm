; Functions to copy data from ROM.

Get2bppViaHDMA::
	ldh a, [rLCDC]
	bit rLCDC_ENABLE, a
	jp z, Copy2bpp

	homecall HDMATransfer2bpp

	ret

Get1bppViaHDMA::
	ldh a, [rLCDC]
	bit rLCDC_ENABLE, a
	jp z, Copy1bpp

	homecall HDMATransfer1bpp

	ret

FarCopyBytesDouble_DoubleBankSwitch::
	ldh [hTempBank], a
	ldh a, [hROMBank]
	push af
	ldh a, [hTempBank]
	rst Bankswitch

	call FarCopyBytesDouble

	pop af
	rst Bankswitch
	ret

ReplaceKrisSprite::
	farjp _ReplaceKrisSprite

LoadStandardFont::
	farjp _LoadStandardFont

LoadFontsBattleExtra::
	farjp _LoadFontsBattleExtra

LoadFontsExtra::
	farjp LoadFrame

DecompressRequest2bpp::
	push de
	ld a, BANK(sScratch)
	call GetSRAMBank
	push bc

	ld de, sScratch
	ld a, b
	call FarDecompress

	pop bc
	pop hl

	ld de, sScratch
	call Get2bpp
	jp CloseSRAM

FarCopyBytes::
; copy bc bytes from a:hl to de

	ldh [hTempBank], a
	ldh a, [hROMBank]
	push af
	ldh a, [hTempBank]
	rst Bankswitch

	rst CopyBytes

	pop af
	rst Bankswitch
	ret

FarCopyBytesDouble:
; Copy bc bytes from a:hl to bc*2 bytes at de,
; doubling each byte in the process.

	ldh [hTempBank], a
	ldh a, [hROMBank]
	push af
	ldh a, [hTempBank]
	rst Bankswitch

	call SwapHLDE

	inc b
	inc c
	jr .dec

.loop
	ld a, [de]
	inc de
	ld [hli], a
	ld [hli], a
.dec
	dec c
	jr nz, .loop
	dec b
	jr nz, .loop

	pop af
	rst Bankswitch
	ret

Request2bpp::
; Load 2bpp at b:de to occupy c tiles of hl.
	ldh a, [hBGMapMode]
	push af
	xor a
	ldh [hBGMapMode], a

	ldh a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch

	call WriteVCopyRegistersToHRAM

	ldh a, [rLY]
	cp LY_REQUEST
	jr c, .handleLoop
.loop
	ldh a, [hTilesPerCycle]
	sub TILES_PER_BLANK
	ldh [hTilesPerCycle], a
	jr c, .copyRemainingTilesAndExit
	jr nz, .copyEightTilesAndContinue
.copyRemainingTilesAndExit
	add TILES_PER_BLANK
	ldh [hRequested2bpp], a
	xor a
	ldh [hTilesPerCycle], a
	call DelayFrame
	ldh a, [hRequested2bpp]
	and a
	jr nz, .addUncopiedTilesToCount
	xor a
	ldh [hTilesPerCycle], a
	jr .done

.addUncopiedTilesToCount
	ld b, a
	ldh a, [hTilesPerCycle]
	add b
	ldh [hTilesPerCycle], a
	jr .handleLoop

.copyEightTilesAndContinue
	ld a, TILES_PER_BLANK
	ldh [hRequested2bpp], a
	call DelayFrame
	ldh a, [hRequested2bpp]
	and a
	jr nz, .addUncopiedTilesToCount
.handleLoop
	call HBlankCopy2bpp
	jr c, .loop
.done
	pop af
	rst Bankswitch

	pop af
	ldh [hBGMapMode], a
	ret

Request1bpp::
; Load 1bpp at b:de to occupy c tiles of hl.
	ldh a, [hBGMapMode]
	push af
	xor a
	ldh [hBGMapMode], a

	ldh a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch

	call WriteVCopyRegistersToHRAM

	ldh a, [rLY]
	cp LY_REQUEST
	jr c, .handleLoop
.loop
	ldh a, [hTilesPerCycle]
	sub TILES_PER_BLANK
	ldh [hTilesPerCycle], a
	jr c, .copyRemainingTilesAndExit
	jr nz, .copyEightTilesAndContinue
.copyRemainingTilesAndExit
	add TILES_PER_BLANK
	ldh [hTilesPerCycle], a
	xor a
	ldh [hTilesPerCycle], a
	call DelayFrame
	ldh a, [hRequested1bpp]
	and a
	jr nz, .addUncopiedTilesToCount
	xor a
	ldh [hTilesPerCycle], a
	jr .done

.addUncopiedTilesToCount
	ld b, a
	ldh a, [hTilesPerCycle]
	add b
	ldh [hTilesPerCycle], a
	jr .handleLoop

.copyEightTilesAndContinue
	ld a, TILES_PER_BLANK
	ldh [hRequested1bpp], a
	call DelayFrame
	ldh a, [hRequested1bpp]
	and a
	jr nz, .addUncopiedTilesToCount
.handleLoop
	call HBlankCopy1bpp
	jr c, .loop
.done
	pop af
	rst Bankswitch

	pop af
	ldh [hBGMapMode], a
	ret

WriteVCopyRegistersToHRAM:
	ld a, c
	ldh [hTilesPerCycle], a
	ld a, e
	ldh [hRequestedVTileSource], a
	ld a, d
	ldh [hRequestedVTileSource + 1], a
	ld a, l
	ldh [hRequestedVTileDest], a
	ld a, h
	ldh [hRequestedVTileDest + 1], a
	ret

Get2bpp::
	ldh a, [rLCDC]
	bit rLCDC_ENABLE, a
	jp nz, Request2bpp

Copy2bpp:
; copy c 2bpp tiles from b:de to hl

	call SwapHLDE

; bank
	ld a, b

; bc = c * $10
	push af
	swap c
	ld a, $f
	and c
	ld b, a
	ld a, $f0
	and c
	ld c, a
	pop af

	jp FarCopyBytes

Get1bpp::
	ldh a, [rLCDC]
	bit rLCDC_ENABLE, a
	jp nz, Request1bpp

Copy1bpp::
; copy c 1bpp tiles from b:de to hl

	push de
	ld d, h
	ld e, l

; bank
	ld a, b

; bc = c * $10 / 2
	push af
	ld h, 0
	ld l, c
	add hl, hl
	add hl, hl
	add hl, hl
	ld b, h
	ld c, l
	pop af

	pop hl
	jp FarCopyBytesDouble

HBlankCopyVRAM:
	lb bc, %11, rSTAT & $ff
	jr .waitNoHBlank

.outerLoop
	ldh a, [rLY]
	cp LY_REQUEST
	jp nc, ContinueHBlankCopy

.waitNoHBlank
	ldh a, [c]
	and b
	jr z, .waitNoHBlank

.waitHBlank
	ldh a, [c]
	and b
	jr nz, .waitHBlank

rept 4
	pop de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
endr

	ld a, l
	and $f
	jr nz, .waitNoHBlank

	ldh a, [hTilesPerCycle]
	dec a
	ldh [hTilesPerCycle], a
	jr nz, .outerLoop

	jp DoneHBlankCopy

; Functions to copy data from ROM.

Get2bpp_2::
	ldh a, [rLCDC]
	bit rLCDC_ENABLE, a
	jp z, Copy2bpp

	homecall _Get2bpp

	ret

Get1bpp_2::
	ldh a, [rLCDC]
	bit rLCDC_ENABLE, a
	jp z, Copy1bpp

	homecall _Get1bpp

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
	farcall _ReplaceKrisSprite
	ret

LoadStandardFont::
	farcall _LoadStandardFont
	ret

LoadFontsBattleExtra::
	farcall _LoadFontsBattleExtra
	ret

LoadFontsExtra::
	farcall _LoadFontsExtra1
	farcall _LoadFontsExtra2
	ret

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
	call Request2bpp
	jp CloseSRAM

FarCopyBytes::
; copy bc bytes from a:hl to de

	ldh [hTempBank], a
	ldh a, [hROMBank]
	push af
	ldh a, [hTempBank]
	rst Bankswitch

	call CopyBytes

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

; switcheroo, de <> hl
	ld a, h
	ld h, d
	ld d, a
	ld a, l
	ld l, e
	ld e, a

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

	ldh a, [hTilesPerCycle]
	push af
	ld a, $8
	ldh [hTilesPerCycle], a

	ld a, e
	ld [wRequested2bppSource], a
	ld a, d
	ld [wRequested2bppSource + 1], a
	ld a, l
	ld [wRequested2bppDest], a
	ld a, h
	ld [wRequested2bppDest + 1], a
.loop
	ld a, c
	ld hl, hTilesPerCycle
	cp [hl]
	jr nc, .iterate

	ld [wRequested2bpp], a
.wait
	call DelayFrame
	ld a, [wRequested2bpp]
	and a
	jr nz, .wait

	pop af
	ldh [hTilesPerCycle], a

	pop af
	rst Bankswitch

	pop af
	ldh [hBGMapMode], a
	ret

.iterate
	ldh a, [hTilesPerCycle]
	ld [wRequested2bpp], a

.wait2
	call DelayFrame
	ld a, [wRequested2bpp]
	and a
	jr nz, .wait2

	ld a, c
	ld hl, hTilesPerCycle
	sub [hl]
	ld c, a
	jr .loop

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

	ldh a, [hTilesPerCycle]
	push af
	ld a, $8
	ldh [hTilesPerCycle], a

	ld a, e
	ld [wRequested1bppSource], a
	ld a, d
	ld [wRequested1bppSource + 1], a
	ld a, l
	ld [wRequested1bppDest], a
	ld a, h
	ld [wRequested1bppDest + 1], a
.loop
	ld a, c
	ld hl, hTilesPerCycle
	cp [hl]
	jr nc, .iterate

	ld [wRequested1bpp], a
.wait
	call DelayFrame
	ld a, [wRequested1bpp]
	and a
	jr nz, .wait

	pop af
	ldh [hTilesPerCycle], a

	pop af
	rst Bankswitch

	pop af
	ldh [hBGMapMode], a
	ret

.iterate
	ldh a, [hTilesPerCycle]
	ld [wRequested1bpp], a

.wait2
	call DelayFrame
	ld a, [wRequested1bpp]
	and a
	jr nz, .wait2

	ld a, c
	ld hl, hTilesPerCycle
	sub [hl]
	ld c, a
	jr .loop

Get2bpp::
	ldh a, [rLCDC]
	bit rLCDC_ENABLE, a
	jp nz, Request2bpp

Copy2bpp:
; copy c 2bpp tiles from b:de to hl

	push hl
	ld h, d
	ld l, e
	pop de

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

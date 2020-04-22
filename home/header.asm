; rst vectors (called through the rst instruction)

SECTION "rst0", ROM0[$0000]
	di
	jp Start

	ds 4 ; unused

SECTION "rst8", ROM0[$0008]
FarCall::
	jp FarCall_hl

	ds 5 ; unused

SECTION "rst10", ROM0[$0010]
Bankswitch::
	ldh [hROMBank], a
	ld [MBC3RomBank], a
DoNothing::
	ret

	ds 2 ; unused

SECTION "rst18", ROM0[$0018]
	rst $38

	ds 7 ; unused

SECTION "rst20", ROM0[$0020]
	rst $38

	ds 7 ; unused

SECTION "rst28", ROM0[$0028]
JumpTable::
	push de
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
; SECTION "rst30", ROM0[$0030]
	ld l, a
	pop de
	jp hl

	ds 5 ; unused

SECTION "rst38", ROM0[$0038]
	rst $38

	ds 7 ; unused


; Game Boy hardware interrupts

SECTION "vblank", ROM0[$0040]
	jp VBlank

	ds 5 ; unused

SECTION "lcd", ROM0[$0048]
	jp LCD

	ds 5 ; unused

SECTION "timer", ROM0[$0050]
	reti

	ds 7 ; unused

SECTION "serial", ROM0[$0058]
	jp Serial

	ds 5 ; unused

SECTION "joypad", ROM0[$0060]
	reti

	ds 7 ; unused


SECTION "High Home", ROM0[$0068]

	ds 152 ; unused


SECTION "Header", ROM0[$0100]

Start::
; Nintendo requires all Game Boy ROMs to begin with a nop ($00) and a jp ($C3)
; to the starting address.
	nop ; no-optimize nops
	jp _Start

; The Game Boy cartridge header data is patched over by rgbfix.
; This makes sure it doesn't get used for anything else.

	ds $0150 - @, $00

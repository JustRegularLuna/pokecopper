; rst vectors (called through the rst instruction)

SECTION "rst0 EntryPoint", ROM0[$0000]
EntryPoint::
	di
	jp Start

	ds 4 ; unused

SECTION "rst8 FarCall", ROM0[$0008]
FarCall::
	jp _FarCall

	ds 5 ; unused

SECTION "rst10 Bankswitch", ROM0[$0010]
Bankswitch::
	ldh [hROMBank], a
	ld [MBC3RomBank], a
DoNothing::
	ret

	ds 2 ; unused

SECTION "rst18 AddNTimes", ROM0[$0018]
AddNTimes::
	jp _AddNTimes

	ds 5 ; unused

SECTION "rst20 CopyBytes", ROM0[$0020]
CopyBytes::
	jp _CopyBytes

	ds 5 ; unused

SECTION "rst28 ByteFill", ROM0[$0028]
ByteFill::
	jp _ByteFill

	ds 5 ; unused

SECTION "rst30 PlaceString", ROM0[$0030]
PlaceString::
	jp _PlaceString

	ds 5 ; unused

SECTION "rst38 Predef", ROM0[$0038]
Predef::
	jp _Predef

	ds 5 ; unused


; Game Boy hardware interrupts

SECTION "vblank", ROM0[$0040]
	jp VBlank

	ds 5 ; unused

SECTION "lcd", ROM0[$0048]
	jp LCD

	ds 5 ; unused

SECTION "timer", ROM0[$0050]
; TIMER interrupt is never enabled
	reti

	ds 7 ; unused

SECTION "serial", ROM0[$0058]
	jp Serial

	ds 5 ; unused

SECTION "joypad", ROM0[$0060]
; JOYPAD interrupt is never enabled
	reti

INCLUDE "home/hblank.asm"


SECTION "Header", ROM0[$0100]

Start::
; Nintendo requires all Game Boy ROMs to begin with a nop ($00) and a jp ($C3)
; to the starting address.
	nop ; no-optimize nops
	jp _Start

; The Game Boy cartridge header data is patched over by rgbfix.
; This makes sure it doesn't get used for anything else.

	ds $0150 - @, $00

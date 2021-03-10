LoadFishingGFX:
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr nz, .girl

	ld de, FishingGFX
	ld hl, vTiles0 tile $02
	lb bc, BANK(FishingGFX), 2
	call Get2bpp

	ld de, FishingGFX tile $02
	ld hl, vTiles0 tile $06
	lb bc, BANK(FishingGFX), 2
	call Get2bpp

	ld de, FishingGFX tile $04
	ld hl, vTiles0 tile $0a
	lb bc, BANK(FishingGFX), 2
	call Get2bpp

	ld de, FishingGFX tile $06
	ld hl, vTiles0 tile $fc
	lb bc, BANK(FishingGFX), 2
	call Get2bpp
	ret

.girl
	ld de, FishingGFX_F
	ld hl, vTiles0 tile $02
	lb bc, BANK(FishingGFX_F), 2
	call Get2bpp

	ld de, FishingGFX_F tile $02
	ld hl, vTiles0 tile $06
	lb bc, BANK(FishingGFX_F), 2
	call Get2bpp

	ld de, FishingGFX_F tile $04
	ld hl, vTiles0 tile $0a
	lb bc, BANK(FishingGFX_F), 2
	call Get2bpp

	ld de, FishingGFX_F tile $06
	ld hl, vTiles0 tile $fc
	lb bc, BANK(FishingGFX_F), 2
	call Get2bpp
	ret

FishingGFX:
INCBIN "gfx/overworld/hiro_fish.2bpp"

FishingGFX_F:
INCBIN "gfx/overworld/sylvia_fish.2bpp"

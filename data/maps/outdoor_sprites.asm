; Valid sprite IDs for each map group.
; Maps with environment ROUTE or TOWN can only use these sprites.

OutdoorSprites:
; entries correspond to map groups
	dw CableClubGroupSprites
	dw SilentGroupSprites
	dw PokemonLeagueGroupSprites

CableClubGroupSprites:
; (no outdoor maps)
	; 0 of 9 walking sprites
	db 0 ; end

SilentGroupSprites:
; SilentHills
	; 0 of 9 walking sprites
	db 0 ; end

PokemonLeagueGroupSprites:
; (no outdoor maps)
	; 0 of 9 walking sprites
	db 0 ; end

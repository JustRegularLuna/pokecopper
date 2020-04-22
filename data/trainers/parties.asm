INCLUDE "constants.asm"

; Trainer data structure:
; - db "NAME@", TRAINERTYPE_* constants |ed together
; - 1 to 6 Pokémon:
;    * in all cases:              db level, species
;    * with TRAINERTYPE_NICKNAME: db "NICKNAME@"
;    * with TRAINERTYPE_DVS:      db atk|def dv, spd|spc dv
;    * with TRAINERTYPE_STAT_EXP: dw hp, atk, def, spd, spc
;    * with TRAINERTYPE_ITEM:     db item
;    * with TRAINERTYPE_MOVES:    db move 1, move 2, move 3, move 4
; - db -1 ; end


SECTION "PokemonProfGroup", ROMX

PokemonProfGroup::
	; POKEMON_PROF (1)
	db "OAK@", TRAINERTYPE_NORMAL
	db 5, EEVEE
	db -1 ; end


SECTION "HiroGroup", ROMX

HiroGroup::
	; HIRO1
	db "HIRO@", TRAINERTYPE_NORMAL
	db 5, EEVEE
	db -1 ; end


SECTION "SylviaGroup", ROMX

SylviaGroup::
	; SYLVIA1
	db "SYLVIA@", TRAINERTYPE_NORMAL
	db 5, EEVEE
	db -1 ; end


SECTION "Rival1Group", ROMX

Rival1Group::
; TODO: Johto starters once added
	; RIVAL1_LAB_STARTER1
	db "<RIVAL>@", TRAINERTYPE_NORMAL
	db 5, SQUIRTLE
	db -1 ; end

	; RIVAL1_LAB_STARTER2
	db "<RIVAL>@", TRAINERTYPE_NORMAL
	db 5, BULBASAUR
	db -1 ; end

	; RIVAL1_LAB_STARTER2
	db "<RIVAL>@", TRAINERTYPE_NORMAL
	db 5, CHARMANDER
	db -1 ; end

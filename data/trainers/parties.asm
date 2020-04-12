INCLUDE "data/trainers/party_pointers.asm"

Trainers:
; Trainer data structure:
; - db "NAME@", TRAINERTYPE_* constant
; - 1 to 6 Pokémon:
;    * for TRAINERTYPE_NORMAL:     db level, species
;    * for TRAINERTYPE_MOVES:      db level, species, 4 moves
;    * for TRAINERTYPE_ITEM:       db level, species, item
;    * for TRAINERTYPE_ITEM_MOVES: db level, species, item, 4 moves
; - db -1 ; end

PokemonProfGroup:
	; POKEMON_PROF (1)
	db "OAK@", TRAINERTYPE_NORMAL
	db 5, EEVEE
	db -1 ; end

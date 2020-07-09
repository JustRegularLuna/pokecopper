; Valid sprite IDs for each map group.
; Maps with environment ROUTE or TOWN can only use these sprites.

OutdoorSprites:
; entries correspond to map groups
	dw CableClubGroupSprites
	dw SilentGroupSprites
	dw SakuraGroupSprites
	dw PokemonLeagueGroupSprites

CableClubGroupSprites:
; (no outdoor maps)
	db SPRITE_OAK
	db SPRITE_FISHER
	db SPRITE_TEACHER
	db SPRITE_TWIN
	db SPRITE_POKEFAN_M
	db SPRITE_GRAMPS
	db SPRITE_FAIRY
	db SPRITE_SILVER
	db SPRITE_FISHING_GURU
	db SPRITE_POKE_BALL
	db SPRITE_POKEDEX

SilentGroupSprites:
SakuraGroupSprites:
; SilentHills
; Sakura Town
	db SPRITE_SILVER
	db SPRITE_TEACHER
	db SPRITE_FISHER
	db SPRITE_COOLTRAINER_M
	db SPRITE_YOUNGSTER
	db SPRITE_MONSTER
	db SPRITE_GRAMPS
	db SPRITE_BUG_CATCHER
	db SPRITE_COOLTRAINER_F
	db SPRITE_POKE_BALL
	db SPRITE_FRUIT_TREE

PokemonLeagueGroupSprites:
; (no outdoor maps)
	db SPRITE_POKEFAN_M
	db SPRITE_BEAUTY
	db SPRITE_GRAMPS
	db SPRITE_YOUNGSTER
	db SPRITE_FISHER
	db SPRITE_TEACHER
	db SPRITE_SUPER_NERD
	db SPRITE_MACHOP
	db SPRITE_BIKER
	db SPRITE_POKE_BALL
	db SPRITE_BOULDER

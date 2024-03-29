InitialEvents:
	dw EVENT_BUG_CATCHING_CONTESTANT_1A
	dw EVENT_BUG_CATCHING_CONTESTANT_2A
	dw EVENT_BUG_CATCHING_CONTESTANT_3A
	dw EVENT_BUG_CATCHING_CONTESTANT_4A
	dw EVENT_BUG_CATCHING_CONTESTANT_5A
	dw EVENT_BUG_CATCHING_CONTESTANT_6A
	dw EVENT_BUG_CATCHING_CONTESTANT_7A
	dw EVENT_BUG_CATCHING_CONTESTANT_8A
	dw EVENT_BUG_CATCHING_CONTESTANT_9A
	dw EVENT_BUG_CATCHING_CONTESTANT_10A
	dw EVENT_BUG_CATCHING_CONTESTANT_1B
	dw EVENT_BUG_CATCHING_CONTESTANT_2B
	dw EVENT_BUG_CATCHING_CONTESTANT_3B
	dw EVENT_BUG_CATCHING_CONTESTANT_4B
	dw EVENT_BUG_CATCHING_CONTESTANT_5B
	dw EVENT_BUG_CATCHING_CONTESTANT_6B
	dw EVENT_BUG_CATCHING_CONTESTANT_7B
	dw EVENT_BUG_CATCHING_CONTESTANT_8B
	dw EVENT_BUG_CATCHING_CONTESTANT_9B
	dw EVENT_BUG_CATCHING_CONTESTANT_10B
	dw EVENT_PLAYERS_HOUSE_2F_CONSOLE
	dw EVENT_PLAYERS_HOUSE_2F_DOLL_1
	dw EVENT_PLAYERS_HOUSE_2F_DOLL_2
	dw EVENT_PLAYERS_HOUSE_2F_BIG_DOLL
	dw EVENT_DECO_BED_1
	dw EVENT_DECO_POSTER_1
	dw EVENT_PLAYERS_HOUSE_MOM_2
	dw EVENT_LANCES_ROOM_OAK_AND_MARY
	dw -1 ; end

InitialEngineFlags:
	dw ENGINE_ROCKET_SIGNAL_ON_CH20
	dw ENGINE_ROCKETS_IN_MAHOGANY
	dw -1 ; end

InitialVariableSprites:
MACRO initvarsprite
; variable sprite, appearance sprite
	db \1 - SPRITE_VARS, \2
ENDM
	initvarsprite SPRITE_FUCHSIA_GYM_1, SPRITE_JANINE
	initvarsprite SPRITE_FUCHSIA_GYM_2, SPRITE_JANINE
	initvarsprite SPRITE_FUCHSIA_GYM_3, SPRITE_JANINE
	initvarsprite SPRITE_FUCHSIA_GYM_4, SPRITE_JANINE
	initvarsprite SPRITE_COPYCAT, SPRITE_LASS
	initvarsprite SPRITE_JANINE_IMPERSONATOR, SPRITE_LASS
	db -1 ; end

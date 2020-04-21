spawn: MACRO
; map, x, y
	map_id \1
	db \2, \3
ENDM

SpawnPoints:
; entries correspond to SPAWN_* constants
	spawn PLAYERS_HOUSE_2F,              3,  3
; kanto
	spawn INDIGO_PLATEAU_POKECENTER_1F,  7,  9
; johto
	spawn SILENT_HILLS,                 15,  8

	spawn N_A,                          -1, -1

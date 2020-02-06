	object_const_def ; object_event constants

BattleTowerOutside_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BattleTowerOutside_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  8, 21, NEW_BARK_TOWN, 2
	warp_event  9, 21, NEW_BARK_TOWN, 2
	warp_event  8,  9, BATTLE_TOWER_1F, 1
	warp_event  9,  9, BATTLE_TOWER_1F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events

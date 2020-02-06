	object_const_def ; object_event constants

NewBarkTown_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_NEW_BARK
	clearevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	return

NewBarkTown_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 15,  7, PLAYERS_HOUSE_1F, 1
	warp_event  3,  7, BATTLE_TOWER_OUTSIDE, 1
	warp_event  9,  3, INDIGO_PLATEAU_POKECENTER_1F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events

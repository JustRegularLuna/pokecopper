SilentHills_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, SilentHills_FlyPointCallback

SilentHills_MapEvents:
	db 2 ; warp events
	warp_event 15,  7, PLAYERS_HOUSE_1F, 1
	warp_event  9,  3, INDIGO_PLATEAU_POKECENTER_1F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events

	object_const_def ; object_event constants


SilentHills_FlyPointCallback:
	setflag ENGINE_FLYPOINT_NEW_BARK
	clearevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	return

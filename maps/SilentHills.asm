SilentHills_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, SilentHills_FlyPointCallback

SilentHills_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5,  5, PLAYERS_HOUSE_1F, 1
	warp_event 11,  5, INDIGO_PLATEAU_POKECENTER_1F, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 12,  8, BGEVENT_READ, SafariBattleTestScript

	db 0 ; object events

	object_const_def ; object_event constants


SilentHills_FlyPointCallback:
	setflag ENGINE_FLYPOINT_SILENT
	clearevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	return

SafariBattleTestScript:
	giveitem GREAT_BALL, 5
	loadwildmon HAUNTER, 30
	loadvar VAR_BATTLETYPE, BATTLETYPE_GHOST
	startbattle
	reloadmapafterbattle
	end

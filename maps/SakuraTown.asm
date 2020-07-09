SakuraTown_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, SakuraTown_FlyPointCallback


SakuraTown_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events

	object_const_def ; object_event constants

SakuraTown_FlyPointCallback:
	setflag ENGINE_FLYPOINT_SAKURA
	return

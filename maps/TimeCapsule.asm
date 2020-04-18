TimeCapsule_MapScripts:
	db 2 ; scene scripts
	scene_script TimeCapsule_Initialize ; SCENE_DEFAULT
	scene_script DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, TimeCapsule_SetWhichChrisCallback

TimeCapsule_MapEvents:
	db 2 ; warp events
	warp_event  4,  7, POKECENTER_2F, 4
	warp_event  5,  7, POKECENTER_2F, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  4,  4, BGEVENT_RIGHT, TimeCapsuleConsoleScript
	bg_event  5,  4, BGEVENT_LEFT, TimeCapsuleConsoleScript

	db 2 ; object events
	object_event  3,  4, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TimeCapsuleFriendScript, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event  6,  4, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TimeCapsuleFriendScript, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2

	object_const_def ; object_event constants
	const TIMECAPSULE_CHRIS1
	const TIMECAPSULE_CHRIS2


TimeCapsule_SetWhichChrisCallback:
	special CableClubCheckWhichChris
	iffalse .Chris2
	disappear TIMECAPSULE_CHRIS2
	appear TIMECAPSULE_CHRIS1
	return

.Chris2:
	disappear TIMECAPSULE_CHRIS1
	appear TIMECAPSULE_CHRIS2
	return

TimeCapsule_Initialize:
	prioritysjump .InitializeAndPreparePokecenter2F
	end

.InitializeAndPreparePokecenter2F:
	setscene SCENE_FINISHED
	setmapscene POKECENTER_2F, SCENE_POKECENTER2F_LEAVE_TIME_CAPSULE
	end

TimeCapsuleConsoleScript:
	special TimeCapsule
	newloadmap MAPSETUP_LINKRETURN
	end

TimeCapsuleFriendScript:
	opentext
	writetext .FriendReadyText
	waitbutton
	closetext
	end

.FriendReadyText:
	text "Your friend is"
	line "ready."
	done

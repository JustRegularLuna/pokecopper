Colosseum_MapScripts:
	db 2 ; scene scripts
	scene_script Colosseum_Initialize ; SCENE_DEFAULT
	scene_script DummyScene ; SCENE_FINISHED

	db 2 ; callbacks
	callback MAPCALLBACK_OBJECTS, Colosseum_SetWhichChrisCallback
	callback MAPCALLBACK_NEWMAP, Colosseum_PreparePokecenter2FCallback

Colosseum_MapEvents:
	db 2 ; warp events
	warp_event  4,  7, POKECENTER_2F, 3
	warp_event  5,  7, POKECENTER_2F, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  4,  4, BGEVENT_RIGHT, ColosseumConsoleScript
	bg_event  5,  4, BGEVENT_LEFT, ColosseumConsoleScript

	db 2 ; object events
	object_event  3,  4, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CableClubFriendScript, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event  6,  4, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CableClubFriendScript, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2

	object_const_def ; object_event constants
	const COLOSSEUM_CHRIS1
	const COLOSSEUM_CHRIS2


Colosseum_SetWhichChrisCallback:
	special CableClubCheckWhichChris
	iffalse .Chris2
	disappear COLOSSEUM_CHRIS2
	appear COLOSSEUM_CHRIS1
	return

.Chris2:
	disappear COLOSSEUM_CHRIS1
	appear COLOSSEUM_CHRIS2
	return

Colosseum_PreparePokecenter2FCallback:
	setmapscene POKECENTER_2F, SCENE_POKECENTER2F_LEAVE_COLOSSEUM
	return

Colosseum_Initialize:
	prioritysjump .InitializeAndPreparePokecenter2F
	end

.InitializeAndPreparePokecenter2F:
	setscene SCENE_FINISHED
	setmapscene POKECENTER_2F, SCENE_POKECENTER2F_LEAVE_COLOSSEUM
	end

ColosseumConsoleScript:
	special Colosseum
	newloadmap MAPSETUP_LINKRETURN
	end

CableClubFriendScript:
	opentext
	writetext .FriendReadyText
	waitbutton
	closetext
	end

.FriendReadyText:
	text "Your friend is"
	line "ready."
	done

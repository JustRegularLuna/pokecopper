	object_const_def ; object_event constants
	const COLOSSEUM_HIRO1
	const COLOSSEUM_HIRO2

Colosseum_MapScripts:
	db 2 ; scene scripts
	scene_script .InitializeColosseum ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .SetWhichHiro

.InitializeColosseum:
	prioritysjump .InitializeAndPreparePokecenter2F
	end

.DummyScene1:
	end

.SetWhichHiro:
	special CableClubCheckWhichHiro
	iffalse .Hiro2
	disappear COLOSSEUM_HIRO2
	appear COLOSSEUM_HIRO1
	return

.Hiro2:
	disappear COLOSSEUM_HIRO1
	appear COLOSSEUM_HIRO2
	return

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

Colosseum_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, POKECENTER_2F, 3
	warp_event  5,  7, POKECENTER_2F, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  4,  4, BGEVENT_RIGHT, ColosseumConsoleScript
	bg_event  5,  4, BGEVENT_LEFT, ColosseumConsoleScript

	db 2 ; object events
	object_event  3,  4, SPRITE_HIRO, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CableClubFriendScript, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event  6,  4, SPRITE_HIRO, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CableClubFriendScript, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2

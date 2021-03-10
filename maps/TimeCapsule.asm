	object_const_def ; object_event constants
	const TIMECAPSULE_HIRO1
	const TIMECAPSULE_HIRO2

TimeCapsule_MapScripts:
	db 2 ; scene scripts
	scene_script .InitializeTimeCapsule ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .SetWhichHiro

.InitializeTimeCapsule:
	prioritysjump .InitializeAndPreparePokecenter2F
	end

.DummyScene:
	end

.SetWhichHiro:
	special CableClubCheckWhichHiro
	iffalse .Hiro2
	disappear TIMECAPSULE_HIRO2
	appear TIMECAPSULE_HIRO1
	return

.Hiro2:
	disappear TIMECAPSULE_HIRO1
	appear TIMECAPSULE_HIRO2
	return

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

TimeCapsule_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, POKECENTER_2F, 4
	warp_event  5,  7, POKECENTER_2F, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  4,  4, BGEVENT_RIGHT, TimeCapsuleConsoleScript
	bg_event  5,  4, BGEVENT_LEFT, TimeCapsuleConsoleScript

	db 2 ; object events
	object_event  3,  4, SPRITE_HIRO, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TimeCapsuleFriendScript, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event  6,  4, SPRITE_HIRO, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TimeCapsuleFriendScript, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2

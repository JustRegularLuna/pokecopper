GiveParkBalls:
	xor a
	ld [wContestMon], a
	ld a, 20
	ld [wParkBallsRemaining], a
	farjp StartBugContestTimer

BugCatchingContestBattleScript::
	loadvar VAR_BATTLETYPE, BATTLETYPE_CONTEST
	randomwildmon
	startbattle
	reloadmapafterbattle
	readmem wParkBallsRemaining
	iffalse BugCatchingContestOutOfBallsScript
	end

BugCatchingContestOverScript::
	playsound SFX_ELEVATOR_END
	opentext
	writetext BugCatchingContestTimeUpText
	waitbutton
	sjump BugCatchingContestReturnToGateScript

BugCatchingContestOutOfBallsScript:
	playsound SFX_ELEVATOR_END
	opentext
	writetext BugCatchingContestIsOverText
	waitbutton

BugCatchingContestReturnToGateScript:
	closetext
	jumpstd bugcontestresultswarp

BugCatchingContestTimeUpText:
	text_far _BugCatchingContestTimeUpText
	text_end

BugCatchingContestIsOverText:
	text_far _BugCatchingContestIsOverText
	text_end

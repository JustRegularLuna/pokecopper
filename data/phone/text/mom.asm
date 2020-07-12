MomPhoneGreetingText:
	text "Hello?"

	para "Oh, hi, <PLAYER>!"
	line "Working hard?"
	done

MomCheckBalanceText:
	text "By the way, you've"
	line "saved up ¥@"
	text_ram wStringBuffer3
	text "."

	para "Do you want to"
	line "keep on saving?"
	done

MomImportantToSaveText:
	text "It's important to"
	line "save your money."
	done

MomYoureNotSavingText:
	text "Oh, <PLAYER>,"
	line "you're not saving"

	para "any money. Would"
	line "you like to save?"
	done

MomYouveSavedText:
	text "By the way, you've"
	line "saved up ¥@"
	text_ram wStringBuffer3
	text "."

	para "Want to start"
	line "saving again?"
	done

MomOKIllSaveText:
	text "OK. I'll save your"
	line "money."
	done

MomPhoneStopSavingMoneyText:
	text "OK. I'll stop"
	line "saving your money."
	done

MomPhoneHangUpText:
	text "<PLAYER>, keep it"
	line "up! I'm rooting"
	cont "for you, baby!"
	done

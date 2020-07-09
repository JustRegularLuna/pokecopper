MomPhoneCalleeScript:
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue .script_10401f
	checkevent EVENT_DUDE_TALKED_TO_YOU
	iftrue MomPhoneLectureScript
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue MomPhoneNoGymQuestScript
	checkevent EVENT_GOT_STARTER_POKEMON
	iftrue MomPhoneNoPokedexScript
	sjump MomPhoneNoPokemonScript

.script_10401f
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	iftrue MomPhoneHangUpScript
	writetext MomPhoneGreetingText
	promptbutton
	getcurlandmarkname STRING_BUFFER_3
	readvar VAR_ROOFPALETTE
	ifequal 1, MomPhonePalette1
	ifequal 2, MomPhonePalette2
	sjump MomPhoneOther

MomPhoneLandmark:
	writetext MomPhoneLandmarkText
	promptbutton
	sjump MomSavingMoney

MomPhonePalette1:
	readvar VAR_MAPGROUP
	ifequal GROUP_SILENT_HILLS, .silent
	ifequal GROUP_SAKURA_TOWN, .sakura
	writetext MomPhoneGenericAreaText
	promptbutton
	sjump MomSavingMoney

.silent
	writetext MomPhoneNewBarkText
	promptbutton
	sjump MomSavingMoney

.sakura
	writetext MomPhoneCherrygroveText
	promptbutton
	sjump MomSavingMoney

MomPhonePalette2:
	writetext MomOtherAreaText
	promptbutton
	sjump MomSavingMoney

MomPhoneOther:
	writetext MomDeterminedText
	promptbutton
	sjump MomSavingMoney

MomSavingMoney:
	checkflag ENGINE_MOM_SAVING_MONEY
	iffalse .NotSaving
	checkmoney MOMS_MONEY, 0
	ifequal HAVE_MORE, .SavingHasMoney
	sjump .SavingNoMoney

.NotSaving:
	checkmoney MOMS_MONEY, 0
	ifequal HAVE_MORE, .HasMoney
	sjump .NoMoney

.SavingHasMoney:
	getmoney STRING_BUFFER_3, MOMS_MONEY
	writetext MomCheckBalanceText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	sjump MomPhoneStopSavingMoneyScript

.SavingNoMoney:
	writetext MomImportantToSaveText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	sjump MomPhoneStopSavingMoneyScript

.NoMoney:
	writetext MomYoureNotSavingText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	sjump MomPhoneStopSavingMoneyScript

.HasMoney:
	getmoney STRING_BUFFER_3, MOMS_MONEY
	writetext MomYouveSavedText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	sjump MomPhoneStopSavingMoneyScript

MomPhoneSaveMoneyScript:
	setflag ENGINE_MOM_SAVING_MONEY
	writetext MomOKIllSaveText
	promptbutton
	sjump MomPhoneHangUpScript

MomPhoneStopSavingMoneyScript:
	clearflag ENGINE_MOM_SAVING_MONEY
	writetext MomPhoneStopSavingMoneyText
	promptbutton
	sjump MomPhoneHangUpScript

MomPhoneHangUpScript:
	writetext MomPhoneHangUpText
	end

MomPhoneNoPokemonScript:
	writetext MomPhoneNoPokemonText
	end

MomPhoneNoPokedexScript:
	writetext MomPhoneNoPokedexText
	end

MomPhoneNoGymQuestScript:
	writetext MomPhoneNoGymQuestText
	end

MomPhoneLectureScript:
	setevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	setflag ENGINE_MOM_ACTIVE
	specialphonecall SPECIALCALL_NONE
	writetext MomPhoneLectureText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	sjump MomPhoneStopSavingMoneyScript

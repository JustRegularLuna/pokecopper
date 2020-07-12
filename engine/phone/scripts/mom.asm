MomPhoneCalleeScript:
	writetext MomPhoneGreetingText
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

MomPhoneCalleeScript:
	farwritetext MomPhoneGreetingText
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
	farwritetext MomCheckBalanceText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	sjump MomPhoneWontSaveMoneyScript

.SavingNoMoney:
	farwritetext MomImportantToSaveText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	sjump MomPhoneWontSaveMoneyScript

.NoMoney:
	farwritetext MomYoureNotSavingText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	sjump MomPhoneWontSaveMoneyScript

.HasMoney:
	getmoney STRING_BUFFER_3, MOMS_MONEY
	farwritetext MomYouveSavedText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	sjump MomPhoneWontSaveMoneyScript

MomPhoneSaveMoneyScript:
	setflag ENGINE_MOM_SAVING_MONEY
	farwritetext MomOKIllSaveText
	promptbutton
	sjump MomPhoneHangUpScript

MomPhoneWontSaveMoneyScript:
	clearflag ENGINE_MOM_SAVING_MONEY
	farwritetext MomPhoneWontSaveMoneyText
	promptbutton
	sjump MomPhoneHangUpScript

MomPhoneHangUpScript:
	farwritetext MomPhoneHangUpText
	end

SECTION "NurseMornText", ROMX
NurseMornText::
	text "Good morning!"
	line "Welcome to our"
	cont "#MON CENTER."
	done

SECTION "NurseDayText", ROMX
NurseDayText::
	text "Hello!"
	line "Welcome to our"
	cont "#MON CENTER."
	done

SECTION "NurseNiteText", ROMX
NurseNiteText::
	text "Good evening!"
	line "You're out late."

	para "Welcome to our"
	line "#MON CENTER."
	done

SECTION "NurseAskHealText", ROMX
NurseAskHealText::
	text "We can heal your"
	line "#MON to perfect"
	cont "health."

	para "Shall we heal your"
	line "#MON?"
	done

SECTION "NurseTakePokemonText", ROMX
NurseTakePokemonText::
	text "OK, may I see your"
	line "#MON?"
	done

SECTION "NurseReturnPokemonText", ROMX
NurseReturnPokemonText::
	text "Thank you for"
	line "waiting."

	para "Your #MON are"
	line "fully healed."
	done

SECTION "NurseGoodbyeText", ROMX
NurseGoodbyeText::
	text "We hope to see you"
	line "again."
	done

SECTION "NursePokerusText", ROMX
NursePokerusText::
	text "Your #MON"
	line "appear to be"

	para "infected by tiny"
	line "life forms."

	para "Your #MON are"
	line "healthy and seem"
	cont "to be fine."

	para "But we can't tell"
	line "you anything more"

	para "at a #MON"
	line "CENTER."
	done

SECTION "DifficultBookshelfText", ROMX
DifficultBookshelfText::
	text "It's full of"
	line "difficult books."
	done

SECTION "PictureBookshelfText", ROMX
PictureBookshelfText::
	text "A whole collection"
	line "of #MON picture"
	cont "books!"
	done

SECTION "MagazineBookshelfText", ROMX
MagazineBookshelfText::
	text "#MON magazines…"
	line "#MON PAL,"

	para "#MON HANDBOOK,"
	line "#MON GRAPH…"
	done

SECTION "TeamRocketOathText", ROMX
TeamRocketOathText::
	text "TEAM ROCKET OATH"

	para "Steal #MON for"
	line "profit!"

	para "Exploit #MON"
	line "for profit!"

	para "All #MON exist"
	line "for the glory of"
	cont "TEAM ROCKET!"
	done

SECTION "IncenseBurnerText", ROMX
IncenseBurnerText::
	text "What is this?"

	para "Oh, it's an"
	line "incense burner!"
	done

SECTION "MerchandiseShelfText", ROMX
MerchandiseShelfText::
	text "Lots of #MON"
	line "merchandise!"
	done

SECTION "LookTownMapText", ROMX
LookTownMapText::
	text "It's the TOWN MAP."
	done

SECTION "WindowText", ROMX
WindowText::
	text "My reflection!"
	line "Lookin' good!"
	done

SECTION "TVText", ROMX
TVText::
	text "It's a TV."
	done

SECTION "HomepageText", ROMX
HomepageText::
	text "#MON JOURNAL"
	line "HOME PAGE…"

	para "It hasn't been"
	line "updated…"
	done

SECTION "TrashCanText", ROMX
TrashCanText::
	text "There's nothing in"
	line "here…"
	done

SECTION "PokecenterSignText", ROMX
PokecenterSignText::
	text "Heal Your #MON!"
	line "#MON CENTER"
	done

SECTION "MartSignText", ROMX
MartSignText::
	text "For All Your"
	line "#MON Needs"

	para "#MON MART"
	done

SECTION "ContestResults_ReadyToJudgeText", ROMX
ContestResults_ReadyToJudgeText::
	text "We will now judge"
	line "the #MON you've"
	cont "caught."

	para "……"
	line "……"

	para "We have chosen the"
	line "winners!"

	para "Are you ready for"
	line "this?"
	done

SECTION "ContestResults_PlayerWonAPrizeText", ROMX
ContestResults_PlayerWonAPrizeText::
	text "<PLAYER>, the No."
	text_ram wStringBuffer3
	line "finisher, wins"
	cont ""
	text_ram wStringBuffer4
	text "!"
	done

SECTION "ReceivedItemText", ROMX
ReceivedItemText::
	text "<PLAYER> received"
	line ""
	text_ram wStringBuffer4
	text "."
	done

SECTION "ContestResults_JoinUsNextTimeText", ROMX
ContestResults_JoinUsNextTimeText::
	text "Please join us for"
	line "the next Contest!"
	done

SECTION "ContestResults_ConsolationPrizeText", ROMX
ContestResults_ConsolationPrizeText::
	text "Everyone else gets"
	line "a BERRY as a con-"
	cont "solation prize!"
	done

SECTION "ContestResults_DidNotWinText", ROMX
ContestResults_DidNotWinText::
	text "We hope you do"
	line "better next time."
	done

SECTION "ContestResults_ReturnPartyText", ROMX
ContestResults_ReturnPartyText::
	text "We'll return the"
	line "#MON we kept"

	para "for you."
	line "Here you go!"
	done

SECTION "ContestResults_PartyFullText", ROMX
ContestResults_PartyFullText::
	text "Your party's full,"
	line "so the #MON was"

	para "sent to your BOX"
	line "in BILL's PC."
	done

SECTION "GymStatue_CityGymText", ROMX
GymStatue_CityGymText::
	text_ram wStringBuffer3
	line "#MON GYM"
	done

SECTION "GymStatue_WinningTrainersText", ROMX
GymStatue_WinningTrainersText::
	text "LEADER: "
	text_ram wStringBuffer4

	para "WINNING TRAINERS:"
	line "<PLAYER>"
	done

SECTION "CoinVendor_WelcomeText", ROMX
CoinVendor_WelcomeText::
	text "Welcome to the"
	line "GAME CORNER."
	done

SECTION "CoinVendor_NoCoinCaseText", ROMX
CoinVendor_NoCoinCaseText::
	text "Do you need game"
	line "coins?"

	para "Oh, you don't have"
	line "a COIN CASE for"
	cont "your coins."
	done

SECTION "CoinVendor_IntroText", ROMX
CoinVendor_IntroText::
	text "Do you need some"
	line "game coins?"

	para "It costs ¥1000 for"
	line "50 coins. Do you"
	cont "want some?"
	done

SECTION "CoinVendor_Buy50CoinsText", ROMX
CoinVendor_Buy50CoinsText::
	text "Thank you!"
	line "Here are 50 coins."
	done

SECTION "CoinVendor_Buy500CoinsText", ROMX
CoinVendor_Buy500CoinsText::
	text "Thank you! Here"
	line "are 500 coins."
	done

SECTION "CoinVendor_NotEnoughMoneyText", ROMX
CoinVendor_NotEnoughMoneyText::
	text "You don't have"
	line "enough money."
	done

SECTION "CoinVendor_CoinCaseFullText", ROMX
CoinVendor_CoinCaseFullText::
	text "Whoops! Your COIN"
	line "CASE is full."
	done

SECTION "CoinVendor_CancelText", ROMX
CoinVendor_CancelText::
	text "No coins for you?"
	line "Come again!"
	done

SECTION "BugContestPrizeNoRoomText", ROMX
BugContestPrizeNoRoomText::
	text "Oh? Your PACK is"
	line "full."

	para "We'll keep this"
	line "for you today, so"

	para "come back when you"
	line "make room for it."
	done

SECTION "HappinessText3", ROMX
HappinessText3::
	text "Wow! You and your"
	line "#MON are really"
	cont "close!"
	done

SECTION "HappinessText2", ROMX
HappinessText2::
	text "#MON get more"
	line "friendly if you"

	para "spend time with"
	line "them."
	done

SECTION "HappinessText1", ROMX
HappinessText1::
	text "You haven't tamed"
	line "your #MON."

	para "If you aren't"
	line "nice, it'll pout."
	done

SECTION "RegisteredNumber1Text", ROMX
RegisteredNumber1Text::
	text "<PLAYER> registered"
	line ""
	text_ram wStringBuffer3
	text "'s number."
	done

SECTION "RegisteredNumber2Text", ROMX
RegisteredNumber2Text::
	text "<PLAYER> registered"
	line ""
	text_ram wStringBuffer3
	text "'s number."
	done

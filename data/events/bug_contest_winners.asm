BugContestantPointers:
; there are NUM_BUG_CONTESTANTS + 1 entries
	dw BugContestant_BugCatcherDon ; this reverts back to the player
	dw BugContestant_BugCatcherDon
	dw BugContestant_BugCatcherEd
	dw BugContestant_CooltrainerMNick
	dw BugContestant_PokefanMWilliam
	dw BugContestant_BugCatcherBenny
	dw BugContestant_CamperBarry
	dw BugContestant_PicnickerCindy
	dw BugContestant_BugCatcherJosh
	dw BugContestant_YoungsterSamuel
	dw BugContestant_SchoolboyKipp

; contestant format:
;   db class, id
;   dbw 1st-place mon, score
;   dbw 2nd-place mon, score
;   dbw 3rd-place mon, score

BugContestant_BugCatcherDon:
	db POKEMON_PROF, OAK1
	dbw KAKUNA,     300
	dbw METAPOD,    285
	dbw CATERPIE,   226

BugContestant_BugCatcherEd:
	db POKEMON_PROF, OAK1
	dbw BUTTERFREE, 286
	dbw BUTTERFREE, 251
	dbw CATERPIE,   237

BugContestant_CooltrainerMNick:
	db POKEMON_PROF, OAK1
	dbw SCYTHER,    357
	dbw BUTTERFREE, 349
	dbw PINSIR,     368

BugContestant_PokefanMWilliam:
	db POKEMON_PROF, OAK1
	dbw PINSIR,     332
	dbw BUTTERFREE, 324
	dbw VENONAT,    321

BugContestant_BugCatcherBenny:
	db POKEMON_PROF, OAK1
	dbw BUTTERFREE, 318
	dbw WEEDLE,     295
	dbw CATERPIE,   285

BugContestant_CamperBarry:
	db POKEMON_PROF, OAK1
	dbw PINSIR,     366
	dbw VENONAT,    329
	dbw KAKUNA,     314

BugContestant_PicnickerCindy:
	db POKEMON_PROF, OAK1
	dbw BUTTERFREE, 341
	dbw METAPOD,    301
	dbw CATERPIE,   264

BugContestant_BugCatcherJosh:
	db POKEMON_PROF, OAK1
	dbw SCYTHER,    326
	dbw BUTTERFREE, 292
	dbw METAPOD,    282

BugContestant_YoungsterSamuel:
	db POKEMON_PROF, OAK1
	dbw WEEDLE,     270
	dbw PINSIR,     282
	dbw CATERPIE,   251

BugContestant_SchoolboyKipp:
	db POKEMON_PROF, OAK1
	dbw VENONAT,    267
	dbw PARAS,      254
	dbw KAKUNA,     259

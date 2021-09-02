Marts:
; entries correspond to MART_* constants
	dw MartSakura
	dw MartSakuraDex
.End

MartSakura:
	db 4 ; # items
	db POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db -1 ; end

MartSakuraDex:
	db 5 ; # items
	db POKE_BALL
	db POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db -1 ; end

DefaultMart:
	db 2 ; # items
	db POKE_BALL
	db POTION
	db -1 ; end

TreeMons:
; entries correspond to TREEMON_SET_* constants
	dw TreeMonSet_City
	dw TreeMonSet_Canyon
	dw TreeMonSet_Town
	dw TreeMonSet_Route
	dw TreeMonSet_Kanto
	dw TreeMonSet_Lake
	dw TreeMonSet_Forest
	dw TreeMonSet_Rock
	dw TreeMonSet_City

; Two tables each (common, rare).
; Structure:
;	db  %, species, level

TreeMonSet_City:
TreeMonSet_Canyon:
; common
	db 50, SPEAROW,    10
	db 15, SPEAROW,    10
	db 15, SPEAROW,    10
	db 10, PIDGEY,     10
	db  5, PIDGEY,     10
	db  5, PIDGEY,     10
	db -1
; rare
	db 50, SPEAROW,    10
	db 15, SPEAROW,    10
	db 15, SPEAROW,    10
	db 10, PIDGEY,     10
	db  5, PIDGEY,     10
	db  5, PIDGEY,     10
	db -1

TreeMonSet_Town:
; common
	db 50, SPEAROW,    10
	db 15, SPEAROW,    10
	db 15, SPEAROW,    10
	db 10, PIDGEY,     10
	db  5, PIDGEY,     10
	db  5, PIDGEY,     10
	db -1
; rare
	db 50, SPEAROW,    10
	db 15, SPEAROW,    10
	db 15, SPEAROW,    10
	db 10, PIDGEY,     10
	db  5, PIDGEY,     10
	db  5, PIDGEY,     10
	db -1

TreeMonSet_Route:
; common
	db 50, SPEAROW,    10
	db 15, SPEAROW,    10
	db 15, SPEAROW,    10
	db 10, PIDGEY,     10
	db  5, PIDGEY,     10
	db  5, PIDGEY,     10
	db -1
; rare
	db 50, SPEAROW,    10
	db 15, SPEAROW,    10
	db 15, SPEAROW,    10
	db 10, PIDGEY,     10
	db  5, PIDGEY,     10
	db  5, PIDGEY,     10
	db -1

TreeMonSet_Kanto:
; common
	db 50, SPEAROW,    10
	db 15, SPEAROW,    10
	db 15, SPEAROW,    10
	db 10, PIDGEY,     10
	db  5, PIDGEY,     10
	db  5, PIDGEY,     10
	db -1
; rare
	db 50, SPEAROW,    10
	db 15, SPEAROW,    10
	db 15, SPEAROW,    10
	db 10, PIDGEY,     10
	db  5, PIDGEY,     10
	db  5, PIDGEY,     10
	db -1

TreeMonSet_Lake:
; common
	db 50, SPEAROW,    10
	db 15, SPEAROW,    10
	db 15, SPEAROW,    10
	db 10, PIDGEY,     10
	db  5, PIDGEY,     10
	db  5, PIDGEY,     10
	db -1
; rare
	db 50, SPEAROW,    10
	db 15, SPEAROW,    10
	db 15, SPEAROW,    10
	db 10, PIDGEY,     10
	db  5, PIDGEY,     10
	db  5, PIDGEY,     10
	db -1

TreeMonSet_Forest:
; common
	db 50, SPEAROW,    10
	db 15, SPEAROW,    10
	db 15, SPEAROW,    10
	db 10, PIDGEY,     10
	db  5, PIDGEY,     10
	db  5, PIDGEY,     10
	db -1
; rare
	db 50, SPEAROW,    10
	db 15, SPEAROW,    10
	db 15, SPEAROW,    10
	db 10, PIDGEY,     10
	db  5, PIDGEY,     10
	db  5, PIDGEY,     10
	db -1

TreeMonSet_Rock:
	db 90, KRABBY,     15
	db 10, GEODUDE,    15
	db -1

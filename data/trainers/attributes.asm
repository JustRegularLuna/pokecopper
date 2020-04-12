TrainerClassAttributes:
; entries correspond to trainer classes (see constants/trainer_constants.asm)

; Pokemon Prof
	db NO_ITEM, NO_ITEM ; items
	db 25 ; base reward
	dw AI_BASIC | AI_AGGRESSIVE | AI_STATUS
	dw CONTEXT_USE | SWITCH_SOMETIMES

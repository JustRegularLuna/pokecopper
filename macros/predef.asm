predef_id: MACRO
; Some functions load the predef id
; without immediately calling Predef.
	ld a, (\1Predef - PredefPointers) / 3
ENDM

predef: MACRO
	predef_id \1
	rst Predef
ENDM

predef_jump: MACRO
	predef \1 ; no-optimize tail predef
	ret
ENDM

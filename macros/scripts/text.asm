text   EQUS "db "             ; Start writing text.
next   EQUS "db \"<NEXT>\","  ; Move a line down.
line   EQUS "db \"<LINE>\","  ; Start writing at the bottom line.
page   EQUS "db \"@\","       ; Start a new Pokédex page.
para   EQUS "db \"<PARA>\","  ; Start a new paragraph.
cont   EQUS "db \"<CONT>\","  ; Scroll to the next line.
done   EQUS "db \"<DONE>\""   ; End a text box.
prompt EQUS "db \"<PROMPT>\"" ; Prompt the player to end a text box (initiating some other event).

; TextCommands indexes (see home/text.asm)
	enum_start

	enum TX_START ; $00
text_start: MACRO
	db TX_START
ENDM

	enum TX_RAM ; $01
text_ram: MACRO
	db TX_RAM
	dw \1
ENDM

	enum TX_PROMPT_BUTTON ; $02
text_promptbutton: MACRO
	db TX_PROMPT_BUTTON
ENDM

	enum TX_START_ASM ; $03
text_asm: MACRO
	db TX_START_ASM
ENDM

	enum TX_NUM ; $04
text_decimal: MACRO
	db TX_NUM
	dw \1 ; address
	dn \2, \3 ; bytes, digits
ENDM

	enum TX_PAUSE ; $05
text_pause: MACRO
	db TX_PAUSE
ENDM

	enum TX_SOUND ; $06
text_sound: MACRO
	db TX_SOUND
	db \1 ; sfx
ENDM

	enum TX_DAY ; $07
text_today: MACRO
	db TX_DAY
ENDM

	enum TX_FAR ; $08
text_far: MACRO
	db TX_FAR
	dw \1
	db BANK(\1)
ENDM

	enum_set $50

	enum TX_END ; $50
text_end: MACRO
	db TX_END
ENDM

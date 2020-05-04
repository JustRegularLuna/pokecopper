ClearSpeechBox::
	hlcoord TEXTBOX_INNERX, TEXTBOX_INNERY
	lb bc, TEXTBOX_INNERH - 1, TEXTBOX_INNERW
	; fallthrough

ClearBox::
; Fill a c*b box at hl with blank tiles.
	ld a, " "
	; fallthrough

FillBoxWithByte::
.row
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	ret

ClearScreen::
	ld a, PAL_BG_TEXT
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	rst ByteFill
	; fallthrough

ClearTilemap::
; Fill wTilemap with blank tiles.
	hlcoord 0, 0
	ld a, " "
	ld bc, wTilemapEnd - wTilemap
	rst ByteFill

	; Update the BG Map.
	ldh a, [rLCDC]
	bit rLCDC_ENABLE, a
	ret z
	jp WaitBGMap

SpeechTextbox::
; Standard textbox.
	hlcoord TEXTBOX_X, TEXTBOX_Y
	lb bc, TEXTBOX_INNERH, TEXTBOX_INNERW
	; fallthrough

Textbox::
; Draw a text box at hl with room for b lines of c characters each.
; Places a border around the textbox, then switches the palette to the
; text black-and-white scheme.
	push bc
	push hl
	call TextboxBorder
	pop hl
	pop bc
	; fallthrough

TextboxPalette::
; Fill text box width c height b at hl with pal 7
	ld de, wAttrmap - wTilemap
	add hl, de
	inc b
	inc b
	inc c
	inc c
	ld a, PAL_BG_TEXT
	jr FillBoxWithByte

TextboxBorder::
	; Top
	push hl
	ld a, "┌"
	ld [hli], a
	inc a ; "─"
	call .PlaceChars
	inc a ; "┐"
	ld [hl], a
	pop hl

	; Middle
	ld de, SCREEN_WIDTH
	add hl, de
.row
	push hl
	ld a, "│"
	ld [hli], a
	ld a, " "
	call .PlaceChars
	ld [hl], "│"
	pop hl

	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .row

	; Bottom
	ld a, "└"
	ld [hli], a
	ld a, "─"
	call .PlaceChars
	ld [hl], "┘"

	ret

.PlaceChars:
; Place char a c times.
	ld d, c
.loop
	ld [hli], a
	dec d
	jr nz, .loop
	ret

PrintText::
	call SetUpTextbox
	push hl
	call ClearSpeechBox
	pop hl
	; fallthrough

PrintTextboxText::
	bccoord TEXTBOX_INNERX, TEXTBOX_INNERY
	; fallthrough

PlaceHLTextAtBC::
	ld a, [wTextboxFlags]
	push af
	set NO_TEXT_DELAY_F, a
	ld [wTextboxFlags], a

	call DoTextUntilTerminator

	pop af
	ld [wTextboxFlags], a
	ret

SetUpTextbox::
	push hl
	call SpeechTextbox
	call UpdateSprites
	call ApplyTilemap
	pop hl
	ret

_PlaceString::
	push hl
	; fallthrough

PlaceNextChar::
	ld a, [de]
	cp LAST_CONTROL_CHAR + 1
	jr nc, PlaceLiteralCharacter
	cp FIRST_CONTROL_CHAR
	jr nc, PlaceControlCharacter
	dec de
	jp FinishString

SpaceChar:
	ld a, " "
	; fallthrough

PlaceLiteralCharacter:
	ld [hli], a
	call PrintLetterDelay
	; fallthrough

NextChar::
	inc de
	jr PlaceNextChar

PlaceControlCharacter:
	sub FIRST_CONTROL_CHAR
	push hl
	add a
	ld c, a
	ld b, 0
	ld hl, ControlCharacters
	add hl, bc
	ld a, [hli]
	ld b, [hl]
	ld c, a
	pop hl
_bc_::
	push bc
	ret

ControlCharacters:
	dw SpaceChar            ; "¯"
	dw NextChar             ; "%"
	dw ContTextNoPause      ; "<SCROLL>"
	dw LineFeedChar         ; "<LF>"
	dw NextLineChar         ; "<NEXT>"
	dw LineChar             ; "<LINE>"
	dw FinishString         ; "@"
	dw Paragraph            ; "<PARA>"
	dw PrintPlayerName      ; "<PLAYER>"
	dw PrintRivalName       ; "<RIVAL>"
	dw PrintMomsName        ; "<MOM>"
	dw PlacePOKe            ; "#"
	dw ContText             ; "<CONT>"
	dw DoneText             ; "<DONE>"
	dw PromptText           ; "<PROMPT>"
	dw PlaceMoveTargetsName ; "<TARGET>"
	dw PlaceMoveUsersName   ; "<USER>"
	dw PlaceEnemysName      ; "<ENEMY>"

PlaceMoveTargetsName::
	ldh a, [hBattleTurn]
	xor 1
	jr PlaceMoveUsersName.place

PlaceMoveUsersName::
	ldh a, [hBattleTurn]
	; fallthrough

.place:
	push de
	ld de, wBattleMonNick
	and a
	jr z, PlaceCommandCharacter
	ld de, EnemyText
	rst PlaceString
	ld h, b
	ld l, c
	ld de, wEnemyMonNick
	jr PlaceCommandCharacter

PlaceEnemysName::
	push de
	ld de, wOTClassName

	ld a, [wLinkMode]
	and a
	jr nz, PlaceCommandCharacter

	ld a, [wTrainerClass]
	rst PlaceString
	ld h, b
	ld l, c
	ld de, String_Space
	rst PlaceString
	push bc
	farcall Battle_GetTrainerName
	pop hl
	ld de, wStringBuffer1
	jr PlaceCommandCharacter

PrintMomsName:
	push de
	ld de, wMomsName
	jr PlaceCommandCharacter

PrintPlayerName:
	push de
	ld de, wPlayerName
	jr PlaceCommandCharacter

PrintRivalName:
	push de
	ld de, wRivalName
	jr PlaceCommandCharacter

PlacePOKe:
	push de
	ld de, PlacePOKeText
	; fallthrough

PlaceCommandCharacter::
	rst PlaceString
	ld h, b
	ld l, c
	pop de
	jp NextChar

PlacePOKeText:: db "POKé@"
EnemyText::     db "Enemy" ; fallthrough to " @"
String_Space::  db " " ; fallthrough to "@"
EmptyString::   db "@"

NextLineChar::
	pop hl
	ld bc, SCREEN_WIDTH * 2
	add hl, bc
	push hl
	jp NextChar

LineFeedChar::
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	push hl
	jp NextChar

LineChar::
	pop hl
	hlcoord TEXTBOX_INNERX, TEXTBOX_INNERY + 2
	push hl
	jp NextChar

Paragraph::
	push de
	ld a, [wLinkMode]
	cp LINK_COLOSSEUM
	call nz, LoadBlinkingCursor
	call Text_WaitBGMap
	call PromptButton
	call ClearSpeechBox
	call UnloadBlinkingCursor
	ld c, 20
	call DelayFrames
	hlcoord TEXTBOX_INNERX, TEXTBOX_INNERY
	pop de
	jp NextChar

ContText::
	ld a, [wLinkMode]
	or a
	call z, LoadBlinkingCursor
	call Text_WaitBGMap
	push de
	call PromptButton
	pop de
	ld a, [wLinkMode]
	or a
	call z, UnloadBlinkingCursor
	; fallthrough

ContTextNoPause::
	push de
	call TextScroll
	call TextScroll
	hlcoord TEXTBOX_INNERX, TEXTBOX_INNERY + 2
	pop de
	jp NextChar

PromptText::
	ld a, [wLinkMode]
	cp LINK_COLOSSEUM
	call nz, LoadBlinkingCursor
	call Text_WaitBGMap
	call PromptButton
	ld a, [wLinkMode]
	cp LINK_COLOSSEUM
	call nz, UnloadBlinkingCursor
	; fallthrough

DoneText::
	pop hl
	assert TX_END == "@"
	ld de, EmptyString - 1
	ret

RadioTerminator::
PokeFluteTerminatorCharacter::
	ld hl, EmptyString
	ret

TextScroll::
	hlcoord TEXTBOX_INNERX, TEXTBOX_INNERY
	decoord TEXTBOX_INNERX, TEXTBOX_INNERY - 1
	ld a, TEXTBOX_INNERH - 1

.col
	push af
	ld c, TEXTBOX_INNERW

.row
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .row

	inc de
	inc de
	inc hl
	inc hl
	pop af
	dec a
	jr nz, .col

	hlcoord TEXTBOX_INNERX, TEXTBOX_INNERY + 2
	ld a, " "
	ld bc, TEXTBOX_INNERW
	rst ByteFill
	ld c, 5
	jp DelayFrames

Text_WaitBGMap::
	push bc
	ldh a, [hOAMUpdate]
	push af
	ld a, 1
	ldh [hOAMUpdate], a

	call WaitBGMap

	pop af
	ldh [hOAMUpdate], a
	pop bc
	ret

LoadBlinkingCursor::
	ld a, "▼"
	ldcoord_a 18, 17
	ret

UnloadBlinkingCursor::
	lda_coord 17, 17
	ldcoord_a 18, 17
	ret

FarString::
	ld b, a
	ldh a, [hROMBank]
	push af

	ld a, b
	rst Bankswitch
	rst PlaceString

	pop af
	rst Bankswitch
	ret

DoTextUntilTerminator::
	ld a, [hli]
	cp TX_END
	ret z
	call .TextCommand
	jr DoTextUntilTerminator

.TextCommand:
	cp TX_FAR + 1
	jr nc, StartedText
	push hl
	ld e, a
	ld d, 0
	ld hl, TextCommands
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	pop hl
_de_::
	push de
	ret

TextCommands::
; entries correspond to TX_* constants (see macros/scripts/text.asm)
	dw TextCommand_START         ; TX_START
	dw TextCommand_RAM           ; TX_RAM
	dw TextCommand_PROMPT_BUTTON ; TX_PROMPT_BUTTON
	dw TextCommand_START_ASM     ; TX_START_ASM
	dw TextCommand_NUM           ; TX_NUM
	dw TextCommand_PAUSE         ; TX_PAUSE
	dw TextCommand_SOUND         ; TX_SOUND
	dw TextCommand_DAY           ; TX_DAY
	dw TextCommand_FAR           ; TX_FAR

StartedText:
	dec hl
TextCommand_START::
; text_start
; write text until "@"
	ld d, h
	ld e, l
	ld h, b
	ld l, c
	rst PlaceString
	ld h, d
	ld l, e
	inc hl
	ret

TextCommand_RAM::
; text_ram
; write text from a ram address
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push hl
	ld h, b
	ld l, c
	rst PlaceString
	pop hl
	ret

TextCommand_FAR::
; text_far
; write text from a different bank
	ldh a, [hROMBank]
	push af

	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]

	ldh [hROMBank], a
	ld [MBC3RomBank], a

	push hl
	ld h, d
	ld l, e
	call DoTextUntilTerminator
	pop hl

	pop af
	ldh [hROMBank], a
	ld [MBC3RomBank], a
	ret

TextCommand_PROMPT_BUTTON::
; text_promptbutton
; wait for button press
; show arrow
	push hl
	ld a, [wLinkMode]
	cp LINK_COLOSSEUM
	call nz, LoadBlinkingCursor
	push bc
	call PromptButton
	pop bc
	ld a, [wLinkMode]
	cp LINK_COLOSSEUM
	call nz, UnloadBlinkingCursor
	pop hl
	ret

TextCommand_START_ASM::
; text_asm
	bit 7, h
	jr nz, .not_rom
	jp hl

.not_rom
	ld [hl], TX_END
	ret

TextCommand_NUM::
; text_decimal
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	push hl
	ld h, b
	ld l, c
	ld b, a
	and $f
	ld c, a
	ld a, b
	and $f0
	swap a
	set PRINTNUM_LEFTALIGN_F, a
	ld b, a
	call PrintNum
FinishString:
	ld b, h
	ld c, l
	pop hl
	ret

TextCommand_PAUSE::
; text_pause
	push hl
	push bc
	call GetJoypad
	ldh a, [hJoyDown]
	and A_BUTTON | B_BUTTON
	jr nz, .done
	ld c, 30
	call DelayFrames
.done
	pop bc
	pop hl
	ret

TextCommand_SOUND::
; text_sound
	ld a, [hli]
	push hl
	push de
	push bc
	ld e, a
	ld d, 0
	call PlaySFX
	call WaitSFX
	pop bc
	pop de
	pop hl
	ret

TextCommand_DAY::
; text_today
	call GetWeekday
PrintDayOfWeek::
	push hl
	push bc
	ld c, a
	ld b, 0
	ld hl, .Days
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld d, h
	ld e, l
	pop hl
	rst PlaceString
	ld h, b
	ld l, c
	ld de, .Day
	rst PlaceString
	pop hl
	ret

.Days:
	dw .Sun
	dw .Mon
	dw .Tues
	dw .Wednes
	dw .Thurs
	dw .Fri
	dw .Satur

.Sun:    db "SUN@"
.Mon:    db "MON@"
.Tues:   db "TUES@"
.Wednes: db "WEDNES@"
.Thurs:  db "THURS@"
.Fri:    db "FRI@"
.Satur:  db "SATUR@"
.Day:    db "DAY@"

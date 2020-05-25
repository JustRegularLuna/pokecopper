MainMenu:
	xor a
	ld [wDisableTextAcceleration], a
	call Function49ed0
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call SetPalettes
	ld hl, wGameTimerPause
	res GAMETIMERPAUSE_TIMER_PAUSED_F, [hl]
	call MainMenu_GetWhichMenu
	ld [wWhichIndexSet], a
	call MainMenu_PrintCurrentTimeAndDay
	ld hl, .MenuHeader
	call LoadMenuHeader
	call MainMenuJoypadLoop
	call CloseWindow
	ret c
	call ClearTilemap
	ld a, [wMenuSelection]
	ld hl, .Jumptable
	call JumpTable
	jr MainMenu

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 13, 7
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 0 ; items
	dw MainMenuItems
	dw PlaceMenuStrings
	dw .Strings

.Strings:
	db "CONTINUE@"
	db "NEW GAME@"
	db "OPTION@"

.Jumptable:
	dw MainMenu_Continue
	dw MainMenu_NewGame
	dw MainMenu_Options

CONTINUE EQU 0
NEW_GAME EQU 1
OPTION   EQU 2

MainMenuItems:
.NewGameMenu:
	db 2
	db NEW_GAME
	db OPTION
	db -1

.ContinueMenu:
	db 3
	db CONTINUE
	db NEW_GAME
	db OPTION
	db -1

MainMenu_GetWhichMenu:
	ld a, [wSaveFileExists]
	and a
	ret z ; New Game
	ld a, $1 ; Continue
	ret

MainMenuJoypadLoop:
	call SetUpMenu
.loop
	call MainMenu_PrintCurrentTimeAndDay
	ld a, [w2DMenuFlags1]
	set 5, a
	ld [w2DMenuFlags1], a
	call GetScrollingMenuJoypad
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .b_button
	cp A_BUTTON
	jr nz, .loop

.a_button
	call PlayClickSFX
	and a
	ret

.b_button
	scf
	ret

MainMenu_PrintCurrentTimeAndDay:
if DEF(_DEBUG)
	xor a
	ldh [hBGMapMode], a
	hlcoord 15, 0
	ld de, .Debug
	rst PlaceString
	ldh [hBGMapMode], a
endc
	ld a, [wSaveFileExists]
	and a
	ret z
	xor a
	ldh [hBGMapMode], a
	call .PlaceBox
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	call .PlaceTime
	pop af
	ld [wOptions], a
	ld a, $1
	ldh [hBGMapMode], a
	ret

.PlaceBox:
	call CheckRTCStatus
	and $80
	jr nz, .TimeFail
	hlcoord 0, 14
	lb bc, 2, 18
	jp Textbox

.TimeFail:
	jp SpeechTextbox

.PlaceTime:
	ld a, [wSaveFileExists]
	and a
	ret z
	call CheckRTCStatus
	and $80
	jp nz, .PrintTimeNotSet
	call UpdateTime
	bccoord 1, 15
	call TextCommand_DAY
	decoord 4, 16
	ldh a, [hHours]
	ld c, a
	farcall PrintHour
	ld [hl], ":"
	inc hl
	ld de, hMinutes
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	jp PrintNum

.PrintTimeNotSet:
	hlcoord 1, 14
	ld de, .TimeNotSet
	rst PlaceString
	ret

.TimeNotSet:
	db "TIME NOT SET@"

if DEF(_DEBUG)
.Debug:
	db "DEBUG@"
endc

Function49ed0:
	xor a
	ldh [hMapAnims], a
	call ClearTilemap
	call LoadFontsExtra
	call LoadStandardFont
	jp ClearWindowData

MainMenu_NewGame:
	farjp NewGame

MainMenu_Options:
	farjp OptionsMenu

MainMenu_Continue:
	farjp Continue

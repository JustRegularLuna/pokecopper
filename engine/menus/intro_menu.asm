_MainMenu:
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	ld de, MUSIC_MAIN_MENU
	ld a, e
	ld [wMapMusic], a
	call PlayMusic
	farcall MainMenu
	jp StartTitleScreen

NewGame_ClearTilemapEtc:
	xor a
	ldh [hMapAnims], a
	call ClearTilemap
	call LoadFontsExtra
	call LoadStandardFont
	jp ClearWindowData

OptionsMenu:
	farcall _OptionsMenu
	ret

NewGame:
	xor a
	ld [wDebugFlags], a
	call ResetWRAM
	call NewGame_ClearTilemapEtc
	farcall InitGender
	call OakSpeech
	call InitializeWorld
	ld a, 1
	ld [wPrevLandmark], a

	ld a, SPAWN_HOME
	ld [wDefaultSpawnpoint], a

	ld a, MAPSETUP_WARP
	ldh [hMapEntryMethod], a
	jp FinishContinueFunction

ResetWRAM:
	xor a
	ldh [hBGMapMode], a

	ld hl, wVirtualOAM
	ld bc, wOptions - wVirtualOAM
	xor a
	rst ByteFill

	ld hl, WRAM1_Begin
	ld bc, wGameData - WRAM1_Begin
	xor a
	rst ByteFill

	ld hl, wGameData
	ld bc, wGameDataEnd - wGameData
	xor a
	rst ByteFill

	call DelayFrame
	ldh a, [hRandomSub]
	ld [wPlayerID], a
	call DelayFrame
	ldh a, [hRandomAdd]
	ld [wPlayerID + 1], a

	call Random
	ld [wSecretID], a
	call DelayFrame
	call Random
	ld [wSecretID + 1], a

	ld hl, wPartyCount
	call .InitList

	xor a
	ld [wCurBox], a
	ld [wSavedAtLeastOnce], a

	call SetDefaultBoxNames

	ld a, BANK(sBoxCount)
	call GetSRAMBank
	ld hl, sBoxCount
	call .InitList
	call CloseSRAM

	ld hl, wNumItems
	call .InitList

	ld hl, wNumKeyItems
	call .InitList

	ld hl, wNumBalls
	call .InitList

	ld hl, wNumPCItems
	call .InitList

	xor a
	ld [wRoamMon1Species], a
	ld [wRoamMon2Species], a
	ld [wRoamMon3Species], a
	ld a, -1
	ld [wRoamMon1MapGroup], a
	ld [wRoamMon2MapGroup], a
	ld [wRoamMon3MapGroup], a
	ld [wRoamMon1MapNumber], a
	ld [wRoamMon2MapNumber], a
	ld [wRoamMon3MapNumber], a

	call LoadOrRegenerateLuckyIDNumber
	call InitializeMagikarpHouse

	xor a
	ld [wMonType], a

	ld [wJohtoBadges], a
	ld [wKantoBadges], a

	ld [wCoins], a
	ld [wCoins + 1], a

if START_MONEY >= $10000
	ld a, HIGH(START_MONEY >> 8)
endc
	ld [wMoney], a
	ld a, HIGH(START_MONEY) ; mid
	ld [wMoney + 1], a
	ld a, LOW(START_MONEY)
	ld [wMoney + 2], a

	xor a
	ld [wWhichMomItem], a

	ld hl, wMomItemTriggerBalance
	ld [hl], HIGH(MOM_MONEY >> 8)
	inc hl
	ld [hl], HIGH(MOM_MONEY) ; mid
	inc hl
	ld [hl], LOW(MOM_MONEY)

	call InitializeNPCNames

	farcall InitDecorations

	farcall DeletePartyMonMail

	jp ResetGameTime

.InitList:
; Loads 0 in the count and -1 in the first item or mon slot.
	xor a
	ld [hli], a
	dec a
	ld [hl], a
	ret

SetDefaultBoxNames:
	ld hl, wBoxNames
	ld c, 0
.loop
	push hl
	ld de, .Box
	call CopyName2
	dec hl
	ld a, c
	inc a
	cp 10
	jr c, .less
	sub 10
	ld [hl], "1"
	inc hl

.less
	add "0"
	ld [hli], a
	ld [hl], "@"
	pop hl
	ld de, 9
	add hl, de
	inc c
	ld a, c
	cp NUM_BOXES
	jr c, .loop
	ret

.Box:
	db "BOX@"

InitializeMagikarpHouse:
	ld hl, wBestMagikarpLengthFeet
	ld a, $3
	ld [hli], a
	ld a, $6
	ld [hli], a
	ld de, .Ralph
	jp CopyName2

.Ralph:
	db "RALPH@"

InitializeNPCNames:
	ld hl, .Rival
	ld de, wRivalName
	call .Copy

	ld hl, .Mom
	ld de, wMomsName
.Copy:
	ld bc, NAME_LENGTH
	rst CopyBytes
	ret

.Rival: db "???@"
.Mom:   db "MOM@"

InitializeWorld:
	call ShrinkPlayer
	farcall InitClock
	call RotateFourPalettesLeft
	farcall SpawnPlayer
	farcall _InitializeStartDay
	farcall InitializeEvents
	ret

LoadOrRegenerateLuckyIDNumber:
	ld a, BANK(sLuckyIDNumber)
	call GetSRAMBank
	ld a, [wCurDay]
	inc a
	ld b, a
	ld a, [sLuckyNumberDay]
	cp b
	ld a, [sLuckyIDNumber + 1]
	ld c, a
	ld a, [sLuckyIDNumber]
	jr z, .skip
	ld a, b
	ld [sLuckyNumberDay], a
	call Random
	ld c, a
	call Random

.skip
	ld [wLuckyIDNumber], a
	ld [sLuckyIDNumber], a
	ld a, c
	ld [wLuckyIDNumber + 1], a
	ld [sLuckyIDNumber + 1], a
	jp CloseSRAM

Continue:
	farcall TryLoadSaveFile
	ret c
	call LoadStandardMenuHeader
	call DisplaySaveInfoOnContinue
	ld a, $1
	ldh [hBGMapMode], a
	ld c, 20
	call DelayFrames
	call ConfirmContinue
	jp c, CloseWindow
	call Continue_CheckRTC_RestartClock
	jp c, CloseWindow

	ld a, $8
	ld [wMusicFade], a
	ld a, LOW(MUSIC_NONE)
	ld [wMusicFadeID], a
	ld a, HIGH(MUSIC_NONE)
	ld [wMusicFadeID + 1], a
	call ClearBGPalettes
	call CloseWindow
	call ClearTilemap
	ld c, 20
	call DelayFrames
	farcall JumpRoamMons
	farcall Function140ae ; time-related
	ld a, [wSpawnAfterChampion]
	cp SPAWN_LANCE
	jr z, .SpawnAfterE4
	ld a, MAPSETUP_CONTINUE
	ldh [hMapEntryMethod], a
	jp FinishContinueFunction

.SpawnAfterE4:
	ld a, SPAWN_SILENT
	ld [wDefaultSpawnpoint], a
	call PostCreditsSpawn
	jp FinishContinueFunction

SpawnAfterRed:
	ld a, SPAWN_SILENT
	ld [wDefaultSpawnpoint], a

PostCreditsSpawn:
	xor a
	ld [wSpawnAfterChampion], a
	ld a, MAPSETUP_WARP
	ldh [hMapEntryMethod], a
	ret

ConfirmContinue:
.loop
	call DelayFrame
	call GetJoypad
	ld hl, hJoyPressed
	bit A_BUTTON_F, [hl]
	ret nz
	bit B_BUTTON_F, [hl]
	jr z, .loop
	scf
	ret

Continue_CheckRTC_RestartClock:
	call CheckRTCStatus
	and %10000000 ; Day count exceeded 16383
	jr z, .pass
	farcall RestartClock
	ld a, c
	and a
	jr z, .pass
	scf
	ret

.pass
	xor a
	ret

FinishContinueFunction:
.loop
	xor a
	ld [wDontPlayMapMusicOnReload], a
	ld [wLinkMode], a
	ld hl, wGameTimerPause
	set GAMETIMERPAUSE_TIMER_PAUSED_F, [hl]
	ld hl, wEnteredMapFromContinue
	set 1, [hl]
	farcall OverworldLoop
	ld a, [wSpawnAfterChampion]
	cp SPAWN_RED
	jp nz, Reset

	call SpawnAfterRed
	jr .loop

DisplaySaveInfoOnContinue:
	call CheckRTCStatus
	and %10000000
	jr z, .clock_ok
	lb de, 4, 8
	jp DisplayContinueDataWithRTCError

.clock_ok
	lb de, 4, 8
	jp DisplayNormalContinueData

DisplaySaveInfoOnSave:
	lb de, 4, 0
	; fallthrough

DisplayNormalContinueData:
	call Continue_LoadMenuHeader
	call Continue_DisplayBadgesDexPlayerName
	call Continue_PrintGameTime
	call LoadFontsExtra
	jp UpdateSprites

DisplayContinueDataWithRTCError:
	call Continue_LoadMenuHeader
	call Continue_DisplayBadgesDexPlayerName
	call Continue_UnknownGameTime
	call LoadFontsExtra
	jp UpdateSprites

Continue_LoadMenuHeader:
	xor a
	ldh [hBGMapMode], a
	ld hl, .MenuHeader_Dex
	ld a, [wStatusFlags]
	bit STATUSFLAGS_POKEDEX_F, a
	jr nz, .show_menu
	ld hl, .MenuHeader_NoDex

.show_menu
	call _OffsetMenuHeader
	call MenuBox
	jp PlaceVerticalMenuItems

.MenuHeader_Dex:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, 9
	dw .MenuData_Dex
	db 1 ; default option

.MenuData_Dex:
	db 0 ; flags
	db 4 ; items
	db "PLAYER@"
	db "BADGES@"
	db "#DEX@"
	db "TIME@"

.MenuHeader_NoDex:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, 9
	dw .MenuData_NoDex
	db 1 ; default option

.MenuData_NoDex:
	db 0 ; flags
	db 4 ; items
	db "PLAYER <PLAYER>@"
	db "BADGES@"
	db " @"
	db "TIME@"

Continue_DisplayBadgesDexPlayerName:
	call MenuBoxCoord2Tile
	push hl
	decoord 13, 4, 0
	add hl, de
	call Continue_DisplayBadgeCount
	pop hl
	push hl
	decoord 12, 6, 0
	add hl, de
	call Continue_DisplayPokedexNumCaught
	pop hl
	push hl
	decoord 8, 2, 0
	add hl, de
	ld de, .Player
	rst PlaceString
	pop hl
	ret

.Player:
	db "<PLAYER>@"

Continue_PrintGameTime:
	decoord 9, 8, 0
	add hl, de
	jp Continue_DisplayGameTime

Continue_UnknownGameTime:
	decoord 9, 8, 0
	add hl, de
	ld de, .three_question_marks
	rst PlaceString
	ret

.three_question_marks
	db " ???@"

Continue_DisplayBadgeCount:
	push hl
	ld hl, wJohtoBadges
	ld b, 2
	call CountSetBits
	pop hl
	ld de, wNumSetBits
	lb bc, 1, 2
	jp PrintNum

Continue_DisplayPokedexNumCaught:
	ld a, [wStatusFlags]
	bit STATUSFLAGS_POKEDEX_F, a
	ret z
	push hl
	ld hl, wPokedexCaught
if NUM_POKEMON % 8
	ld b, NUM_POKEMON / 8 + 1
else
	ld b, NUM_POKEMON / 8
endc
	call CountSetBits
	pop hl
	ld de, wNumSetBits
	lb bc, 1, 3
	jp PrintNum

Continue_DisplayGameTime:
	ld de, wGameTimeHours
	lb bc, 2, 3
	call PrintNum
	ld [hl], "<COLON>"
	inc hl
	ld de, wGameTimeMinutes
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	jp PrintNum

OakSpeech:
	ld a, POTION
	ld [wCurItem], a
	ld a, 1
	ld [wItemQuantityChangeBuffer], a
	ld hl, wNumPCItems
	call ReceiveItem

	call RotateFourPalettesLeft
	call ClearTilemap

	ld de, MUSIC_ROUTE_30
	call PlayMusic

	call RotateFourPalettesRight
	call RotateThreePalettesRight
	ld a, POKEMON_PROF
	call Intro_PrepTrainerPic

	ld b, SCGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	call Intro_RotatePalettesLeftFrontpic

	ld hl, OakText1
	call PrintText
	call RotateThreePalettesRight
	call ClearTilemap

	ld a, WOOPER
	ld [wCurSpecies], a
	ld [wCurPartySpecies], a
	call GetBaseData

	hlcoord 6, 4
	call PrepMonFrontpic

	xor a
	ld [wTempMonDVs], a
	ld [wTempMonDVs + 1], a

	ld b, SCGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	call Intro_WipeInFrontpic

	ld hl, OakText2
	call PrintText
	ld hl, OakText4
	call PrintText
	call RotateThreePalettesRight
	call ClearTilemap

	call Intro_PrepPlayerPic

	ld b, SCGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	call Intro_RotatePalettesLeftFrontpic

	ld hl, OakText6
	call PrintText
	call NamePlayer

	ld hl, OakTextYourNameIs
	call PrintText
	call RotateThreePalettesRight
	call ClearTilemap

	ld a, RIVAL1
	call Intro_PrepTrainerPic

	ld b, SCGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	call Intro_RotatePalettesLeftFrontpic

	ld hl, OakTextIntroduceRival
	call PrintText
	call NameRival

	ld hl, OakTextOkHisNameIs
	call PrintText
	call RotateThreePalettesRight
	call ClearTilemap

	call Intro_PrepPlayerPic

	ld b, SCGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	call Intro_RotatePalettesLeftFrontpic

	ld hl, OakText7
	jp PrintText

OakText1:
	text_far _OakText1
	text_end

OakText2:
	text_far _OakText2
	text_asm
	ld a, WOOPER
	call PlayMonCry
	call WaitSFX
	ld hl, OakText3
	ret

OakText3:
	text_far _OakText3
	text_end

OakText4:
	text_far _OakText4
	text_end

OakText6:
	text_far _OakText6
	text_end

OakTextYourNameIs:
	text_far _OakTextYourNameIs
	text_end

OakTextIntroduceRival:
	text_far _OakTextIntroduceRival
	text_end

OakTextOkHisNameIs:
	text_far _OakTextOkHisNameIs
	text_end

OakText7:
	text_far _OakText7
	text_end

NamePlayer:
	farcall MovePlayerPicRight
	farcall ShowPlayerNamingChoices
	ld a, [wMenuCursorY]
	dec a
	jr z, .NewName
	call StorePlayerName
	farcall ApplyMonOrTrainerPals
	farcall MovePlayerPicLeft
	ret

.NewName:
	ld b, NAME_PLAYER
	ld de, wPlayerName
	farcall NamingScreen

	call RotateThreePalettesRight
	call ClearTilemap

	call LoadFontsExtra
	call WaitBGMap

	call Intro_PrepPlayerPic

	ld b, SCGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	call RotateThreePalettesLeft

	ld hl, wPlayerName
	ld de, .Hiro
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .Male
	ld de, .Sylvia
.Male:
	jp InitName

.Hiro:
	db "HIRO@@@@@@@"
.Sylvia:
	db "SYLVIA@@@@@"

NameRival:
	farcall MovePlayerPicRight
	farcall ShowRivalNamingChoices
	ld a, [wMenuCursorY]
	dec a
	jr z, .NewName
	call StoreRivalName
	farcall ApplyMonOrTrainerPals
	farcall MovePlayerPicLeft
	ret

.NewName:
	ld b, NAME_RIVAL
	ld de, wRivalName
	farcall NamingScreen

	call RotateThreePalettesRight
	call ClearTilemap

	call LoadFontsExtra
	call WaitBGMap

	ld a, RIVAL1
	call Intro_PrepTrainerPic

	ld b, SCGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	call RotateThreePalettesLeft

	ld hl, wRivalName
	ld de, .Rival
	jp InitName

.Rival:
	db "KAMON@@@@@@"

StorePlayerName:
	ld a, "@"
	ld bc, NAME_LENGTH
	ld hl, wPlayerName
	rst ByteFill
	ld hl, wPlayerName
	ld de, wStringBuffer2
	jp CopyName2

StoreRivalName:
	ld a, "@"
	ld bc, NAME_LENGTH
	ld hl, wRivalName
	rst ByteFill
	ld hl, wRivalName
	ld de, wStringBuffer2
	jp CopyName2

ShrinkPlayer:
	ldh a, [hROMBank]
	push af

	ld a, 32 ; fade time
	ld [wMusicFade], a
	ld de, MUSIC_NONE
	ld a, e
	ld [wMusicFadeID], a
	ld a, d
	ld [wMusicFadeID + 1], a

	ld de, SFX_ESCAPE_ROPE
	call PlaySFX
	pop af
	rst Bankswitch

	ld c, 8
	call DelayFrames

	ld hl, Shrink1Pic
	ld b, BANK(Shrink1Pic)
	call ShrinkFrame

	ld c, 8
	call DelayFrames

	ld hl, Shrink2Pic
	ld b, BANK(Shrink2Pic)
	call ShrinkFrame

	ld c, 8
	call DelayFrames

	hlcoord 6, 5
	lb bc, 7, 7
	call ClearBox

	ld c, 3
	call DelayFrames

	call Intro_PlacePlayerSprite
	call LoadFontsExtra

	ld c, 50
	call DelayFrames

	call RotateThreePalettesRight
	jp ClearTilemap

Intro_RotatePalettesLeftFrontpic:
	ld hl, IntroFadePalettes
	ld b, IntroFadePalettes.End - IntroFadePalettes
.loop
	ld a, [hli]
	call DmgToCgbBGPals
	ld c, 10
	call DelayFrames
	dec b
	jr nz, .loop
	ret

IntroFadePalettes:
	dc 1, 1, 1, 0
	dc 2, 2, 2, 0
	dc 3, 3, 3, 0
	dc 3, 3, 2, 0
	dc 3, 3, 1, 0
	dc 3, 2, 1, 0
.End

Intro_WipeInFrontpic:
	ld a, $77
	ldh [hWX], a
	call DelayFrame
	ld a, %11100100
	call DmgToCgbBGPals
.loop
	call DelayFrame
	ldh a, [hWX]
	sub $8
	cp -1
	ret z
	ldh [hWX], a
	jr .loop

Intro_PrepPlayerPic:
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	ld a, HIRO
	jr z, .GotClass
	assert HIRO + 1 == SYLVIA
	inc a ; SYLVIA
.GotClass
Intro_PrepTrainerPic:
	ld [wTrainerClass], a
	xor a
	ld [wCurPartySpecies], a
	ld de, vTiles2
	farcall GetTrainerPic
	xor a
	ldh [hGraphicStartTile], a
	hlcoord 6, 4
	lb bc, 7, 7
	predef_jump PlaceGraphic

ShrinkFrame:
	ld de, vTiles2
	ld c, 7 * 7
	predef DecompressGet2bpp
	xor a
	ldh [hGraphicStartTile], a
	hlcoord 6, 4
	lb bc, 7, 7
	predef_jump PlaceGraphic

Intro_PlacePlayerSprite:
	farcall GetPlayerIcon
	ld c, $c
	ld hl, vTiles0
	call Request2bpp

	ld hl, wVirtualOAMSprite00
	ld de, .sprites
	ld a, [de]
	inc de

	ld c, a
.loop
	ld a, [de]
	inc de
	ld [hli], a ; y
	ld a, [de]
	inc de
	ld [hli], a ; x
	ld a, [de]
	inc de
	ld [hli], a ; tile id

	ld b, PAL_OW_RED
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .male
	ld b, PAL_OW_BLUE
.male
	ld a, b

	ld [hli], a
	dec c
	jr nz, .loop
	ret

.sprites
	db 4
	; y pxl, x pxl, tile offset
	db  9 * 8 + 4,  9 * 8, 0
	db  9 * 8 + 4, 10 * 8, 1
	db 10 * 8 + 4,  9 * 8, 2
	db 10 * 8 + 4, 10 * 8, 3

CrystalIntroSequence:
	farcall Copyright_GFPresents
	jr c, StartTitleScreen
	;farcall SpaceworldIntro

	; fallthrough

StartTitleScreen:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a

	call .TitleScreen
	call DelayFrame
.loop
	call RunTitleScreen
	jr nc, .loop

	call ClearSprites
	call ClearBGPalettes

	pop af
	ldh [rSVBK], a

	ld hl, rLCDC
	res rLCDC_SPRITE_SIZE, [hl] ; 8x8
	call ClearScreen
	call WaitBGMap2
	xor a
	ldh [hLCDCPointer], a
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, $7
	ldh [hWX], a
	ld a, $90
	ldh [hWY], a
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call UpdateTimePals
	ld a, [wIntroSceneFrameCounter]
	cp $5
	jr c, .ok
	xor a
.ok
	call AnonJumpTable
.dw
	dw _MainMenu
	dw DeleteSaveData
	dw CrystalIntroSequence
	dw CrystalIntroSequence
	dw ResetClock

.TitleScreen:
	farcall _TitleScreen
	ret

RunTitleScreen:
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .done_title
	call TitleScreenScene
	call DelayFrame
	and a
	ret

.done_title
	scf
	ret

TitleScreenScene:
	call AnonJumpTable
.scenes
	dw TitleScreenEntrance
	dw TitleScreenTimer
	dw TitleScreenMain
	dw TitleScreenEnd

TitleScreenEntrance:
; Next scene
	ld hl, wJumptableIndex
	inc [hl]

; Play the title screen music.
	ld de, MUSIC_TITLE
	jp PlayMusic


TitleScreenTimer:
; Next scene
	ld hl, wJumptableIndex
	inc [hl]

; Start a timer
	ld hl, wTitleScreenTimer
	ld de, 73 * 60 + 36
	ld [hl], e
	inc hl
	ld [hl], d
	ret

TitleScreenMain:
; Run the timer down.
	ld hl, wTitleScreenTimer
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, e
	or d
	jr z, .end

	dec de
	ld [hl], d
	dec hl
	ld [hl], e

; Save data can be deleted by pressing Up + B + Select.
	call GetJoypad
	ld hl, hJoyDown
	ld a, [hl]
	and D_UP + B_BUTTON + SELECT
	cp  D_UP + B_BUTTON + SELECT
	jr z, .delete_save_data

; Press Down + B + Select to reset the clock.
	ld a, [hl]
	and D_DOWN + B_BUTTON + SELECT
	cp  D_DOWN + B_BUTTON + SELECT
	jr z, .clock_reset

; Press Start or A to start the game.
	ld a, [hl]
	and START | A_BUTTON
	jr nz, .incave
	ret

.incave
	xor a
	jr .done

.delete_save_data
	ld a, 1

.done
	ld [wIntroSceneFrameCounter], a

; Return to the intro sequence.
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

.end
; Next scene
	ld hl, wJumptableIndex
	inc [hl]

; Fade out the title screen music
	xor a ; MUSIC_NONE
	ld [wMusicFadeID], a
	ld [wMusicFadeID + 1], a
	ld hl, wMusicFade
	ld [hl], 8 ; 1 second

	ld hl, wTitleScreenTimer
	inc [hl]
	ret

.clock_reset
	ld a, 4
	ld [wIntroSceneFrameCounter], a

; Return to the intro sequence.
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

TitleScreenEnd:
; Wait until the music is done fading.

	ld hl, wTitleScreenTimer
	inc [hl]

	ld a, [wMusicFade]
	and a
	ret nz

	ld a, 2
	ld [wIntroSceneFrameCounter], a

; Back to the intro.
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

DeleteSaveData:
	farcall _DeleteSaveData
	jp Init

ResetClock:
	farcall _ResetClock
	jp Init

Copyright:
	call ClearTilemap
	call LoadFontsExtra
	ld de, CopyrightGFX
	ld hl, vTiles2 tile $60
	lb bc, BANK(CopyrightGFX), 29
	call Request2bpp
	hlcoord 2, 7
	ld de, CopyrightString
	rst PlaceString
	ret

CopyrightString:
	; ©1995-2001 Nintendo
	db   $60, $61, $62, $63, $64, $65, $66
	db   $67, $68, $69, $6a, $6b, $6c

	; ©1995-2001 Creatures inc.
	next $60, $61, $62, $63, $64, $65, $66
	db   $6d, $6e, $6f, $70, $71, $72, $7a, $7b, $7c

	; ©1995-2001 GAME FREAK inc.
	next $60, $61, $62, $63, $64, $65, $66
	db   $73, $74, $75, $76, $77, $78, $79, $7a, $7b, $7c

	db "@"

GameInit::
	farcall TryLoadSaveData
	call ClearWindowData
	call ClearBGPalettes
	call ClearTilemap
	ld a, HIGH(vBGMap0)
	ldh [hBGMapAddress + 1], a
	xor a ; LOW(vBGMap0)
	ldh [hBGMapAddress], a
	ldh [hJoyDown], a
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, $90
	ldh [hWY], a
	call WaitBGMap
	jp CrystalIntroSequence

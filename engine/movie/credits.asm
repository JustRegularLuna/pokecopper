INCLUDE "constants.asm"


SECTION "Credits", ROMX

Credits::
	bit 6, b ; Hall Of Fame
	ld a, $0
	jr z, .okay
	ld a, $40
.okay
	ld [wJumptableIndex], a

	ldh a, [rSVBK]
	push af
	ld a, BANK(wGBCPalettes)
	ldh [rSVBK], a

	call ClearBGPalettes
	call ClearTilemap
	call ClearSprites

	ld hl, wCreditsBlankFrame2bpp
	ld c, (wCreditsBlankFrame2bppEnd - wCreditsBlankFrame2bpp) / 2
	ld de, `22222222 ; eight pixels, each color #2 (dark)

; Fill wCreditsBlankFrame2bpp with 4x4=16 tiles, all solid dark color
; (the same color used for the four border frame mons' backgrounds)

.load_loop
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	dec c
	jr nz, .load_loop

	ld de, CreditsBorderGFX
	ld hl, vTiles2 tile $20
	lb bc, BANK(CreditsBorderGFX), 9
	call Request2bpp

	ld de, CopyrightGFX
	ld hl, vTiles2 tile $60
	lb bc, BANK(CopyrightGFX), 29
	call Request2bpp

	ld de, TheEndGFX
	ld hl, vTiles2 tile $40
	lb bc, BANK(TheEndGFX), 16
	call Request2bpp

	ld a, $ff
	ld [wCreditsBorderFrame], a
	xor a
	ld [wCreditsBorderMon], a

	ld de, wCreditsBlankFrame2bpp
	ld hl, vTiles2
	lb bc, BANK(CreditsBorderGFX), 16
	call Request2bpp

	call ConstructCreditsTilemap
	xor a
	ld [wCreditsLYOverride], a

	ld hl, wLYOverrides
	ld bc, $100
	xor a
	call ByteFill

	ld a, LOW(rSCX)
	ldh [hLCDCPointer], a

	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call SetPalettes
	ldh a, [hVBlank]
	push af
	ld a, $5
	ldh [hVBlank], a
	ldh a, [hInMenu]
	push af
	ld a, $1
	ldh [hInMenu], a
	xor a
	ldh [hBGMapMode], a
	ld [wCreditsPos], a
	ld [wCreditsPos + 1], a
	ld [wCreditsTimer], a

.execution_loop
	call Credits_HandleBButton
	call Credits_HandleAButton
	jr nz, .exit_credits

	call Credits_Jumptable
	call DelayFrame
	jr .execution_loop

.exit_credits
	call ClearBGPalettes
	xor a
	ldh [hLCDCPointer], a
	ldh [hBGMapAddress], a
	pop af
	ldh [hInMenu], a
	pop af
	ldh [hVBlank], a
	pop af
	ldh [rSVBK], a
	ret

Credits_HandleAButton:
	ldh a, [hJoypadDown]
	and A_BUTTON
	ret z
	ld a, [wJumptableIndex]
	bit 7, a
	ret

Credits_HandleBButton:
	ldh a, [hJoypadDown]
	and B_BUTTON
	ret z
	ld a, [wJumptableIndex]
	bit 6, a
	ret z
	ld hl, wCreditsPos
	ld a, [hli]
	cp $d
	jr nc, .okay
	ld a, [hli]
	and a
	ret z
.okay
	ld hl, wCreditsTimer
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ret

Credits_Jumptable:
	ld a, [wJumptableIndex]
	and $f
	ld e, a
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
	dw ParseCredits
	dw Credits_Next
	dw Credits_Next
	dw Credits_PrepBGMapUpdate
	dw Credits_UpdateGFXRequestPath
	dw Credits_RequestGFX
	dw Credits_LYOverride
	dw Credits_Next
	dw Credits_Next
	dw Credits_Next
	dw Credits_UpdateGFXRequestPath
	dw Credits_RequestGFX
	dw Credits_LoopBack

Credits_Next:
	ld hl, wJumptableIndex
	inc [hl]
	ret

Credits_LoopBack:
	ld hl, wJumptableIndex
	ld a, [hl]
	and $f0
	ld [hl], a
	ret

Credits_PrepBGMapUpdate:
	xor a
	ldh [hBGMapMode], a
	jp Credits_Next

Credits_UpdateGFXRequestPath:
	ld hl, wCreditsBlankFrame2bpp
	ld a, l
	ld [wRequested2bppSource], a
	ld a, h
	ld [wRequested2bppSource + 1], a
	ld a, LOW(vTiles2)
	ld [wRequested2bppDest], a
	ld a, HIGH(vTiles2)
	ld [wRequested2bppDest + 1], a
	jr Credits_RequestGFX

Credits_RequestGFX:
	xor a
	ldh [hBGMapMode], a
	ld a, $8
	ld [wRequested2bpp], a
	jp Credits_Next

Credits_LYOverride:
	ldh a, [rLY]
	cp $30
	jr c, Credits_LYOverride
	ld a, [wCreditsLYOverride]
	dec a
	dec a
	ld [wCreditsLYOverride], a
	ld hl, wLYOverrides + $1f
	call .Fill
	ld hl, wLYOverrides + $87
	call .Fill
	jp Credits_Next

.Fill:
	ld c, $8
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	ret

ParseCredits:
	ld hl, wJumptableIndex
	bit 7, [hl]
	jp nz, .done

; Wait until the timer has run out to parse the next command.
	ld hl, wCreditsTimer
	ld a, [hl]
	and a
	jr z, .parse

; One tick has passed.
	dec [hl]
	jp .done

.parse
; First, let's clear the current text display,
; starting from line 5.
	xor a
	ldh [hBGMapMode], a
	hlcoord 0, 5
	ld bc, 20 * 12
	ld a, " "
	call ByteFill

; Then read the script.

.loop
	call .get

; Commands:
	cp CREDITS_END
	jp z, .end
	cp CREDITS_WAIT
	jr z, .wait
	cp CREDITS_SCENE
	jr z, .scene
	cp CREDITS_CLEAR
	jr z, .clear
	cp CREDITS_MUSIC
	jr z, .music
	cp CREDITS_WAIT2
	jr z, .wait2
	cp CREDITS_THEEND
	jr z, .theend

; If it's not a command, it's a string identifier.

	push af
	ld e, a
	ld d, 0
	ld hl, CreditsStrings
	add hl, de
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop af

; Strings spanning multiple lines have special cases.

	cp COPYRIGHT
	jr z, .copyright

	cp STAFF
	jr c, .staff

; The rest start from line 6.

	hlcoord 0, 6
	jr .print

.copyright
	hlcoord 2, 6
	jr .print

.staff
	hlcoord 0, 6

.print
; Print strings spaced every two lines.
	call .get
	ld bc, 20 * 2
	call AddNTimes
	call PlaceString
	jr .loop

.theend
; Display "The End" graphic.
	call Credits_TheEnd
	jr .loop

.scene
; Update the scene number and corresponding palette.
	call .get
	ld [wCreditsBorderMon], a ; scene
	xor a
	ld [wCreditsBorderFrame], a ; frame
	jr .loop

.clear
; Clear the banner.
	ld a, $ff
	ld [wCreditsBorderFrame], a ; frame
	jr .loop

.music
; Play the credits music.
	ld de, MUSIC_CREDITS
	push de
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	pop de
	call PlayMusic
	jp .loop

.wait2
; Wait for some amount of ticks.
	call .get
	ld [wCreditsTimer], a
	jr .done

.wait
; Wait for some amount of ticks, and do something else.
	call .get
	ld [wCreditsTimer], a

	xor a
	ldh [hBGMapThird], a
	ld a, 1
	ldh [hBGMapMode], a

.done
	jp Credits_Next

.end
; Stop execution.
	ld hl, wJumptableIndex
	set 7, [hl]
	ld a, 32
	ld [wMusicFade], a
	ld a, LOW(MUSIC_POST_CREDITS)
	ld [wMusicFadeID], a
	ld a, HIGH(MUSIC_POST_CREDITS)
	ld [wMusicFadeID + 1], a
	ret

.get
; Get byte wCreditsPos from CreditsScript
	push hl
	push de
	ld a, [wCreditsPos]
	ld e, a
	ld a, [wCreditsPos + 1]
	ld d, a
	ld hl, CreditsScript
	add hl, de

	inc de
	ld a, e
	ld [wCreditsPos], a
	ld a, d
	ld [wCreditsPos + 1], a
	ld a, [hl]
	pop de
	pop hl
	ret

ConstructCreditsTilemap:
	xor a
	ldh [hBGMapMode], a
	ld a, $c
	ldh [hBGMapAddress], a

	ld a, $28
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	call ByteFill

	ld a, $7f
	hlcoord 0, 4
	ld bc, (SCREEN_HEIGHT - 4) * SCREEN_WIDTH
	call ByteFill

	hlcoord 0, 4
	ld a, $24
	call DrawCreditsBorder

	hlcoord 0, 17
	ld a, $20
	call DrawCreditsBorder

	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	xor a
	call ByteFill

	call WaitBGMap2
	xor a
	ldh [hBGMapMode], a
	ldh [hBGMapAddress], a
	hlcoord 0, 0
	call .InitTopPortion
	call WaitBGMap2
	ret

.InitTopPortion:
	ld b, 5
.outer_loop
	push hl
	ld de, SCREEN_WIDTH - 3
	ld c, 4
	xor a
.inner_loop
rept 3
	ld [hli], a
	inc a
endr
	ld [hl], a
	inc a
	add hl, de
	dec c
	jr nz, .inner_loop
	pop hl
rept 4
	inc hl
endr
	dec b
	jr nz, .outer_loop
	ret

DrawCreditsBorder:
	ld c, SCREEN_WIDTH / 4
.loop
	push af
rept 3
	ld [hli], a
	inc a
endr
	ld [hli], a
	pop af
	dec c
	jr nz, .loop
	ret

Credits_TheEnd:
	ld a, $40
	hlcoord 6, 9
	call .Load
	hlcoord 6, 10
.Load:
	ld c, 8
.loop
	ld [hli], a
	inc a
	dec c
	jr nz, .loop
	ret

CreditsBorderGFX:    INCBIN "gfx/credits/border.2bpp"

INCLUDE "data/credits_script.asm"
INCLUDE "data/credits_strings.asm"

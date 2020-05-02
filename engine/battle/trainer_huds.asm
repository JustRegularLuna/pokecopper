BattleStart_TrainerHuds:
	ld a, $e4
	ldh [rOBP0], a
	call LoadBallIconGFX
	call ShowPlayerMonsRemaining
	ld a, [wBattleMode]
	dec a
	ret z
	jp ShowOTTrainerMonsRemaining

EnemySwitch_TrainerHud:
	ld a, $e4
	ldh [rOBP0], a
	call LoadBallIconGFX
	jp ShowOTTrainerMonsRemaining

ShowPlayerMonsRemaining:
	call DrawPlayerPartyIconHUDBorder
	ld hl, wPartyMon1HP
	ld de, wPartyCount
	call StageBallTilesData
	; ldpixel wPlaceBallsX, 12, 12
	ld a, 12 * 8
	ld hl, wPlaceBallsX
	ld [hli], a
	ld [hl], a
	ld a, 8
	ld [wPlaceBallsDirection], a
	ld hl, wVirtualOAMSprite00
	jp LoadTrainerHudOAM

ShowOTTrainerMonsRemaining:
	call DrawEnemyHUDBorder
	ld hl, wOTPartyMon1HP
	ld de, wOTPartyCount
	call StageBallTilesData
	; ldpixel wPlaceBallsX, 9, 4
	ld hl, wPlaceBallsX
	ld a, 9 * 8
	ld [hli], a
	ld [hl], 4 * 8
	ld a, -8
	ld [wPlaceBallsDirection], a
	ld hl, wVirtualOAMSprite00 + PARTY_LENGTH * SPRITEOAMSTRUCT_LENGTH
	jp LoadTrainerHudOAM

StageBallTilesData:
	ld a, [de]
	push af
	ld de, wBuffer1
	ld c, PARTY_LENGTH
	ld a, $34 ; empty slot
.loop1
	ld [de], a
	inc de
	dec c
	jr nz, .loop1
	pop af
	ld de, wBuffer1
.loop2
	push af
	call .GetHUDTile
	inc de
	pop af
	dec a
	jr nz, .loop2
	ret

.GetHUDTile:
	ld a, [hli]
	and a
	jr nz, .got_hp
	ld a, [hl]
	and a
	ld b, $33 ; fainted
	jr z, .fainted

.got_hp
	dec hl
	dec hl
	dec hl
	ld a, [hl]
	and a
	ld b, $32 ; statused
	jr nz, .load
	dec b ; normal
	jr .load

.fainted
	dec hl
	dec hl
	dec hl

.load
	ld a, b
	ld [de], a
	ld bc, PARTYMON_STRUCT_LENGTH + MON_HP - MON_STATUS
	add hl, bc
	ret

DrawPlayerHUDBorder:
	ld hl, .tiles
	ld de, wTrainerHUDTiles
	ld bc, .tiles_end - .tiles
	rst CopyBytes
	hlcoord 18, 10
	ld de, -1 ; start on right
	jr PlaceHUDBorderTiles

.tiles
	db $6d ; right side
	db $6f ; bottom right
	db $72 ; bottom left
	db $62 ; bottom side
.tiles_end

DrawPlayerPartyIconHUDBorder:
	ld hl, .tiles
	ld de, wTrainerHUDTiles
	ld bc, .tiles_end - .tiles
	rst CopyBytes
	hlcoord 18, 10
	ld de, -1 ; start on right
	jr PlaceHUDBorderTiles

.tiles
	db $6d ; right side
	db $6e ; bottom right
	db $72 ; bottom left
	db $62 ; bottom side
.tiles_end

DrawEnemyHUDBorder:
	ld hl, .tiles
	ld de, wTrainerHUDTiles
	ld bc, .tiles_end - .tiles
	rst CopyBytes
	hlcoord 1, 2
	ld de, 1 ; start on left
	call PlaceHUDBorderTiles
	ld a, [wBattleMode]
	dec a
	ret nz
	ld a, [wTempEnemyMonSpecies]
	dec a
	call CheckCaughtMon
	ret z
	hlcoord 1, 1
	ld [hl], $7b
	ret

.tiles
	db $70 ; left side
	db $71 ; bottom left
	db $7a ; bottom right
	db $62 ; bottom side
.tiles_end

PlaceHUDBorderTiles:
	ld a, [wTrainerHUDTiles + 0]
	ld [hl], a
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld a, [wTrainerHUDTiles + 1]
	ld [hl], a
	ld b, 8
.loop
	add hl, de
	ld a, [wTrainerHUDTiles + 3]
	ld [hl], a
	dec b
	jr nz, .loop
	add hl, de
	ld a, [wTrainerHUDTiles + 2]
	ld [hl], a
	ret

LinkBattle_TrainerHuds:
	call LoadBallIconGFX
	ld hl, wPartyMon1HP
	ld de, wPartyCount
	call StageBallTilesData
	ld hl, wPlaceBallsX
	ld a, 10 * 8
	ld [hli], a
	ld [hl], 8 * 8
	ld a, 8
	ld [wPlaceBallsDirection], a
	ld hl, wVirtualOAMSprite00
	call LoadTrainerHudOAM

	ld hl, wOTPartyMon1HP
	ld de, wOTPartyCount
	call StageBallTilesData
	ld hl, wPlaceBallsX
	ld a, 10 * 8
	ld [hli], a
	ld [hl], 13 * 8
	ld hl, wVirtualOAMSprite00 + PARTY_LENGTH * SPRITEOAMSTRUCT_LENGTH
	; fallthrough

LoadTrainerHudOAM:
	ld de, wBuffer1
	ld c, PARTY_LENGTH
.loop
	ld a, [wPlaceBallsY]
	ld [hli], a ; y
	ld a, [wPlaceBallsX]
	ld [hli], a ; x
	ld a, [de]
	ld [hli], a ; tile id
	ld a, PAL_BATTLE_OB_YELLOW
	ld [hli], a ; attributes
	ld a, [wPlaceBallsX]
	ld b, a
	ld a, [wPlaceBallsDirection]
	add b
	ld [wPlaceBallsX], a
	inc de
	dec c
	jr nz, .loop
	ret

LoadBallIconGFX:
	ld de, .gfx
	ld hl, vTiles0 tile $31
	lb bc, BANK(LoadBallIconGFX), 4
	jp Get2bpp_2

.gfx
INCBIN "gfx/battle/balls.2bpp"

_ShowLinkBattleParticipants:
	call ClearBGPalettes
	call LoadFontsExtra
	hlcoord 2, 3
	lb bc, 9, 14
	call Textbox
	hlcoord 4, 5
	ld de, wPlayerName
	rst PlaceString
	hlcoord 4, 10
	ld de, wOTPlayerName
	rst PlaceString
	hlcoord 9, 8
	ld a, "<BOLD_V>"
	ld [hli], a
	ld [hl], "<BOLD_S>"
	farcall LinkBattle_TrainerHuds ; no need to farcall
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call SetPalettes
	ld a, $e4
	ldh [rOBP0], a
	ret

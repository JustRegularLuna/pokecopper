LoadBattleMenu:
	ld hl, BattleMenuHeader
	call LoadMenuHeader
	ld a, [wBattleMenuCursorBuffer]
	ld [wMenuCursorBuffer], a
	call InterpretBattleMenu
	ld a, [wMenuCursorBuffer]
	ld [wBattleMenuCursorBuffer], a
	jp ExitMenu

SafariBattleMenu:
	ld hl, SafariBattleMenuDataHeader
	call LoadMenuHeader
	jr DoSafariOrContestMenu

ContestBattleMenu:
	ld hl, ContestBattleMenuDataHeader
	call LoadMenuHeader

DoSafariOrContestMenu:
	ld a, [wBattleMenuCursorBuffer]
	ld [wMenuCursorBuffer], a
	call _2DMenu
	ld a, [wMenuCursorBuffer]
	ld [wBattleMenuCursorBuffer], a
	jp ExitMenu

BattleMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 8, 12, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw MenuData_0x24f34
	db 1 ; default option

MenuData_0x24f34:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 2, 2 ; rows, columns
	db 6 ; spacing
	dba Strings24f3d
	dbw BANK(MenuData_0x24f34), 0

Strings24f3d:
	db "FIGHT@"
	db "<PK><MN>@"
	db "PACK@"
	db "RUN@"

SafariBattleMenuDataHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 12, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 2, 2 ; rows, columns
	db 11 ; spacing
	dba .Strings
	dba ShowSafariBallsRemaining

.Strings:
	db "BALL×  @"
	db "BAIT@"
	db "ROCK@"
	db "RUN@"

ShowSafariBallsRemaining:
	hlcoord 17, 13
	ld de, wSafariBallsRemaining
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	jp PrintNum

ContestBattleMenuDataHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 2, 12, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 2, 2 ; rows, columns
	db 12 ; spacing
	dba .Strings
	dba ShowParkBallsRemaining

.Strings:
	db "FIGHT@"
	db "<PK><MN>@"
	db "PARKBALL×  @"
	db "RUN@"

ShowParkBallsRemaining:
	hlcoord 13, 16
	ld de, wParkBallsRemaining
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	jp PrintNum

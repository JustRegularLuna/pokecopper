HiroNameMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 10, TEXTBOX_Y - 1
	dw .MaleNames
	db 1 ; ????
	db 0 ; default option

.MaleNames:
	db STATICMENU_CURSOR | STATICMENU_PLACE_TITLE | STATICMENU_DISABLE_B ; flags
	db 5 ; items
	db "NEW NAME@"
IF DEF(_REDGOLD)
	db "GOLD@"
	db "HIRO@"
	db "TAYLOR@"
	db "KARL@"
ELIF DEF(_BLUESILVER)
	db "SILVER@"
	db "HIRO@"
	db "TAYLOR@"
	db "KARL@"
ENDC
	db 2 ; displacement
	db " NAME @" ; title


SylviaNameMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 10, TEXTBOX_Y - 1
	dw .FemaleNames
	db 1 ; ????
	db 0 ; default option

.FemaleNames:
	db STATICMENU_CURSOR | STATICMENU_PLACE_TITLE | STATICMENU_DISABLE_B ; flags
	db 5 ; items
	db "NEW NAME@"
IF DEF(_REDGOLD)
	db "GOLD@"
	db "SYLVIA@"
	db "TAYLOR@"
	db "CARLY@"
ELIF DEF(_BLUESILVER)
	db "SILVER@"
	db "SYLVIA@"
	db "TAYLOR@"
	db "CARLY@"
ENDC
	db 2 ; displacement
	db " NAME @" ; title


RivalNameMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 10, TEXTBOX_Y - 1
	dw .RivalNames
	db 1 ; ????
	db 0 ; default option

.RivalNames:
	db STATICMENU_CURSOR | STATICMENU_PLACE_TITLE | STATICMENU_DISABLE_B ; flags
	db 5 ; items
	db "NEW NAME@"
RivalNameArray:
IF DEF(_REDGOLD)
	db "SILVER@"
	db "KAMON@"
	db "OSCAR@"
	db "MAX@"
ELIF DEF(_BLUESILVER)
	db "GOLD@"
	db "KAMON@"
	db "OSCAR@"
	db "MAX@"
ENDC
	db 2 ; displacement
	db " NAME @" ; title

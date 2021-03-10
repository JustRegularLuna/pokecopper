HiroNameMenuHeader:
	db STATICMENU_NO_TOP_SPACING
	menu_coords 0, 0, 10, TEXTBOX_Y - 1
	dw .Names
	db 1

.Names:
	db STATICMENU_CURSOR | STATICMENU_PLACE_TITLE | STATICMENU_DISABLE_B ; flags
	db 5 ; items
	db "NEW NAME@"

HiroNameArray:
IF DEF(_GOLD)
	db "GOLD@"
	db "HIRO@"
	db "TAYLOR@"
	db "KARL@"
ELIF DEF(_SILVER)
	db "SILVER@"
	db "KAMON@"
	db "OSCAR@"
	db "MAX@"
ENDC
	db 2
	db "NAME@" ; title


SylviaNameMenuHeader:
	db STATICMENU_NO_TOP_SPACING
	menu_coords 0, 0, 10, TEXTBOX_Y - 1
	dw .Names
	db 1

.Names:
	db STATICMENU_CURSOR | STATICMENU_PLACE_TITLE | STATICMENU_DISABLE_B ; flags
	db 5 ; items
	db "NEW NAME@"

SylviaNameArray:
IF DEF(_GOLD)
	db "GOLD@"
	db "SYLVIA@"
	db "TAYLOR@"
	db "CARLY@"
ELIF DEF(_SILVER)
	db "SILVER@"
	db "SYLVIA@"
	db "TAYLOR@"
	db "CARLY@"
ENDC
	db 2
	db "NAME@" ; title


KamonNameMenuHeader:
	db STATICMENU_NO_TOP_SPACING
	menu_coords 0, 0, 10, TEXTBOX_Y - 1
	dw .Names
	db 1

.Names:
	db STATICMENU_CURSOR | STATICMENU_PLACE_TITLE | STATICMENU_DISABLE_B ; flags
	db 5 ; items
	db "NEW NAME@"

KamonNameArray:
IF DEF(_GOLD)
	db "SILVER@"
	db "KAMON@"
	db "OSCAR@"
	db "MAX@"
ELIF DEF(_SILVER)
	db "GOLD@"
	db "HIRO@"
	db "TAYLOR@"
	db "KARL@"
ENDC
	db 2
	db "NAME@" ; title

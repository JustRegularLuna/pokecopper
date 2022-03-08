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
IF DEF(_COPPER)
	db "COPPER@"
	db "HIRO@"
	db "TAYLOR@"
	db "KARL@"
ELIF DEF(_TIN)
	db "TIN@"
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
IF DEF(_COPPER)
	db "COPPER@"
	db "SYLVIA@"
	db "TAYLOR@"
	db "CARLY@"
ELIF DEF(_TIN)
	db "TIN@"
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
IF DEF(_COPPER)
	db "TIN@"
	db "KAMON@"
	db "OSCAR@"
	db "MAX@"
ELIF DEF(_TIN)
	db "COPPER@"
	db "HIRO@"
	db "TAYLOR@"
	db "KARL@"
ENDC
	db 2
	db "NAME@" ; title

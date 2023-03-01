MACRO newgroup
const_value = const_value + 1
	enum_start 1
ENDM

MACRO map_const
;\1: map id
;\2: width: in blocks
;\3: height: in blocks
GROUP_\1 EQU const_value
	enum MAP_\1
\1_WIDTH EQU \2
\1_HEIGHT EQU \3
ENDM

; map group ids
; `newgroup` indexes are for:
; - MapGroupPointers (see data/maps/maps.asm)
; - MapGroupRoofs (see data/maps/roofs.asm)
; - OutdoorSprites (see data/maps/outdoor_sprites.asm)
; - MapPals (see data/maps/sgb_roof_pal_inds.asm)
; `map_const` indexes are for the sub-tables of MapGroupPointers (see data/maps/maps.asm)
; Each map also has associated data:
; - attributes (see data/maps/attributes.asm)
; - blocks (see data/maps/blocks.asm)
; - scripts and events (see data/maps/scripts.asm)
	const_def

	newgroup                                                      ;  1

	map_const POKECENTER_2F,                                8,  4 ;  1
	map_const TRADE_CENTER,                                 5,  4 ;  2
	map_const COLOSSEUM,                                    5,  4 ;  3
	map_const TIME_CAPSULE,                                 5,  4 ;  4

	newgroup                                                      ;  2

	map_const SILENT_HILLS,                                10,  9 ;  1
	map_const PLAYERS_HOUSE_1F,                             5,  4 ;  2
	map_const PLAYERS_HOUSE_2F,                             5,  4 ;  3
	map_const JOHTO_ROUTE_1,                               30,  9 ;  4

	newgroup                                                      ; 3

	map_const SAKURA_TOWN,                                 20, 18 ; 1

	newgroup                                                      ;  4

	map_const INDIGO_PLATEAU_POKECENTER_1F,                 9,  7 ;  1
	map_const WILLS_ROOM,                                   5,  9 ;  2
	map_const KOGAS_ROOM,                                   5,  9 ;  3
	map_const BRUNOS_ROOM,                                  5,  9 ;  4
	map_const KARENS_ROOM,                                  5,  9 ;  5
	map_const LANCES_ROOM,                                  5, 12 ;  6
	map_const HALL_OF_FAME,                                 5,  7 ;  7

NUM_MAP_GROUPS EQU const_value

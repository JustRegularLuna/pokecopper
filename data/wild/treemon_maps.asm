treemon_map: MACRO
	map_id \1
	db \2 ; treemon set
ENDM

TreeMonMaps:
	treemon_map SILENT_HILLS,         TREEMON_SET_CITY
	db -1

RockMonMaps:
	db -1

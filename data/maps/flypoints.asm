flypoint: MACRO
if !DEF(FLY_\1)
	const FLY_\1
endc
	db \2, SPAWN_\1
ENDM

Flypoints:
; landmark, spawn point
	const_def
; Johto
	flypoint NEW_BARK, NEW_BARK_TOWN
	flypoint N_A,      CHERRYGROVE_CITY
	flypoint N_A,      VIOLET_CITY
	flypoint N_A,      AZALEA_TOWN
	flypoint N_A,      GOLDENROD_CITY
	flypoint N_A,      ECRUTEAK_CITY
	flypoint N_A,      OLIVINE_CITY
	flypoint N_A,      CIANWOOD_CITY
	flypoint N_A,      MAHOGANY_TOWN
	flypoint N_A,      LAKE_OF_RAGE
	flypoint N_A,      BLACKTHORN_CITY
	flypoint N_A,      SILVER_CAVE

; Kanto
KANTO_FLYPOINT EQU const_value
	flypoint N_A,      PALLET_TOWN
	flypoint N_A,      VIRIDIAN_CITY
	flypoint N_A,      PEWTER_CITY
	flypoint N_A,      CERULEAN_CITY
	flypoint N_A,      VERMILION_CITY
	flypoint N_A,      ROCK_TUNNEL
	flypoint N_A,      LAVENDER_TOWN
	flypoint N_A,      CELADON_CITY
	flypoint N_A,      SAFFRON_CITY
	flypoint N_A,      FUCHSIA_CITY
	flypoint N_A,      CINNABAR_ISLAND
	flypoint INDIGO,   INDIGO_PLATEAU
	db -1

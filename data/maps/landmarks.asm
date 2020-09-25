landmark: MACRO
; x, y, name
	db \1 + 8, \2 + 16
	dw \3
ENDM

Landmarks:
; entries correspond to constants/landmark_constants.asm
; JOHTO LANDMARKS
	dbbw       0,   0, SpecialMapName
	landmark 132, 100, SilentHillsName
	landmark 116, 100, Route1Name
	landmark 100, 100, SakuraTownName
	landmark 100,  76, Route2Name
	landmark  92,  60, Route3Name
	landmark  76,  60, BellflowerCityName
	landmark  76,  62, SproutTowerName
	landmark  76,  54, HauntedHouseName
	landmark  68,  68, RuinsOfAlphName
	landmark  76,  84, Route4Name
	landmark  76, 100, UnionCaveName
	landmark  76, 112, Route5Name
	landmark  76, 124, CypressTownName
	landmark  64, 124, Route6Name
	landmark  52, 124, WhisperingWoodsName
	landmark  44, 124, BegoniaTownName
	landmark  44, 108, Route7Name
	landmark  44,  92, MarigoldCityName
	landmark  42,  92, RadioTowerName
	landmark  44,  76, Route8Name
	landmark  44,  60, PowerPlantName
	landmark  60,  60, Route9Name
	landmark  60,  52, Route10Name
	landmark  60,  44, MapleCityName
	landmark  56,  50, BrassTowerName
	landmark  62,  40, TinTowerName
	landmark  44,  44, Route11Name
	landmark  28,  48, Route12Name
	landmark  28,  60, AzureMistCityName
	landmark  24,  64, LighthouseName
	landmark  28,  68, SSAnneName
	landmark  28,  80, Route13Name
	landmark  28,  92, TidalCaveName
	landmark  36,  92, Route14Name
	landmark  28, 100, Route15Name
	landmark  12, 100, NatureParkName
	landmark  76,  44, Route16Name
	landmark  84,  44, IcePathName
	landmark 100,  44, CedarTownName
	landmark 100,  36, Route17Name
	landmark 100,  28, WisteriaTownName
	landmark 112,  44, Route18Name
	landmark 124,  44, EbongroveCityName
	landmark 128,  40, DragonTempleName
	landmark 124,  68, Route19Name
	landmark 108,  60, DarkCaveName
	landmark 116,  88, Route20Name
	landmark 144, 100, Route21Name
	landmark 148,  76, Route22Name
	landmark 148,  60, MtFujiName
	landmark 148,  52, SilverCityName

; KANTO LANDMARKS
	landmark  52, 100, PalletTownName
	landmark  52,  88, Route1Name
	landmark  52,  76, ViridianCityName
	landmark  52,  68, Route2Name
	landmark  52,  60, ViridianForestName
	landmark  52,  44, PewterCityName
	landmark  64,  44, Route3Name
	landmark  76,  44, MtMoonName
	landmark  92,  44, Route4Name
	landmark 108,  44, CeruleanCityName
	landmark 108,  36, Route24Name
	landmark 116,  28, Route25Name
	landmark 108,  52, Route5Name
	landmark 116,  56, UndergroundPathName
	landmark 108,  68, Route6Name
	landmark 108,  76, VermilionCityName
	landmark 116,  68, DiglettsCaveName
	landmark 124,  44, Route9Name
	landmark 140,  44, RockTunnelName
	landmark 140,  52, Route10Name
	landmark 148,  52, PowerPlantName
	landmark 140,  60, LavenderTownName
	landmark 144,  56, PokemonTowerName
	landmark 124,  60, Route8Name
	landmark  96,  60, Route7Name
	landmark  84,  60, CeladonCityName
	landmark 108,  60, SaffronCityName
	landmark 108,  58, SilphCoName
	landmark 112,  60, RadioTowerName
	landmark 124,  76, Route11Name
	landmark 140,  76, Route12Name
	landmark 132,  92, Route13Name
	landmark 124, 100, Route14Name
	landmark 108, 108, Route15Name
	landmark  76,  60, Route16Name
	landmark  76,  84, Route17Name
	landmark  84, 108, Route18Name
	landmark  92, 108, FuchsiaCityName
	landmark  92, 100, SafariZoneName
	landmark  92, 120, Route19Name
	landmark  76, 132, Route20Name
	landmark  68, 132, SeafoamIslandsName
	landmark  52, 132, CinnabarIslandName
	landmark  48, 132, PokemonMansionName
	landmark  52, 116, Route21Name
	landmark  36,  76, Route22Name
	landmark  28,  60, Route23Name
	landmark  28,  52, VictoryRoadName
	landmark  28,  36, IndigoPlateauName
	landmark 100,  36, CeruleanCaveName


SilentHillsName:     db "SILENT¯HILLS@"
SakuraTownName:      db "SAKURA TOWN@"
BellflowerCityName:  db "BELLFLOWER¯CITY@"
CypressTownName:     db "CYPRESS¯TOWN@"
BegoniaTownName:     db "BEGONIA¯TOWN@"
MarigoldCityName:    db "MARIGOLD¯CITY@"
MapleCityName:       db "MAPLE CITY@"
AzureMistCityName:   db "AZURE MIST¯CITY@"
CedarTownName:       db "CEDAR TOWN@"
WisteriaTownName:    db "WISTERIA¯TOWN@"
EbongroveCityName:   db "EBONGROVE¯CITY@"
SilverCityName:      db "SILVER CITY@"

PalletTownName:      db "PALLET TOWN@"
ViridianCityName:    db "VIRIDIAN¯CITY@"
PewterCityName:      db "PEWTER CITY@"
CeruleanCityName:    db "CERULEAN¯CITY@"
VermilionCityName:   db "VERMILION¯CITY@"
LavenderTownName:    db "LAVENDER¯TOWN@"
CeladonCityName:     db "CELADON¯CITY@"
SaffronCityName:     db "SAFFRON¯CITY@"
FuchsiaCityName:     db "FUCHSIA¯CITY@"
CinnabarIslandName:  db "CINNABAR¯ISLAND@"
IndigoPlateauName:   db "INDIGO¯PLATEAU@"

Route1Name:          db "ROUTE 1@"
Route2Name:          db "ROUTE 2@"
Route3Name:          db "ROUTE 3@"
Route4Name:          db "ROUTE 4@"
Route5Name:          db "ROUTE 5@"
Route6Name:          db "ROUTE 6@"
Route7Name:          db "ROUTE 7@"
Route8Name:          db "ROUTE 8@"
Route9Name:          db "ROUTE 9@"
Route10Name:         db "ROUTE 10@"
Route11Name:         db "ROUTE 11@"
Route12Name:         db "ROUTE 12@"
Route13Name:         db "ROUTE 13@"
Route14Name:         db "ROUTE 14@"
Route15Name:         db "ROUTE 15@"
Route16Name:         db "ROUTE 16@"
Route17Name:         db "ROUTE 17@"
Route18Name:         db "ROUTE 18@"
Route19Name:         db "ROUTE 19@"
Route20Name:         db "ROUTE 20@"
Route21Name:         db "ROUTE 21@"
Route22Name:         db "ROUTE 22@"
Route23Name:         db "ROUTE 23@"
Route24Name:         db "ROUTE 24@"
Route25Name:         db "ROUTE 25@"

RuinsOfAlphName:     db "RUINS OF¯ALPH@"
SproutTowerName:     db "SPROUT¯TOWER@"
HauntedHouseName:    db "HAUNTED¯HOUSE@"
UnionCaveName:       db "UNION CAVE@"
WhisperingWoodsName: db "WHISPERING¯WOODS@"
RadioTowerName:      db "RADIO TOWER@"
PowerPlantName:      db "POWER PLANT@"
BrassTowerName:      db "BRASS TOWER@"
TinTowerName:        db "TIN TOWER@"
LighthouseName:      db "LIGHTHOUSE@"
SSAnneName:          db "S.S. ANNE@"
TidalCaveName:       db "TIDAL CAVE@"
NatureParkName:      db "NATURE PARK@"
IcePathName:         db "ICE PATH@"
DragonTempleName:    db "DRAGON¯TEMPLE@"
DarkCaveName:        db "DARK CAVE@"
MtFujiName:          db "MT. FUJI@"

ViridianForestName:  db "VIRIDIAN¯FOREST@"
MtMoonName:          db "MT. MOON@"
UndergroundPathName: db "UNDERGROUND¯PATH@"
DiglettsCaveName:    db "DIGLETT'S¯CAVE@"
RockTunnelName:      db "ROCK TUNNEL@"
PokemonTowerName:    db "#MON¯TOWER@"
SilphCoName:         db "SILPH CO.@"
SafariZoneName:      db "SAFARI ZONE@"
SeafoamIslandsName:  db "SEAFOAM¯ISLANDS@"
PokemonMansionName:  db "#MON¯MANSION@"
VictoryRoadName:     db "VICTORY¯ROAD@"
CeruleanCaveName:    db "CERULEAN¯CAVE@"

SpecialMapName:      db "SPECIAL@"

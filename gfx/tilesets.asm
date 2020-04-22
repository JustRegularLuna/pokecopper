INCLUDE "constants.asm"

tilecoll: MACRO
; used in data/tilesets/*_collision.asm
	db COLL_\1, COLL_\2, COLL_\3, COLL_\4
ENDM


SECTION "TilesetJohtoGFX", ROMX
Tileset0GFX::
TilesetJohtoGFX::
INCBIN "gfx/tilesets/johto.2bpp.lz"

SECTION "TilesetJohtoMeta", ROMX
Tileset0Meta::
TilesetJohtoMeta::
INCBIN "data/tilesets/johto_metatiles.bin"

SECTION "TilesetJohtoColl", ROMX
Tileset0Coll::
TilesetJohtoColl::
INCLUDE "data/tilesets/johto_collision.asm"


SECTION "TilesetPlayersHouseGFX", ROMX
TilesetPlayersHouseGFX::
INCBIN "gfx/tilesets/players_house.2bpp.lz"

SECTION "TilesetPlayersHouseMeta", ROMX
TilesetPlayersHouseMeta::
INCBIN "data/tilesets/players_house_metatiles.bin"

SECTION "TilesetPlayersHouseColl", ROMX
TilesetPlayersHouseColl::
INCLUDE "data/tilesets/players_house_collision.asm"


SECTION "TilesetPlayersRoomGFX", ROMX
TilesetPlayersRoomGFX::
INCBIN "gfx/tilesets/players_room.2bpp.lz"

SECTION "TilesetPlayersRoomMeta", ROMX
TilesetPlayersRoomMeta::
INCBIN "data/tilesets/players_room_metatiles.bin"

SECTION "TilesetPlayersRoomColl", ROMX
TilesetPlayersRoomColl::
INCLUDE "data/tilesets/players_room_collision.asm"


SECTION "TilesetHouseGFX", ROMX
TilesetHouseGFX::
INCBIN "gfx/tilesets/house.2bpp.lz"

SECTION "TilesetHouseMeta", ROMX
TilesetHouseMeta::
INCBIN "data/tilesets/house_metatiles.bin"

SECTION "TilesetHouseColl", ROMX
TilesetHouseColl::
INCLUDE "data/tilesets/house_collision.asm"


TilesetPokecenterGFX::
INCBIN "gfx/tilesets/pokecenter.2bpp.lz"

SECTION "TilesetPokecenterMeta", ROMX
TilesetPokecenterMeta::
INCBIN "data/tilesets/pokecenter_metatiles.bin"

SECTION "TilesetPokecenterColl", ROMX
TilesetPokecenterColl::
INCLUDE "data/tilesets/pokecenter_collision.asm"


SECTION "TilesetMartGFX", ROMX
TilesetMartGFX::
INCBIN "gfx/tilesets/mart.2bpp.lz"

SECTION "TilesetMartMeta", ROMX
TilesetMartMeta::
INCBIN "data/tilesets/mart_metatiles.bin"

SECTION "TilesetMartColl", ROMX
TilesetMartColl::
INCLUDE "data/tilesets/mart_collision.asm"


SECTION "TilesetGateGFX", ROMX
TilesetGateGFX::
INCBIN "gfx/tilesets/gate.2bpp.lz"

SECTION "TilesetGateMeta", ROMX
TilesetGateMeta::
INCBIN "data/tilesets/gate_metatiles.bin"

SECTION "TilesetGateColl", ROMX
TilesetGateColl::
INCLUDE "data/tilesets/gate_collision.asm"


SECTION "TilesetEliteFourRoomGFX", ROMX
TilesetEliteFourRoomGFX::
INCBIN "gfx/tilesets/elite_four_room.2bpp.lz"

SECTION "TilesetEliteFourRoomMeta", ROMX
TilesetEliteFourRoomMeta::
INCBIN "data/tilesets/elite_four_room_metatiles.bin"

SECTION "TilesetEliteFourRoomColl", ROMX
TilesetEliteFourRoomColl::
INCLUDE "data/tilesets/elite_four_room_collision.asm"


SECTION "TilesetChampionsRoomGFX", ROMX
TilesetChampionsRoomGFX::
INCBIN "gfx/tilesets/champions_room.2bpp.lz"

SECTION "TilesetChampionsRoomMeta", ROMX
TilesetChampionsRoomMeta::
INCBIN "data/tilesets/champions_room_metatiles.bin"

SECTION "TilesetChampionsRoomColl", ROMX
TilesetChampionsRoomColl::
INCLUDE "data/tilesets/champions_room_collision.asm"


SECTION "TilesetIcePathGFX", ROMX
TilesetIcePathGFX::
INCBIN "gfx/tilesets/ice_path.2bpp.lz"

SECTION "TilesetIcePathMeta", ROMX
TilesetIcePathMeta::
INCBIN "data/tilesets/ice_path_metatiles.bin"

SECTION "TilesetIcePathColl", ROMX
TilesetIcePathColl::
INCLUDE "data/tilesets/ice_path_collision.asm"

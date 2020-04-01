tilepal: MACRO
; used in gfx/tilesets/*_palette_map.asm
; vram bank, pals
x = \1 << OAM_TILE_BANK
rept (_NARG + -1) / 2
	dn (x | PAL_BG_\3), (x | PAL_BG_\2)
	shift
	shift
endr
ENDM

Tileset0PalMap:
TilesetJohtoPalMap:
INCLUDE "gfx/tilesets/johto_palette_map.asm"

TilesetHousePalMap:
INCLUDE "gfx/tilesets/house_palette_map.asm"

TilesetPlayersHousePalMap:
INCLUDE "gfx/tilesets/players_house_palette_map.asm"

TilesetPokecenterPalMap:
INCLUDE "gfx/tilesets/pokecenter_palette_map.asm"

TilesetGatePalMap:
INCLUDE "gfx/tilesets/gate_palette_map.asm"

TilesetMartPalMap:
INCLUDE "gfx/tilesets/mart_palette_map.asm"

TilesetEliteFourRoomPalMap:
INCLUDE "gfx/tilesets/elite_four_room_palette_map.asm"

TilesetChampionsRoomPalMap:
INCLUDE "gfx/tilesets/champions_room_palette_map.asm"

TilesetPlayersRoomPalMap:
INCLUDE "gfx/tilesets/players_room_palette_map.asm"

TilesetIcePathPalMap:
INCLUDE "gfx/tilesets/ice_path_palette_map.asm"

TilesetBattleTowerInsidePalMap:
INCLUDE "gfx/tilesets/battle_tower_inside_palette_map.asm"

TilesetBattleTowerOutsidePalMap:
INCLUDE "gfx/tilesets/battle_tower_outside_palette_map.asm"

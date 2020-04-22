tileset: MACRO
	dba \1GFX, \1Meta, \1Coll
	dw \1Anim
ENDM

; Associated data:
; - The *GFX, *Meta, and *Coll are defined in gfx/tilesets.asm
; - The *Anim are defined in engine/tilesets/tileset_anims.asm

Tilesets::
; entries correspond to TILESET_* constants
	tileset Tileset0
	tileset TilesetJohto
	tileset TilesetPlayersHouse
	tileset TilesetPlayersRoom
	tileset TilesetHouse
	tileset TilesetPokecenter
	tileset TilesetMart
	tileset TilesetGate
	tileset TilesetEliteFourRoom
	tileset TilesetChampionsRoom
	tileset TilesetIcePath

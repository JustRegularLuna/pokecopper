CutTreeBlockPointers:
; tileset, block list pointer
	dbw TILESET_JOHTO,        .johto
	db -1 ; end

.johto:
; facing block, replacement block, animation
	db $03, $02, 1 ; grass
	db $5b, $3c, 0 ; tree
	db $5f, $3d, 0 ; tree
	db $63, $3f, 0 ; tree
	db $67, $3e, 0 ; tree
	db -1 ; end

WhirlpoolBlockPointers:
	dbw TILESET_JOHTO, .johto
	db -1 ; end

.johto:
; facing block, replacement block, animation
	db $07, $36, 0
	db -1 ; end

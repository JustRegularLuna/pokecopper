CutTreeBlockPointers:
; tileset, block list pointer
	dbw TILESET_SILENT,        .johto
	db -1 ; end

.johto:
; facing block, replacement block, animation
	db $03, $02, 1 ; grass
	db $66, $64, 0 ; tree
	db $67, $65, 0 ; tree
	db $6A, $68, 0 ; tree
	db $6B, $69, 0 ; tree
	db -1 ; end

WhirlpoolBlockPointers:
	dbw TILESET_SILENT, .johto
	db -1 ; end

.johto:
; facing block, replacement block, animation
	db $74, $3A, 0
	db -1 ; end

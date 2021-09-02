	db MAGNETON ; 082

	db  50,  60,  95,  70, 120,  70
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, STEEL ; type
	db 60 ; catch rate
	db 161 ; base exp
	db NO_ITEM, METAL_COAT ; items
	db GENDER_UNKNOWN ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
IF DEF(_GOLD)
	INCBIN "gfx/pokemon/monfront/magneton.dimensions"
ELIF DEF(_SILVER)
	INCBIN "gfx/pokemon/monfront/magneton.dimensions"
ENDC
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm 
	; end

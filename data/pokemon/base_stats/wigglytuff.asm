	db WIGGLYTUFF ; 040

	db 140,  70,  45,  45,  75,  50
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 50 ; catch rate
	db 109 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F75 ; gender ratio
	db 100 ; unknown 1
	db 10 ; step cycles to hatch
	db 5 ; unknown 2
IF DEF(_GOLD)
	INCBIN "gfx/pokemon/monfront/wigglytuff.dimensions"
ELIF DEF(_SILVER)
	INCBIN "gfx/pokemon/monfront/wigglytuff.dimensions"
ENDC
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_FAST ; growth rate
	dn EGG_FAIRY, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm 
	; end

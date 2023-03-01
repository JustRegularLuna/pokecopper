; item ids
; indexes for:
; - ItemNames (see data/items/names.asm)
; - ItemDescriptions (see data/items/descriptions.asm)
; - ItemAttributes (see data/items/attributes.asm)
; - ItemEffects (see engine/items/item_effects.asm)
	const_def
	const NO_ITEM      ; 00
	const MASTER_BALL  ; 01
	const ULTRA_BALL   ; 02
	const BRIGHTPOWDER ; 03
	const GREAT_BALL   ; 04
	const POKE_BALL    ; 05
	const TOWN_MAP     ; 06
	const BICYCLE      ; 07
	const MOON_STONE   ; 08
	const ANTIDOTE     ; 09
	const BURN_HEAL    ; 0a
	const ICE_HEAL     ; 0b
	const AWAKENING    ; 0c
	const PARLYZ_HEAL  ; 0d
	const FULL_RESTORE ; 0e
	const MAX_POTION   ; 0f
	const HYPER_POTION ; 10
	const SUPER_POTION ; 11
	const POTION       ; 12
	const ESCAPE_ROPE  ; 13
	const REPEL        ; 14
	const MAX_ELIXER   ; 15
	const FIRE_STONE   ; 16
	const THUNDERSTONE ; 17
	const WATER_STONE  ; 18
	const SAFARI_BALL  ; 19
	const HP_UP        ; 1a
	const PROTEIN      ; 1b
	const IRON         ; 1c
	const CARBOS       ; 1d
	const LUCKY_PUNCH  ; 1e
	const CALCIUM      ; 1f
	const RARE_CANDY   ; 20
	const X_ACCURACY   ; 21
	const LEAF_STONE   ; 22
	const METAL_POWDER ; 23
	const NUGGET       ; 24
	const POKE_DOLL    ; 25
	const FULL_HEAL    ; 26
	const REVIVE       ; 27
	const MAX_REVIVE   ; 28
	const GUARD_SPEC   ; 29
	const SUPER_REPEL  ; 2a
	const MAX_REPEL    ; 2b
	const DIRE_HIT     ; 2c
	const ITEM_2D      ; 2d
	const FRESH_WATER  ; 2e
	const SODA_POP     ; 2f
	const LEMONADE     ; 30
	const X_ATTACK     ; 31
	const ITEM_32      ; 32
	const X_DEFEND     ; 33
	const X_SPEED      ; 34
	const X_SPECIAL    ; 35
	const COIN_CASE    ; 36
	const ITEMFINDER   ; 37
	const POKE_FLUTE   ; 38
	const EXP_SHARE    ; 39
	const OLD_ROD      ; 3a
	const GOOD_ROD     ; 3b
	const SILVER_LEAF  ; 3c
	const SUPER_ROD    ; 3d
	const PP_UP        ; 3e
	const ETHER        ; 3f
	const MAX_ETHER    ; 40
	const ELIXER       ; 41
	const RED_SCALE    ; 42
	const SECRETPOTION ; 43
	const S_S_TICKET   ; 44
	const MYSTERY_EGG  ; 45
	const ITEM_46      ; 46
	const SILVER_WING  ; 47
	const MOOMOO_MILK  ; 48
	const QUICK_CLAW   ; 49
	const PSNCUREBERRY ; 4a
	const GOLD_LEAF    ; 4b
	const SOFT_SAND    ; 4c
	const SHARP_BEAK   ; 4d
	const PRZCUREBERRY ; 4e
	const BURNT_BERRY  ; 4f
	const ICE_BERRY    ; 50
	const POISON_BARB  ; 51
	const KINGS_ROCK   ; 52
	const BITTER_BERRY ; 53
	const MINT_BERRY   ; 54
	const RED_APRICORN ; 55
	const TINYMUSHROOM ; 56
	const BIG_MUSHROOM ; 57
	const SILVERPOWDER ; 58
	const BLU_APRICORN ; 59
	const ITEM_5A      ; 5a
	const AMULET_COIN  ; 5b
	const YLW_APRICORN ; 5c
	const GRN_APRICORN ; 5d
	const CLEANSE_TAG  ; 5e
	const MYSTIC_WATER ; 5f
	const TWISTEDSPOON ; 60
	const WHT_APRICORN ; 61
	const BLACKBELT_I  ; 62
	const BLK_APRICORN ; 63
	const ITEM_64      ; 64
	const PNK_APRICORN ; 65
	const BLACKGLASSES ; 66
	const SLOWPOKETAIL ; 67
	const PINK_BOW     ; 68
	const STICK        ; 69
	const SMOKE_BALL   ; 6a
	const NEVERMELTICE ; 6b
	const MAGNET       ; 6c
	const MIRACLEBERRY ; 6d
	const PEARL        ; 6e
	const BIG_PEARL    ; 6f
	const EVERSTONE    ; 70
	const SPELL_TAG    ; 71
	const RAGECANDYBAR ; 72
	const ITEM_73      ; 73
	const ITEM_74      ; 74
	const MIRACLE_SEED ; 75
	const THICK_CLUB   ; 76
	const FOCUS_BAND   ; 77
	const ITEM_78      ; 78
	const ENERGYPOWDER ; 79
	const ENERGY_ROOT  ; 7a
	const HEAL_POWDER  ; 7b
	const REVIVAL_HERB ; 7c
	const HARD_STONE   ; 7d
	const LUCKY_EGG    ; 7e
	const CARD_KEY     ; 7f
	const MACHINE_PART ; 80
	const ITEM_81      ; 81
	const LOST_ITEM    ; 82
	const STARDUST     ; 83
	const STAR_PIECE   ; 84
	const BASEMENT_KEY ; 85
	const PASS         ; 86
	const ITEM_87      ; 87
	const ITEM_88      ; 88
	const ITEM_89      ; 89
	const CHARCOAL     ; 8a
	const BERRY_JUICE  ; 8b
	const SCOPE_LENS   ; 8c
	const ITEM_8D      ; 8d
	const ITEM_8E      ; 8e
	const METAL_COAT   ; 8f
	const DRAGON_FANG  ; 90
	const ITEM_91      ; 91
	const LEFTOVERS    ; 92
	const ITEM_93      ; 93
	const ITEM_94      ; 94
	const ITEM_95      ; 95
	const MYSTERYBERRY ; 96
	const DRAGON_SCALE ; 97
	const BERSERK_GENE ; 98
	const ITEM_99      ; 99
	const ITEM_9A      ; 9a
	const ITEM_9B      ; 9b
	const SACRED_ASH   ; 9c
	const HEAVY_BALL   ; 9d
	const FLOWER_MAIL  ; 9e
	const LEVEL_BALL   ; 9f
	const LURE_BALL    ; a0
	const FAST_BALL    ; a1
	const ITEM_A2      ; a2
	const LIGHT_BALL   ; a3
	const FRIEND_BALL  ; a4
	const MOON_BALL    ; a5
	const LOVE_BALL    ; a6
	const NORMAL_BOX   ; a7
	const GORGEOUS_BOX ; a8
	const SUN_STONE    ; a9
	const POLKADOT_BOW ; aa
	const ITEM_AB      ; ab
	const UP_GRADE     ; ac
	const BERRY        ; ad
	const GOLD_BERRY   ; ae
	const SQUIRTBOTTLE ; af
	const ITEM_B0      ; b0
	const PARK_BALL    ; b1
	const RAINBOW_WING ; b2
	const ITEM_B3      ; b3
	const BRICK_PIECE  ; b4
	const SURF_MAIL    ; b5
	const LITEBLUEMAIL ; b6
	const PORTRAITMAIL ; b7
	const LOVELY_MAIL  ; b8
	const EON_MAIL     ; b9
	const MORPH_MAIL   ; ba
	const BLUESKY_MAIL ; bb
	const MUSIC_MAIL   ; bc
	const MIRAGE_MAIL  ; bd
	const ITEM_BE      ; be
	const ITEM_BF      ; bf
	const ITEM_C0      ; c0
	const ITEM_C1      ; c1
	const ITEM_C2      ; c2
	const ITEM_C3      ; c3
MACRO add_tm
if !DEF(TM01)
TM01 EQU const_value
	enum_start 1
endc
	const TM_\1
	enum \1_TMNUM
ENDM

; see data/moves/tmhm_moves.asm for moves
	add_tm MEGA_PUNCH   ; c4
	add_tm RAZOR_WIND   ; c5
	add_tm SWORDS_DANCE ; c6
	add_tm WHIRLWIND    ; c7
	const ITEM_C8       ; c8
	add_tm MEGA_KICK    ; c9
	add_tm TOXIC        ; ca
	add_tm HORN_DRILL   ; cb
	add_tm BODY_SLAM    ; cc
	add_tm TAKE_DOWN    ; cd
	add_tm DOUBLE_EDGE  ; ce
	add_tm BUBBLEBEAM   ; cf
	add_tm WATER_GUN    ; d0
	add_tm ICE_BEAM     ; d1
	add_tm BLIZZARD     ; d2
	add_tm HYPER_BEAM   ; d3
	add_tm PAY_DAY      ; d4
	add_tm SUBMISSION   ; d5
	add_tm COUNTER      ; d6
	add_tm SEISMIC_TOSS ; d7
	add_tm RAGE         ; d8
	add_tm MEGA_DRAIN   ; d9
	add_tm SOLARBEAM    ; da
	add_tm DRAGON_RAGE  ; db
	add_tm THUNDERBOLT  ; dc
	add_tm THUNDER      ; dd
	add_tm EARTHQUAKE   ; de
	add_tm FISSURE      ; df
	add_tm DIG          ; e0
	const ITEM_E1       ; e1
	add_tm PSYCHIC_M    ; e2
	add_tm TELEPORT     ; e3
	add_tm MIMIC        ; e4
	add_tm DOUBLE_TEAM  ; e5
	add_tm REFLECT      ; e6
	add_tm BIDE         ; e7
	add_tm METRONOME    ; e8
	add_tm SELFDESTRUCT ; e9
	add_tm EGG_BOMB     ; ea
	add_tm FIRE_BLAST   ; eb
	add_tm SWIFT        ; ec
	add_tm SKULL_BASH   ; ed
	add_tm SOFTBOILED   ; ee
	add_tm DREAM_EATER  ; ef
	add_tm SKY_ATTACK   ; f0
	add_tm REST         ; f1
	add_tm THUNDER_WAVE ; f2
	add_tm PSYWAVE      ; f3
	add_tm EXPLOSION    ; f4
	add_tm ROCK_SLIDE   ; f5
	add_tm TRI_ATTACK   ; f6
	add_tm SUBSTITUTE   ; f7
NUM_TMS EQU const_value - TM01 - 2 ; discount ITEM_C8 and ITEM_E1

MACRO add_hm
if !DEF(HM01)
HM01 EQU const_value
endc
	const HM_\1
	enum \1_TMNUM
ENDM

	add_hm CUT          ; f8
	add_hm FLY          ; f9
	add_hm SURF         ; fa
	add_hm STRENGTH     ; fb
	add_hm FLASH        ; fc
	add_hm WHIRLPOOL    ; fd
	add_hm WATERFALL    ; fe
NUM_HMS EQU const_value - HM01

NUM_TM_HM EQU __enum__ - 1

	const ITEM_FF       ; ff

USE_SCRIPT_VAR EQU $00
ITEM_FROM_MEM  EQU $ff

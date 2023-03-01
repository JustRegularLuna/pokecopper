; ScriptCommandTable indexes (see engine/overworld/scripting.asm)
	enum_start

	enum scall_command ; $00
MACRO scall
	db scall_command
	dw \1 ; pointer
ENDM

	enum farscall_command ; $01
MACRO farscall
	db farscall_command
	dba \1
ENDM

	enum memcall_command ; $02
MACRO memcall
	db memcall_command
	dw \1 ; pointer
ENDM

	enum sjump_command ; $03
MACRO sjump
	db sjump_command
	dw \1 ; pointer
ENDM

	enum farsjump_command ; $04
MACRO farsjump
	db farsjump_command
	dba \1
ENDM

	enum memjump_command ; $05
MACRO memjump
	db memjump_command
	dw \1 ; pointer
ENDM

	enum ifequal_command ; $06
MACRO ifequal
	db ifequal_command
	db \1 ; byte
	dw \2 ; pointer
ENDM

	enum ifnotequal_command ; $07
MACRO ifnotequal
	db ifnotequal_command
	db \1 ; byte
	dw \2 ; pointer
ENDM

	enum iffalse_command ; $08
MACRO iffalse
	db iffalse_command
	dw \1 ; pointer
ENDM

	enum iftrue_command ; $09
MACRO iftrue
	db iftrue_command
	dw \1 ; pointer
ENDM

	enum ifgreater_command ; $0a
MACRO ifgreater
	db ifgreater_command
	db \1 ; byte
	dw \2 ; pointer
ENDM

	enum ifless_command ; $0b
MACRO ifless
	db ifless_command
	db \1 ; byte
	dw \2 ; pointer
ENDM

	enum jumpstd_command ; $0c
MACRO jumpstd
	db jumpstd_command
	dw (\1StdScript - StdScripts) / 3
ENDM

	enum callstd_command ; $0d
MACRO callstd
	db callstd_command
	dw (\1StdScript - StdScripts) / 3
ENDM

	enum callasm_command ; $0e
MACRO callasm
	db callasm_command
	dba \1
ENDM

	enum special_command ; $0f
MACRO special
	db special_command
	dw (\1Special - SpecialsPointers) / 3
ENDM

	enum memcallasm_command ; $10
MACRO memcallasm
	db memcallasm_command
	dw \1 ; asm
ENDM

	enum checkmapscene_command ; $11
MACRO checkmapscene
	db checkmapscene_command
	map_id \1 ; map
ENDM

	enum setmapscene_command ; $12
MACRO setmapscene
	db setmapscene_command
	map_id \1 ; map
	db \2 ; scene_id
ENDM

	enum checkscene_command ; $13
MACRO checkscene
	db checkscene_command
ENDM

	enum setscene_command ; $14
MACRO setscene
	db setscene_command
	db \1 ; scene_id
ENDM

	enum setval_command ; $15
MACRO setval
	db setval_command
	db \1 ; value
ENDM

	enum addval_command ; $16
MACRO addval
	db addval_command
	db \1 ; value
ENDM

	enum random_command ; $17
MACRO random
	db random_command
	db \1 ; input
ENDM

	enum checkver_command ; $18
MACRO checkver
	db checkver_command
ENDM

	enum readmem_command ; $19
MACRO readmem
	db readmem_command
	dw \1 ; address
ENDM

	enum writemem_command ; $1a
MACRO writemem
	db writemem_command
	dw \1 ; address
ENDM

	enum loadmem_command ; $1b
MACRO loadmem
	db loadmem_command
	dw \1 ; address
	db \2 ; value
ENDM

	enum readvar_command ; $1c
MACRO readvar
	db readvar_command
	db \1 ; variable_id
ENDM

	enum writevar_command ; $1d
MACRO writevar
	db writevar_command
	db \1 ; variable_id
ENDM

	enum loadvar_command ; $1e
MACRO loadvar
if STRIN("\1", "VAR_") != 1
; LEGACY: Support for the old name of "loadmem"
	loadmem \1, \2
else
	db loadvar_command
	db \1 ; variable_id
	db \2 ; value
endc
ENDM

	enum giveitem_command ; $1f
MACRO giveitem
if _NARG == 1
	giveitem \1, 1
else
	db giveitem_command
	db \1 ; item
	db \2 ; quantity
endc
ENDM

	enum takeitem_command ; $20
MACRO takeitem
if _NARG == 1
	takeitem \1, 1
else
	db takeitem_command
	db \1 ; item
	db \2 ; quantity
endc
ENDM

	enum checkitem_command ; $21
MACRO checkitem
	db checkitem_command
	db \1 ; item
ENDM

	enum givemoney_command ; $22
MACRO givemoney
	db givemoney_command
	db \1 ; account
	dt \2 ; money
ENDM

	enum takemoney_command ; $23
MACRO takemoney
	db takemoney_command
	db \1 ; account
	dt \2 ; money
ENDM

	enum checkmoney_command ; $24
MACRO checkmoney
	db checkmoney_command
	db \1 ; account
	dt \2 ; money
ENDM

	enum givecoins_command ; $25
MACRO givecoins
	db givecoins_command
	dw \1 ; coins
ENDM

	enum takecoins_command ; $26
MACRO takecoins
	db takecoins_command
	dw \1 ; coins
ENDM

	enum checkcoins_command ; $27
MACRO checkcoins
	db checkcoins_command
	dw \1 ; coins
ENDM

	enum addcellnum_command ; $28
MACRO addcellnum
	db addcellnum_command
	db \1 ; person
ENDM

	enum delcellnum_command ; $29
MACRO delcellnum
	db delcellnum_command
	db \1 ; person
ENDM

	enum checkcellnum_command ; $2a
MACRO checkcellnum
	db checkcellnum_command
	db \1 ; person
ENDM

	enum checktime_command ; $2b
MACRO checktime
	db checktime_command
	db \1 ; time
ENDM

	enum checkpoke_command ; $2c
MACRO checkpoke
	db checkpoke_command
	db \1 ; pkmn
ENDM

	enum givepoke_command ; $2d
MACRO givepoke
if _NARG == 2
	givepoke \1, \2, NO_ITEM, FALSE
elif _NARG == 3
	givepoke \1, \2, \3, FALSE
else
	db givepoke_command
	db \1 ; pokemon
	db \2 ; level
	db \3 ; item
	db \4 ; trainer
if \4
	dw \5 ; trainer_name_pointer
	dw \6 ; pkmn_nickname
endc
endc
ENDM

	enum giveegg_command ; $2e
MACRO giveegg
	db giveegg_command
	db \1 ; pkmn
	db \2 ; level
ENDM

	enum givepokemail_command ; $2f
MACRO givepokemail
	db givepokemail_command
	dw \1 ; pointer
ENDM

	enum checkpokemail_command ; $30
MACRO checkpokemail
	db checkpokemail_command
	dw \1 ; pointer
ENDM

	enum checkevent_command ; $31
MACRO checkevent
	db checkevent_command
	dw \1 ; event_flag
ENDM

	enum clearevent_command ; $32
MACRO clearevent
	db clearevent_command
	dw \1 ; event_flag
ENDM

	enum setevent_command ; $33
MACRO setevent
	db setevent_command
	dw \1 ; event_flag
ENDM

	enum checkflag_command ; $34
MACRO checkflag
	db checkflag_command
	dw \1 ; engine_flag
ENDM

	enum clearflag_command ; $35
MACRO clearflag
	db clearflag_command
	dw \1 ; engine_flag
ENDM

	enum setflag_command ; $36
MACRO setflag
	db setflag_command
	dw \1 ; engine_flag
ENDM

	enum wildon_command ; $37
MACRO wildon
	db wildon_command
ENDM

	enum wildoff_command ; $38
MACRO wildoff
	db wildoff_command
ENDM

	enum xycompare_command ; $39
MACRO xycompare
	db xycompare_command
	dw \1 ; pointer
ENDM

	enum warpmod_command ; $3a
MACRO warpmod
	db warpmod_command
	db \1 ; warp_id
	map_id \2 ; map
ENDM

	enum blackoutmod_command ; $3b
MACRO blackoutmod
	db blackoutmod_command
	map_id \1 ; map
ENDM

	enum warp_command ; $3c
MACRO warp
	db warp_command
	map_id \1 ; map
	db \2 ; x
	db \3 ; y
ENDM

	enum getmoney_command ; $3d
MACRO getmoney
	db getmoney_command
	db \2 ; account
	db \1 ; string_buffer
ENDM

	enum getcoins_command ; $3e
MACRO getcoins
	db getcoins_command
	db \1 ; string_buffer
ENDM

	enum getnum_command ; $3f
MACRO getnum
	db getnum_command
	db \1 ; string_buffer
ENDM

	enum getmonname_command ; $40
MACRO getmonname
	db getmonname_command
	db \2 ; pokemon
	db \1 ; string_buffer
ENDM

	enum getitemname_command ; $41
MACRO getitemname
	db getitemname_command
	db \2 ; item
	db \1 ; string_buffer
ENDM

	enum getcurlandmarkname_command ; $42
MACRO getcurlandmarkname
	db getcurlandmarkname_command
	db \1 ; string_buffer
ENDM

	enum gettrainername_command ; $43
MACRO gettrainername
	db gettrainername_command
	db \2 ; trainer_group
	db \3 ; trainer_id
	db \1 ; string_buffer
ENDM

	enum getstring_command ; $44
MACRO getstring
	db getstring_command
	dw \2 ; text_pointer
	db \1 ; string_buffer
ENDM

	enum itemnotify_command ; $45
MACRO itemnotify
	db itemnotify_command
ENDM

	enum pocketisfull_command ; $46
MACRO pocketisfull
	db pocketisfull_command
ENDM

	enum opentext_command ; $47
MACRO opentext
	db opentext_command
ENDM

	enum refreshscreen_command ; $48
MACRO refreshscreen
if _NARG == 0
	refreshscreen 0
else
	db refreshscreen_command
	db \1 ; dummy
endc
ENDM

	enum closetext_command ; $49
MACRO closetext
	db closetext_command
ENDM

	enum writeunusedbytebuffer_command ; $4a
MACRO writeunusedbytebuffer
	db writeunusedbytebuffer_command
	db \1 ; byte
ENDM

	enum farwritetext_command ; $4b
MACRO farwritetext
	db farwritetext_command
	dba \1
ENDM

	enum writetext_command ; $4c
MACRO writetext
	db writetext_command
	dw \1 ; text_pointer
ENDM

	enum repeattext_command ; $4d
MACRO repeattext
	db repeattext_command
	db \1 ; byte
	db \2 ; byte
ENDM

	enum yesorno_command ; $4e
MACRO yesorno
	db yesorno_command
ENDM

	enum loadmenu_command ; $4f
MACRO loadmenu
	db loadmenu_command
	dw \1 ; menu_header
ENDM

	enum closewindow_command ; $50
MACRO closewindow
	db closewindow_command
ENDM

	enum jumptextfaceplayer_command ; $51
MACRO jumptextfaceplayer
	db jumptextfaceplayer_command
	dw \1 ; text_pointer
ENDM

	enum jumptext_command ; $52
MACRO jumptext
	db jumptext_command
	dw \1 ; text_pointer
ENDM

	enum waitbutton_command ; $53
MACRO waitbutton
	db waitbutton_command
ENDM

	enum promptbutton_command ; $54
MACRO promptbutton
	db promptbutton_command
ENDM

	enum pokepic_command ; $55
MACRO pokepic
	db pokepic_command
	db \1 ; pokemon
ENDM

	enum closepokepic_command ; $56
MACRO closepokepic
	db closepokepic_command
ENDM

	enum _2dmenu_command ; $57
MACRO _2dmenu
	db _2dmenu_command
ENDM

	enum verticalmenu_command ; $58
MACRO verticalmenu
	db verticalmenu_command
ENDM

	enum loadpikachudata_command ; $59
MACRO loadpikachudata
	db loadpikachudata_command
ENDM

	enum randomwildmon_command ; $5a
MACRO randomwildmon
	db randomwildmon_command
ENDM

	enum loadtemptrainer_command ; $5b
MACRO loadtemptrainer
	db loadtemptrainer_command
ENDM

	enum loadwildmon_command ; $5c
MACRO loadwildmon
	db loadwildmon_command
	db \1 ; pokemon
	db \2 ; level
ENDM

	enum loadtrainer_command ; $5d
MACRO loadtrainer
	db loadtrainer_command
	db \1 ; trainer_group
	db \2 ; trainer_id
ENDM

	enum startbattle_command ; $5e
MACRO startbattle
	db startbattle_command
ENDM

	enum reloadmapafterbattle_command ; $5f
MACRO reloadmapafterbattle
	db reloadmapafterbattle_command
ENDM

	enum catchtutorial_command ; $60
MACRO catchtutorial
	db catchtutorial_command
	db \1 ; byte
ENDM

	enum trainertext_command ; $61
MACRO trainertext
	db trainertext_command
	db \1 ; text_id
ENDM

	enum trainerflagaction_command ; $62
MACRO trainerflagaction
	db trainerflagaction_command
	db \1 ; action
ENDM

	enum winlosstext_command ; $63
MACRO winlosstext
	db winlosstext_command
	dw \1 ; win_text_pointer
	dw \2 ; loss_text_pointer
ENDM

	enum scripttalkafter_command ; $64
MACRO scripttalkafter
	db scripttalkafter_command
ENDM

	enum endifjustbattled_command ; $65
MACRO endifjustbattled
	db endifjustbattled_command
ENDM

	enum checkjustbattled_command ; $66
MACRO checkjustbattled
	db checkjustbattled_command
ENDM

	enum setlasttalked_command ; $67
MACRO setlasttalked
	db setlasttalked_command
	db \1 ; object id
ENDM

	enum applymovement_command ; $68
MACRO applymovement
	db applymovement_command
	db \1 ; object id
	dw \2 ; data
ENDM

	enum applymovementlasttalked_command ; $69
MACRO applymovementlasttalked
	db applymovementlasttalked_command
	dw \1 ; data
ENDM

	enum faceplayer_command ; $6a
MACRO faceplayer
	db faceplayer_command
ENDM

	enum faceobject_command ; $6b
MACRO faceobject
	db faceobject_command
	db \1 ; object1
	db \2 ; object2
ENDM

	enum variablesprite_command ; $6c
MACRO variablesprite
	db variablesprite_command
	db \1 - SPRITE_VARS ; byte
	db \2 ; sprite
ENDM

	enum disappear_command ; $6d
MACRO disappear
	db disappear_command
	db \1 ; object id
ENDM

	enum appear_command ; $6e
MACRO appear
	db appear_command
	db \1 ; object id
ENDM

	enum follow_command ; $6f
MACRO follow
	db follow_command
	db \1 ; object2
	db \2 ; object1
ENDM

	enum stopfollow_command ; $70
MACRO stopfollow
	db stopfollow_command
ENDM

	enum moveobject_command ; $71
MACRO moveobject
	db moveobject_command
	db \1 ; object id
	db \2 ; x
	db \3 ; y
ENDM

	enum writeobjectxy_command ; $72
MACRO writeobjectxy
	db writeobjectxy_command
	db \1 ; object id
ENDM

	enum loademote_command ; $73
MACRO loademote
	db loademote_command
	db \1 ; bubble
ENDM

	enum showemote_command ; $74
MACRO showemote
	db showemote_command
	db \1 ; bubble
	db \2 ; object id
	db \3 ; time
ENDM

	enum turnobject_command ; $75
MACRO turnobject
	db turnobject_command
	db \1 ; object id
	db \2 ; facing
ENDM

	enum follownotexact_command ; $76
MACRO follownotexact
	db follownotexact_command
	db \1 ; object2
	db \2 ; object1
ENDM

	enum earthquake_command ; $77
MACRO earthquake
	db earthquake_command
	db \1 ; param
ENDM

	enum changemapblocks_command ; $78
MACRO changemapblocks
	db changemapblocks_command
	dba \1 ; map_data_pointer
ENDM

	enum changeblock_command ; $79
MACRO changeblock
	db changeblock_command
	db \1 ; x
	db \2 ; y
	db \3 ; block
ENDM

	enum reloadmap_command ; $7a
MACRO reloadmap
	db reloadmap_command
ENDM

	enum reloadmappart_command ; $7b
MACRO reloadmappart
	db reloadmappart_command
ENDM

	enum writecmdqueue_command ; $7c
MACRO writecmdqueue
	db writecmdqueue_command
	dw \1 ; queue_pointer
ENDM

	enum delcmdqueue_command ; $7d
MACRO delcmdqueue
	db delcmdqueue_command
	db \1 ; byte
ENDM

	enum playmusic_command ; $7e
MACRO playmusic
	db playmusic_command
	dw \1 ; music_pointer
ENDM

	enum encountermusic_command ; $7f
MACRO encountermusic
	db encountermusic_command
ENDM

	enum musicfadeout_command ; $80
MACRO musicfadeout
	db musicfadeout_command
	dw \1 ; music
	db \2 ; fadetime
ENDM

	enum playmapmusic_command ; $81
MACRO playmapmusic
	db playmapmusic_command
ENDM

	enum dontrestartmapmusic_command ; $82
MACRO dontrestartmapmusic
	db dontrestartmapmusic_command
ENDM

	enum cry_command ; $83
MACRO cry
	db cry_command
	dw \1 ; cry_id
ENDM

	enum playsound_command ; $84
MACRO playsound
	db playsound_command
	dw \1 ; sound_pointer
ENDM

	enum waitsfx_command ; $85
MACRO waitsfx
	db waitsfx_command
ENDM

	enum warpsound_command ; $86
MACRO warpsound
	db warpsound_command
ENDM

	enum specialsound_command ; $87
MACRO specialsound
	db specialsound_command
ENDM

	enum autoinput_command ; $88
MACRO autoinput
	db autoinput_command
	dba \1
ENDM

	enum newloadmap_command ; $89
MACRO newloadmap
	db newloadmap_command
	db \1 ; which_method
ENDM

	enum pause_command ; $8a
MACRO pause
	db pause_command
	db \1 ; length
ENDM

	enum deactivatefacing_command ; $8b
MACRO deactivatefacing
	db deactivatefacing_command
	db \1 ; time
ENDM

	enum prioritysjump_command ; $8c
MACRO prioritysjump
	db prioritysjump_command
	dw \1 ; pointer
ENDM

	enum warpcheck_command ; $8d
MACRO warpcheck
	db warpcheck_command
ENDM

	enum stopandsjump_command ; $8e
MACRO stopandsjump
	db stopandsjump_command
	dw \1 ; pointer
ENDM

	enum return_command ; $8f
MACRO return
	db return_command
ENDM

	enum end_command ; $90
MACRO end
	db end_command
ENDM

	enum reloadandreturn_command ; $91
MACRO reloadandreturn
	db reloadandreturn_command
	db \1 ; which_method
ENDM

	enum endall_command ; $92
MACRO endall
	db endall_command
ENDM

	enum pokemart_command ; $93
MACRO pokemart
	db pokemart_command
	db \1 ; dialog_id
	dw \2 ; mart_id
ENDM

	enum elevator_command ; $94
MACRO elevator
	db elevator_command
	dw \1 ; floor_list_pointer
ENDM

	enum trade_command ; $95
MACRO trade
	db trade_command
	db \1 ; trade_id
ENDM

	enum askforphonenumber_command ; $96
MACRO askforphonenumber
	db askforphonenumber_command
	db \1 ; number
ENDM

	enum phonecall_command ; $97
MACRO phonecall
	db phonecall_command
	dw \1 ; caller_name
ENDM

	enum hangup_command ; $98
MACRO hangup
	db hangup_command
ENDM

	enum describedecoration_command ; $99
MACRO describedecoration
	db describedecoration_command
	db \1 ; byte
ENDM

	enum fruittree_command ; $9a
MACRO fruittree
	db fruittree_command
	db \1 ; tree_id
ENDM

	enum specialphonecall_command ; $9b
MACRO specialphonecall
	db specialphonecall_command
	dw \1 ; call_id
ENDM

	enum checkphonecall_command ; $9c
MACRO checkphonecall
	db checkphonecall_command
ENDM

	enum verbosegiveitem_command ; $9d
MACRO verbosegiveitem
if _NARG == 1
	verbosegiveitem \1, 1
else
	db verbosegiveitem_command
	db \1 ; item
	db \2 ; quantity
endc
ENDM

	enum swarm_command ; $9e
MACRO swarm
	db swarm_command
	map_id \1 ; map
ENDM

	enum halloffame_command ; $9f
MACRO halloffame
	db halloffame_command
ENDM

	enum credits_command ; $a0
MACRO credits
	db credits_command
ENDM

	enum warpfacing_command ; $a1
MACRO warpfacing
	db warpfacing_command
	db \1 ; facing
	map_id \2 ; map
	db \3 ; x
	db \4 ; y
ENDM

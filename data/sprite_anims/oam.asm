SpriteAnimOAMData:
; entries correspond to SPRITE_ANIM_OAMSET_* constants
	; vtile offset, data pointer
	dbw $00, .OAMData_RedWalk                  ; SPRITE_ANIM_OAMSET_RED_WALK_1
	dbw $04, .OAMData_RedWalk                  ; SPRITE_ANIM_OAMSET_RED_WALK_2
	dbw $00, .OAMData_TextEntryCursor          ; SPRITE_ANIM_OAMSET_TEXT_ENTRY_CURSOR
	dbw $00, .OAMData_TextEntryCursorBig       ; SPRITE_ANIM_OAMSET_TEXT_ENTRY_CURSOR_BIG
	dbw $00, .OAMData_SlotsGolem               ; SPRITE_ANIM_OAMSET_SLOTS_GOLEM_1
	dbw $08, .OAMData_SlotsGolem               ; SPRITE_ANIM_OAMSET_SLOTS_GOLEM_2
	dbw $10, .OAMData_SlotsChansey1            ; SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_1
	dbw $10, .OAMData_SlotsChansey2            ; SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_2
	dbw $10, .OAMData_SlotsChansey3            ; SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_3
	dbw $10, .OAMData_SlotsChansey4            ; SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_4
	dbw $10, .OAMData_SlotsChansey5            ; SPRITE_ANIM_OAMSET_SLOTS_CHANSEY_5
	dbw $3a, .OAMData_1x1_Palette0             ; SPRITE_ANIM_OAMSET_SLOTS_EGG
	dbw $00, .OAMData_RedWalk                  ; SPRITE_ANIM_OAMSET_STILL_CURSOR
	dbw $00, .OAMData_TradePokeBall1           ; SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_1
	dbw $02, .OAMData_MagnetTrainRed           ; SPRITE_ANIM_OAMSET_TRADE_POKE_BALL_2
	dbw $06, .OAMData_TradePoofBubble          ; SPRITE_ANIM_OAMSET_TRADE_POOF_1
	dbw $0a, .OAMData_TradePoofBubble          ; SPRITE_ANIM_OAMSET_TRADE_POOF_2
	dbw $0e, .OAMData_TradePoofBubble          ; SPRITE_ANIM_OAMSET_TRADE_POOF_3
	dbw $12, .OAMData_TradeTubeBulge           ; SPRITE_ANIM_OAMSET_TRADE_TUBE_BULGE_1
	dbw $13, .OAMData_TradeTubeBulge           ; SPRITE_ANIM_OAMSET_TRADE_TUBE_BULGE_2
	dbw $00, .OAMData_RedWalk                  ; SPRITE_ANIM_OAMSET_TRADEMON_ICON_1
	dbw $04, .OAMData_RedWalk                  ; SPRITE_ANIM_OAMSET_TRADEMON_ICON_2
	dbw $10, .OAMData_TradePoofBubble          ; SPRITE_ANIM_OAMSET_TRADEMON_BUBBLE
	dbw $00, .OAMData_MagnetTrainRed           ; SPRITE_ANIM_OAMSET_EVOLUTION_BALL_OF_LIGHT_1
	dbw $04, .OAMData_1x1_Palette0             ; SPRITE_ANIM_OAMSET_EVOLUTION_BALL_OF_LIGHT_2
	dbw $00, .OAMData_RadioTuningKnob          ; SPRITE_ANIM_OAMSET_RADIO_TUNING_KNOB
	dbw $00, .OAMData_PartyMonWithMail1        ; SPRITE_ANIM_OAMSET_PARTY_MON_WITH_MAIL_1
	dbw $00, .OAMData_PartyMonWithMail2        ; SPRITE_ANIM_OAMSET_PARTY_MON_WITH_MAIL_2
	dbw $00, .OAMData_PartyMonWithItem1        ; SPRITE_ANIM_OAMSET_PARTY_MON_WITH_ITEM_1
	dbw $00, .OAMData_PartyMonWithItem2        ; SPRITE_ANIM_OAMSET_PARTY_MON_WITH_ITEM_2
	dbw $00, .OAMData_MagnetTrainRed           ; SPRITE_ANIM_OAMSET_MAGNET_TRAIN_RED_1
	dbw $04, .OAMData_MagnetTrainRed           ; SPRITE_ANIM_OAMSET_MAGNET_TRAIN_RED_2
	dbw $00, .OAMData_Leaf                     ; SPRITE_ANIM_OAMSET_LEAF
	dbw $00, .OAMData_Tree                     ; SPRITE_ANIM_OAMSET_TREE_1
	dbw $00, .OAMData_CutTree2                 ; SPRITE_ANIM_OAMSET_CUT_TREE_2
	dbw $00, .OAMData_CutTree3                 ; SPRITE_ANIM_OAMSET_CUT_TREE_3
	dbw $00, .OAMData_CutTree4                 ; SPRITE_ANIM_OAMSET_CUT_TREE_4
	dbw $00, .OAMData_1x1_Palette0             ; SPRITE_ANIM_OAMSET_EGG_CRACK
	dbw $01, .OAMData_1x1_Palette0             ; SPRITE_ANIM_OAMSET_EGG_HATCH
	dbw $04, .OAMData_Tree                     ; SPRITE_ANIM_OAMSET_HEADBUTT_TREE_2
	dbw $d0, .OAMData_GameFreakLogo1_3         ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_1
	dbw $d3, .OAMData_GameFreakLogo1_3         ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_2
	dbw $d6, .OAMData_GameFreakLogo1_3         ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_3
	dbw $6c, .OAMData_GameFreakLogo4_11        ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_4
	dbw $68, .OAMData_GameFreakLogo4_11        ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_5
	dbw $64, .OAMData_GameFreakLogo4_11        ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_6
	dbw $60, .OAMData_GameFreakLogo4_11        ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_7
	dbw $0c, .OAMData_GameFreakLogo4_11        ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_8
	dbw $08, .OAMData_GameFreakLogo4_11        ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_9
	dbw $04, .OAMData_GameFreakLogo4_11        ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_10
	dbw $00, .OAMData_GameFreakLogo4_11        ; SPRITE_ANIM_OAMSET_GAMEFREAK_LOGO_11

.OAMData_1x1_Palette0:
	db 1
	dbsprite -1, -1,  4,  4, $00, 0

.OAMData_TradePokeBall1:
	db 4
	dbsprite -1, -1,  0,  0, $00, 0 | PRIORITY
	dbsprite  0, -1,  0,  0, $00, 0 | X_FLIP | PRIORITY
	dbsprite -1,  0,  0,  0, $01, 0 | PRIORITY
	dbsprite  0,  0,  0,  0, $01, 0 | X_FLIP | PRIORITY

.OAMData_TradeTubeBulge:
	db 4
	dbsprite -1, -1,  0,  0, $00, 7
	dbsprite  0, -1,  0,  0, $00, 7 | X_FLIP
	dbsprite -1,  0,  0,  0, $00, 7 | Y_FLIP
	dbsprite  0,  0,  0,  0, $00, 7 | X_FLIP | Y_FLIP

.OAMData_TradePoofBubble:
	db 16
	dbsprite -2, -2,  0,  0, $00, 0
	dbsprite -1, -2,  0,  0, $01, 0
	dbsprite -2, -1,  0,  0, $02, 0
	dbsprite -1, -1,  0,  0, $03, 0
	dbsprite  0, -2,  0,  0, $01, 0 | X_FLIP
	dbsprite  1, -2,  0,  0, $00, 0 | X_FLIP
	dbsprite  0, -1,  0,  0, $03, 0 | X_FLIP
	dbsprite  1, -1,  0,  0, $02, 0 | X_FLIP
	dbsprite -2,  0,  0,  0, $02, 0 | Y_FLIP
	dbsprite -1,  0,  0,  0, $03, 0 | Y_FLIP
	dbsprite -2,  1,  0,  0, $00, 0 | Y_FLIP
	dbsprite -1,  1,  0,  0, $01, 0 | Y_FLIP
	dbsprite  0,  0,  0,  0, $03, 0 | X_FLIP | Y_FLIP
	dbsprite  1,  0,  0,  0, $02, 0 | X_FLIP | Y_FLIP
	dbsprite  0,  1,  0,  0, $01, 0 | X_FLIP | Y_FLIP
	dbsprite  1,  1,  0,  0, $00, 0 | X_FLIP | Y_FLIP

.OAMData_RedWalk:
	db 4
	dbsprite -1, -1,  0,  0, $00, PAL_OW_RED
	dbsprite  0, -1,  0,  0, $01, PAL_OW_RED
	dbsprite -1,  0,  0,  0, $02, PAL_OW_RED
	dbsprite  0,  0,  0,  0, $03, PAL_OW_RED

.OAMData_MagnetTrainRed:
	db 4
	dbsprite -1, -1,  0,  0, $00, PAL_OW_RED | PRIORITY
	dbsprite  0, -1,  0,  0, $01, PAL_OW_RED | PRIORITY
	dbsprite -1,  0,  0,  0, $02, PAL_OW_RED | PRIORITY
	dbsprite  0,  0,  0,  0, $03, PAL_OW_RED | PRIORITY

.OAMData_PartyMonWithMail1:
	db 4
	dbsprite -1, -1,  0,  0, $00, PAL_OW_RED
	dbsprite  0, -1,  0,  0, $01, PAL_OW_RED
	dbsprite -1,  0,  0,  0, $08, PAL_OW_RED
	dbsprite  0,  0,  0,  0, $03, PAL_OW_RED

.OAMData_PartyMonWithMail2:
	db 4
	dbsprite -1, -1,  0,  0, $04, PAL_OW_RED
	dbsprite  0, -1,  0,  0, $05, PAL_OW_RED
	dbsprite -1,  0,  0,  0, $08, PAL_OW_RED
	dbsprite  0,  0,  0,  0, $07, PAL_OW_RED

.OAMData_PartyMonWithItem1:
	db 4
	dbsprite -1, -1,  0,  0, $00, PAL_OW_RED
	dbsprite  0, -1,  0,  0, $01, PAL_OW_RED
	dbsprite -1,  0,  0,  0, $09, PAL_OW_RED
	dbsprite  0,  0,  0,  0, $03, PAL_OW_RED

.OAMData_PartyMonWithItem2:
	db 4
	dbsprite -1, -1,  0,  0, $04, PAL_OW_RED
	dbsprite  0, -1,  0,  0, $05, PAL_OW_RED
	dbsprite -1,  0,  0,  0, $09, PAL_OW_RED
	dbsprite  0,  0,  0,  0, $07, PAL_OW_RED

.OAMData_Leaf:
	db 1
	dbsprite -1, -1,  4,  4, $00, PAL_OW_TREE

.OAMData_Tree:
	db 4
	dbsprite -1, -1,  0,  0, $00, PAL_OW_TREE
	dbsprite  0, -1,  0,  0, $01, PAL_OW_TREE
	dbsprite -1,  0,  0,  0, $02, PAL_OW_TREE
	dbsprite  0,  0,  0,  0, $03, PAL_OW_TREE

.OAMData_TextEntryCursor:
	db 4
	dbsprite -1, -1,  7,  7, $00, 0
	dbsprite  0, -1,  0,  7, $00, 0 | X_FLIP
	dbsprite -1,  0,  7,  0, $00, 0 | Y_FLIP
	dbsprite  0,  0,  0,  0, $00, 0 | X_FLIP | Y_FLIP

.OAMData_TextEntryCursorBig:
	db 10
	dbsprite  0, -1,  0,  7, $00, 0
	dbsprite  1, -1,  0,  7, $01, 0
	dbsprite  2, -1,  0,  7, $01, 0
	dbsprite  3, -1,  0,  7, $01, 0
	dbsprite  4, -1,  0,  7, $00, 0 | X_FLIP
	dbsprite  0,  0,  0,  0, $00, 0 | Y_FLIP
	dbsprite  1,  0,  0,  0, $01, 0 | Y_FLIP
	dbsprite  2,  0,  0,  0, $01, 0 | Y_FLIP
	dbsprite  3,  0,  0,  0, $01, 0 | Y_FLIP
	dbsprite  4,  0,  0,  0, $00, 0 | X_FLIP | Y_FLIP

.OAMData_SlotsGolem:
	db 6
	dbsprite -2, -2,  4,  4, $00, 5 | OBP_NUM
	dbsprite -1, -2,  4,  4, $02, 5 | OBP_NUM
	dbsprite  0, -2,  4,  4, $00, 5 | OBP_NUM | X_FLIP
	dbsprite -2,  0,  4,  4, $04, 5 | OBP_NUM
	dbsprite -1,  0,  4,  4, $06, 5 | OBP_NUM
	dbsprite  0,  0,  4,  4, $04, 5 | OBP_NUM | X_FLIP

.OAMData_SlotsChansey1:
	db 6
	dbsprite -2, -2,  4,  4, $00, 6 | OBP_NUM
	dbsprite -1, -2,  4,  4, $02, 6 | OBP_NUM
	dbsprite  0, -2,  4,  4, $04, 6 | OBP_NUM
	dbsprite -2,  0,  4,  4, $06, 6 | OBP_NUM
	dbsprite -1,  0,  4,  4, $08, 6 | OBP_NUM
	dbsprite  0,  0,  4,  4, $0a, 6 | OBP_NUM

.OAMData_SlotsChansey2:
	db 6
	dbsprite -2, -2,  4,  4, $00, 6 | OBP_NUM
	dbsprite -1, -2,  4,  4, $02, 6 | OBP_NUM
	dbsprite  0, -2,  4,  4, $04, 6 | OBP_NUM
	dbsprite -2,  0,  4,  4, $0c, 6 | OBP_NUM
	dbsprite -1,  0,  4,  4, $0e, 6 | OBP_NUM
	dbsprite  0,  0,  4,  4, $10, 6 | OBP_NUM

.OAMData_SlotsChansey3:
	db 6
	dbsprite -2, -2,  4,  4, $00, 6 | OBP_NUM
	dbsprite -1, -2,  4,  4, $02, 6 | OBP_NUM
	dbsprite  0, -2,  4,  4, $04, 6 | OBP_NUM
	dbsprite -2,  0,  4,  4, $12, 6 | OBP_NUM
	dbsprite -1,  0,  4,  4, $14, 6 | OBP_NUM
	dbsprite  0,  0,  4,  4, $16, 6 | OBP_NUM

.OAMData_SlotsChansey4:
	db 6
	dbsprite -2, -2,  4,  4, $00, 6 | OBP_NUM
	dbsprite -1, -2,  4,  4, $02, 6 | OBP_NUM
	dbsprite  0, -2,  4,  4, $04, 6 | OBP_NUM
	dbsprite -2,  0,  4,  4, $18, 6 | OBP_NUM
	dbsprite -1,  0,  4,  4, $1a, 6 | OBP_NUM
	dbsprite  0,  0,  4,  4, $1c, 6 | OBP_NUM

.OAMData_SlotsChansey5:
	db 6
	dbsprite -2, -2,  4,  4, $1e, 6 | OBP_NUM
	dbsprite -1, -2,  4,  4, $20, 6 | OBP_NUM
	dbsprite  0, -2,  4,  4, $22, 6 | OBP_NUM
	dbsprite -2,  0,  4,  4, $24, 6 | OBP_NUM
	dbsprite -1,  0,  4,  4, $26, 6 | OBP_NUM
	dbsprite  0,  0,  4,  4, $28, 6 | OBP_NUM

.OAMData_RadioTuningKnob:
	db 3
	dbsprite -1, -2,  4,  4, $00, 0 | OBP_NUM
	dbsprite -1, -1,  4,  4, $00, 0 | OBP_NUM
	dbsprite -1,  0,  4,  4, $00, 0 | OBP_NUM

.OAMData_CutTree2:
	db 4
	dbsprite -2, -1,  6,  0, $00, PAL_OW_TREE
	dbsprite  0, -1,  2,  0, $01, PAL_OW_TREE
	dbsprite -2,  0,  6,  0, $02, PAL_OW_TREE
	dbsprite  0,  0,  2,  0, $03, PAL_OW_TREE

.OAMData_CutTree3:
	db 4
	dbsprite -2, -1,  4,  0, $00, PAL_OW_TREE
	dbsprite  0, -1,  4,  0, $01, PAL_OW_TREE
	dbsprite -2,  0,  4,  0, $02, PAL_OW_TREE
	dbsprite  0,  0,  4,  0, $03, PAL_OW_TREE

.OAMData_CutTree4:
	db 4
	dbsprite -2, -1,  0,  0, $00, PAL_OW_TREE
	dbsprite  1, -1,  0,  0, $01, PAL_OW_TREE
	dbsprite -2,  0,  0,  0, $02, PAL_OW_TREE
	dbsprite  1,  0,  0,  0, $03, PAL_OW_TREE

.OAMData_GameFreakLogo1_3:
	db 9
	dbsprite -2, -2,  4,  0, $00, 1
	dbsprite -1, -2,  4,  0, $01, 1
	dbsprite  0, -2,  4,  0, $02, 1
	dbsprite -2, -1,  4,  0, $10, 1
	dbsprite -1, -1,  4,  0, $11, 1
	dbsprite  0, -1,  4,  0, $12, 1
	dbsprite -2,  0,  4,  0, $20, 1
	dbsprite -1,  0,  4,  0, $21, 1
	dbsprite  0,  0,  4,  0, $22, 1

.OAMData_GameFreakLogo4_11:
	db 24
	dbsprite -2, -5,  4,  0, $00, 1
	dbsprite -1, -5,  4,  0, $01, 1
	dbsprite  0, -5,  4,  0, $02, 1
	dbsprite  1, -5,  4,  0, $03, 1
	dbsprite -2, -4,  4,  0, $10, 1
	dbsprite -1, -4,  4,  0, $11, 1
	dbsprite  0, -4,  4,  0, $12, 1
	dbsprite  1, -4,  4,  0, $13, 1
	dbsprite -2, -3,  4,  0, $20, 1
	dbsprite -1, -3,  4,  0, $21, 1
	dbsprite  0, -3,  4,  0, $22, 1
	dbsprite  1, -3,  4,  0, $23, 1
	dbsprite -2, -2,  4,  0, $30, 1
	dbsprite -1, -2,  4,  0, $31, 1
	dbsprite  0, -2,  4,  0, $32, 1
	dbsprite  1, -2,  4,  0, $33, 1
	dbsprite -2, -1,  4,  0, $40, 1
	dbsprite -1, -1,  4,  0, $41, 1
	dbsprite  0, -1,  4,  0, $42, 1
	dbsprite  1, -1,  4,  0, $43, 1
	dbsprite -2,  0,  4,  0, $50, 1
	dbsprite -1,  0,  4,  0, $51, 1
	dbsprite  0,  0,  4,  0, $52, 1
	dbsprite  1,  0,  4,  0, $53, 1

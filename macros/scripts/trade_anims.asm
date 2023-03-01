; DoTradeAnimation.JumpTable indexes (see engine/movies/trade_animation.asm)
	enum_start

	enum tradeanim_next_command ; $00
MACRO tradeanim_next
	db tradeanim_next_command
ENDM

	enum tradeanim_show_givemon_data_command ; $01
MACRO tradeanim_show_givemon_data
	db tradeanim_show_givemon_data_command
ENDM

	enum tradeanim_show_getmon_data_command ; $02
MACRO tradeanim_show_getmon_data
	db tradeanim_show_getmon_data_command
ENDM

	enum tradeanim_enter_link_tube_command ; $03
MACRO tradeanim_enter_link_tube
	db tradeanim_enter_link_tube_command
ENDM

	enum_start $05

	enum tradeanim_exit_link_tube_command ; $05
MACRO tradeanim_exit_link_tube
	db tradeanim_exit_link_tube_command
ENDM

	enum tradeanim_tube_to_ot_command ; $06
MACRO tradeanim_tube_to_ot
	db tradeanim_tube_to_ot_command
ENDM

	enum_start $0e

	enum tradeanim_tube_to_player_command ; $0e
MACRO tradeanim_tube_to_player
	db tradeanim_tube_to_player_command
ENDM

	enum_start $16

	enum tradeanim_sent_to_ot_text_command ; $16
MACRO tradeanim_sent_to_ot_text
	db tradeanim_sent_to_ot_text_command
ENDM

	enum tradeanim_ot_bids_farewell_command ; $17
MACRO tradeanim_ot_bids_farewell
	db tradeanim_ot_bids_farewell_command
ENDM

	enum tradeanim_take_care_of_text_command ; $18
MACRO tradeanim_take_care_of_text
	db tradeanim_take_care_of_text_command
ENDM

	enum tradeanim_ot_sends_text_1_command ; $19
MACRO tradeanim_ot_sends_text_1
	db tradeanim_ot_sends_text_1_command
ENDM

	enum tradeanim_ot_sends_text_2_command ; $1a
MACRO tradeanim_ot_sends_text_2
	db tradeanim_ot_sends_text_2_command
ENDM

	enum tradeanim_setup_givemon_scroll_command ; $1b
MACRO tradeanim_setup_givemon_scroll
	db tradeanim_setup_givemon_scroll_command
ENDM

	enum tradeanim_do_givemon_scroll_command ; $1c
MACRO tradeanim_do_givemon_scroll
	db tradeanim_do_givemon_scroll_command
ENDM

	enum tradeanim_frontpic_scroll_command ; $1d
MACRO tradeanim_frontpic_scroll
	db tradeanim_frontpic_scroll_command
ENDM

	enum tradeanim_textbox_scroll_command ; $1e
MACRO tradeanim_textbox_scroll
	db tradeanim_textbox_scroll_command
ENDM

	enum tradeanim_scroll_out_right_command ; $1f
MACRO tradeanim_scroll_out_right
	db tradeanim_scroll_out_right_command
ENDM

	enum_start $21

	enum tradeanim_wait_80_command ; $21
MACRO tradeanim_wait_80
	db tradeanim_wait_80_command
ENDM

	enum tradeanim_rocking_ball_command ; $22
MACRO tradeanim_rocking_ball
	db tradeanim_rocking_ball_command
ENDM

	enum tradeanim_drop_ball_command ; $23
MACRO tradeanim_drop_ball
	db tradeanim_drop_ball_command
ENDM

	enum tradeanim_wait_anim_command ; $24
MACRO tradeanim_wait_anim
	db tradeanim_wait_anim_command
ENDM

	enum tradeanim_poof_command ; $25
MACRO tradeanim_poof
	db tradeanim_poof_command
ENDM

	enum tradeanim_bulge_through_tube_command ; $26
MACRO tradeanim_bulge_through_tube
	db tradeanim_bulge_through_tube_command
ENDM

	enum tradeanim_give_trademon_sfx_command ; $27
MACRO tradeanim_give_trademon_sfx
	db tradeanim_give_trademon_sfx_command
ENDM

	enum tradeanim_get_trademon_sfx_command ; $28
MACRO tradeanim_get_trademon_sfx
	db tradeanim_get_trademon_sfx_command
ENDM

	enum tradeanim_end_command ; $29
MACRO tradeanim_end
	db tradeanim_end_command
ENDM

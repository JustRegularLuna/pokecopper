MACRO channel_count
_num_channels = \1 - 1
ENDM

MACRO channel
	dn (_num_channels << 2), \1 - 1 ; channel id
	dw \2 ; address
_num_channels = 0
ENDM

MACRO note
	dn (\1), (\2) - 1 ; pitch, length
ENDM

MACRO drum_note
	note \1, \2 ; drum instrument, length
ENDM

MACRO rest
	note 0, \1 ; length
ENDM

MACRO square_note
	db \1 ; length
	IF \3 < 0
		dn \2, %1000 | (\3 * -1) ; volume envelope
	ELSE
		dn \2, \3 ; volume envelope
	ENDC
	dw \4 ; frequency
ENDM

MACRO noise_note
	db \1 ; length
	IF \3 < 0
		dn \2, %1000 | (\3 * -1) ; volume envelope
	ELSE
		dn \2, \3 ; volume envelope
	ENDC
	db \4 ; frequency
ENDM

; MusicCommands indexes (see audio/engine.asm)
	enum_start $d0, 8
FIRST_MUSIC_CMD EQU __enum__

	enum octave_cmd ; $d0
MACRO octave
	db octave_cmd | 8 - (\1) ; octave
ENDM

__enumdir__ = 1

	enum note_type_cmd ; $d8
MACRO note_type
	db note_type_cmd
	db \1 ; note length
	IF _NARG >= 2
		IF \3 < 0
			dn \2, %1000 | (\3 * -1) ; volume envelope
		ELSE
			dn \2, \3 ; volume envelope
		ENDC
	ENDC
ENDM

; only valid on the noise channel
MACRO drum_speed
	note_type \1 ; note length
ENDM

	enum transpose_cmd ; $d9
MACRO transpose
	db transpose_cmd
	dn \1, \2 ; num octaves, num pitches
ENDM

	enum tempo_cmd ; $da
MACRO tempo
	db tempo_cmd
	bigdw \1 ; tempo
ENDM

	enum duty_cycle_cmd ; $db
MACRO duty_cycle
	db duty_cycle_cmd
	db \1 ; duty cycle
ENDM

	enum volume_envelope_cmd ; $dc
MACRO volume_envelope
	db volume_envelope_cmd
	IF \2 < 0
		dn \1, %1000 | (\2 * -1) ; volume envelope
	ELSE
		dn \1, \2 ; volume envelope
	ENDC
ENDM

	enum pitch_sweep_cmd ; $dd
MACRO pitch_sweep
	db pitch_sweep_cmd
	IF \2 < 0
		dn \1, %1000 | (\2 * -1) ; pitch sweep
	ELSE
		dn \1, \2 ; pitch sweep
	ENDC
ENDM

	enum duty_cycle_pattern_cmd ; $de
MACRO duty_cycle_pattern
	db duty_cycle_pattern_cmd
	db (\1 << 6) | (\2 << 4) | (\3 << 2) | (\4 << 0) ; duty cycle pattern
ENDM

	enum toggle_sfx_cmd ; $df
MACRO toggle_sfx
	db toggle_sfx_cmd
ENDM

	enum pitch_slide_cmd ; $e0
MACRO pitch_slide
	db pitch_slide_cmd
	db \1 - 1 ; duration
	dn 8 - \2, \3 % 12 ; octave, pitch
ENDM

	enum vibrato_cmd ; $e1
MACRO vibrato
	db vibrato_cmd
	db \1 ; delay
	IF _NARG > 2
		dn \2, \3 ; extent, rate
	ELSE
		db \2 ; LEGACY: Support for 1-arg extent
	ENDC
ENDM

	enum unknownmusic0xe2_cmd ; $e2
MACRO unknownmusic0xe2
	db unknownmusic0xe2_cmd
	db \1 ; unknown
ENDM

	enum toggle_noise_cmd ; $e3
MACRO toggle_noise
	db toggle_noise_cmd
	IF _NARG > 0
		db \1 ; drum kit
	ENDC
ENDM

	enum force_stereo_panning_cmd ; $e4
MACRO force_stereo_panning
	db force_stereo_panning_cmd
	dn %1111 * (1 && \1), %1111 * (1 && \2) ; left enable, right enable
ENDM

	enum volume_cmd ; $e5
MACRO volume
	db volume_cmd
	IF _NARG > 1
		dn \1, \2 ; left volume, right volume
	ELSE
		db \1 ; LEGACY: Support for 1-arg volume
	ENDC
ENDM

	enum pitch_offset_cmd ; $e6
MACRO pitch_offset
	db pitch_offset_cmd
	bigdw \1 ; pitch offset
ENDM

	enum unknownmusic0xe7_cmd ; $e7
MACRO unknownmusic0xe7
	db unknownmusic0xe7_cmd
	db \1 ; unknown
ENDM

	enum unknownmusic0xe8_cmd ; $e8
MACRO unknownmusic0xe8
	db unknownmusic0xe8_cmd
	db \1 ; unknown
ENDM

	enum tempo_relative_cmd ; $e9
MACRO tempo_relative
	db tempo_relative_cmd
	bigdw \1 ; tempo adjustment
ENDM

	enum restart_channel_cmd ; $ea
MACRO restart_channel
	db restart_channel_cmd
	dw \1 ; address
ENDM

	enum new_song_cmd ; $eb
MACRO new_song
	db new_song_cmd
	bigdw \1 ; id
ENDM

	enum sfx_priority_on_cmd ; $ec
MACRO sfx_priority_on
	db sfx_priority_on_cmd
ENDM

	enum sfx_priority_off_cmd ; $ed
MACRO sfx_priority_off
	db sfx_priority_off_cmd
ENDM

	enum unknownmusic0xee_cmd ; $ee
MACRO unknownmusic0xee
	db unknownmusic0xee_cmd
	dw \1 ; address
ENDM

	enum stereo_panning_cmd ; $ef
MACRO stereo_panning
	db stereo_panning_cmd
	dn %1111 * (1 && \1), %1111 * (1 && \2) ; left enable, right enable
ENDM

	enum sfx_toggle_noise_cmd ; $f0
MACRO sfx_toggle_noise
	db sfx_toggle_noise_cmd
	IF _NARG > 0
		db \1 ; drum kit
	ENDC
ENDM

	enum music0xf1_cmd ; $f1
MACRO music0xf1
	db music0xf1_cmd
ENDM

	enum music0xf2_cmd ; $f2
MACRO music0xf2
	db music0xf2_cmd
ENDM

	enum music0xf3_cmd ; $f3
MACRO music0xf3
	db music0xf3_cmd
ENDM

	enum music0xf4_cmd ; $f4
MACRO music0xf4
	db music0xf4_cmd
ENDM

	enum music0xf5_cmd ; $f5
MACRO music0xf5
	db music0xf5_cmd
ENDM

	enum music0xf6_cmd ; $f6
MACRO music0xf6
	db music0xf6_cmd
ENDM

	enum music0xf7_cmd ; $f7
MACRO music0xf7
	db music0xf7_cmd
ENDM

	enum music0xf8_cmd ; $f8
MACRO music0xf8
	db music0xf8_cmd
ENDM

	enum unknownmusic0xf9_cmd ; $f9
MACRO unknownmusic0xf9
	db unknownmusic0xf9_cmd
ENDM

	enum set_condition_cmd ; $fa
MACRO set_condition
	db set_condition_cmd
	db \1 ; condition
ENDM

	enum sound_jump_if_cmd ; $fb
MACRO sound_jump_if
	db sound_jump_if_cmd
	db \1 ; condition
	dw \2 ; address
ENDM

	enum sound_jump_cmd ; $fc
MACRO sound_jump
	db sound_jump_cmd
	dw \1 ; address
ENDM

	enum sound_loop_cmd ; $fd
MACRO sound_loop
	db sound_loop_cmd
	db \1 ; count
	dw \2 ; address
ENDM

	enum sound_call_cmd ; $fe
MACRO sound_call
	db sound_call_cmd
	dw \1 ; address
ENDM

	enum sound_ret_cmd ; $ff
MACRO sound_ret
	db sound_ret_cmd
ENDM

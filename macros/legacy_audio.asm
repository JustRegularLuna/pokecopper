; macros/scripts/audio.asm
; restored these conversions so that older songs for pokecrystal are usable
__ EQU 0
CC EQU 13

musicheader: MACRO
	channel_count \1
	channel \2, \3
ENDM

sound: MACRO
	note \1, \2
	db \3
	dw \4
ENDM

noise: MACRO
	note \1, \2
	db \3
	db \4
ENDM

notetype: MACRO
IF _NARG >= 2
	note_type \1, \2 >> 4, \2 & $0f
ELSE
	note_type \1
ENDC
ENDM

pitchoffset: MACRO
	transpose \1, \2 - 1
ENDM

dutycycle EQUS "duty_cycle"

intensity: MACRO
	volume_envelope \1 >> 4, \1 & $0f
ENDM

soundinput: MACRO
	pitch_sweep \1 >> 4, \1 & $0f
ENDM

unknownmusic0xde EQUS "sound_duty"
sound_duty: MACRO
	db $de
IF _NARG == 4
	db \1 | (\2 << 2) | (\3 << 4) | (\4 << 6)
ELSE
	db \1
ENDC
ENDM

togglesfx EQUS "toggle_sfx"

slidepitchto: MACRO
	pitch_slide \1, (8 - \2), \3
ENDM

togglenoise EQUS "toggle_noise"

panning: MACRO
	force_stereo_panning ((\1 >> 4) & 1), (\1 & 1)
ENDM

tone           EQUS "pitch_offset"
restartchannel EQUS "restart_channel"
newsong        EQUS "new_song"
sfxpriorityon  EQUS "sfx_priority_on"
sfxpriorityoff EQUS "sfx_priority_off"

stereopanning: MACRO
	stereo_panning ((\1 >> 4) & 1), (\1 & 1)
ENDM

sfxtogglenoise EQUS "sfx_toggle_noise"
setcondition   EQUS "set_condition"
jumpif         EQUS "sound_jump_if"
jumpchannel    EQUS "sound_jump"
loopchannel    EQUS "sound_loop"
callchannel    EQUS "sound_call"
endchannel     EQUS "sound_ret"

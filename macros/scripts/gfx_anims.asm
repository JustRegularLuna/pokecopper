; pic + oam animations

MACRO frame
	db \1
x = \2
if _NARG > 2
rept _NARG - 2
x = x | (1 << (\3 + 1))
	shift
endr
endc
	db x
ENDM

	enum_start $fc

	enum delanim_command ; $fc
MACRO delanim
; Removes the object from the screen, as opposed to `endanim` which just stops all motion
	db delanim_command
ENDM

	enum dowait_command ; $fd
MACRO dowait
	db dowait_command
	db \1 ; frames
ENDM

	enum dorestart_command ; $fe
MACRO dorestart
	db dorestart_command
ENDM

	enum endanim_command ; $ff
MACRO endanim
	db endanim_command
ENDM


; Used for pic animations
__enum__ = $fd

	enum dorepeat_command ; $fd
MACRO dorepeat
	db dorepeat_command
	db \1 ; command offset to jump to
ENDM

	enum setrepeat_command ; $fe
MACRO setrepeat
	db setrepeat_command
	db \1 ; amount of times to repeat
ENDM

; $00-$08 are TX_* constants (see macros/scripts/text.asm)

; Control characters (see home/text.asm)

	; unused: $09-$49

FIRST_CONTROL_CHAR EQU $4a

	charmap "¯",         $4a ; soft linebreak
	charmap "%",         $4b ; soft linebreak in landmark names
	charmap "<SCROLL>",  $4c
	charmap "<LF>",      $4d
	charmap "<NEXT>",    $4e
	charmap "<LINE>",    $4f
	charmap "@",         $50 ; string terminator (has to be $50 for Time Capsule)
	charmap "<PARA>",    $51
	charmap "<PLAYER>",  $52 ; wPlayerName
	charmap "<RIVAL>",   $53 ; wRivalName
	charmap "<MOM>",     $54 ; wMomsName
	charmap "#",         $55 ; "POKé"
	charmap "<CONT>",    $56
	charmap "<DONE>",    $57
	charmap "<PROMPT>",  $58
	charmap "<TARGET>",  $59
	charmap "<USER>",    $5a
	charmap "<ENEMY>",   $5b

LAST_CONTROL_CHAR EQU $5b

	; unused: $5c-$5f

; Actual characters (from other graphics files)

	; FontBattleExtra: $60-$7b (from gfx/font/font_battle_extra.png)

	; unused: $7c-$7e

	charmap " ",         $7f ; gfx/font/space.png

; Actual characters (from gfx/font/font.png)

	charmap "A",         $80
	charmap "B",         $81
	charmap "C",         $82
	charmap "D",         $83
	charmap "E",         $84
	charmap "F",         $85
	charmap "G",         $86
	charmap "H",         $87
	charmap "I",         $88
	charmap "J",         $89
	charmap "K",         $8a
	charmap "L",         $8b
	charmap "M",         $8c
	charmap "N",         $8d
	charmap "O",         $8e
	charmap "P",         $8f
	charmap "Q",         $90
	charmap "R",         $91
	charmap "S",         $92
	charmap "T",         $93
	charmap "U",         $94
	charmap "V",         $95
	charmap "W",         $96
	charmap "X",         $97
	charmap "Y",         $98
	charmap "Z",         $99

	charmap "(",         $9a
	charmap ")",         $9b
	charmap ":",         $9c
	charmap ";",         $9d
	charmap "[",         $9e
	charmap "]",         $9f

	charmap "a",         $a0
	charmap "b",         $a1
	charmap "c",         $a2
	charmap "d",         $a3
	charmap "e",         $a4
	charmap "f",         $a5
	charmap "g",         $a6
	charmap "h",         $a7
	charmap "i",         $a8
	charmap "j",         $a9
	charmap "k",         $aa
	charmap "l",         $ab
	charmap "m",         $ac
	charmap "n",         $ad
	charmap "o",         $ae
	charmap "p",         $af
	charmap "q",         $b0
	charmap "r",         $b1
	charmap "s",         $b2
	charmap "t",         $b3
	charmap "u",         $b4
	charmap "v",         $b5
	charmap "w",         $b6
	charmap "x",         $b7
	charmap "y",         $b8
	charmap "z",         $b9

	charmap "┌",         $ba
	charmap "─",         $bb
	charmap "┐",         $bc
	charmap "│",         $bd
	charmap "└",         $be
	charmap "┘",         $bf

	charmap "■",         $c0
	charmap "☎",         $c1

	; unused: $c2-$c9

	charmap "<BOLD_P>",  $ca ; PP
	charmap "⁂",         $cb ; shiny
	charmap "<ID>",      $cc
	charmap "№",         $cd
	charmap "′",         $ce
	charmap "″",         $cf

	charmap "'d",        $d0
	charmap "'l",        $d1
	charmap "'m",        $d2
	charmap "'r",        $d3
	charmap "'s",        $d4
	charmap "'t",        $d5
	charmap "'v",        $d6

	charmap "<BOLD_V>",  $d7
	charmap "<BOLD_S>",  $d8
	charmap "<COLON>",   $d9 ; colon with tinier dots than ":"
	charmap "<LV>",      $da
	charmap "▲",         $db
	charmap "◀",         $dc
	charmap "“",         $dd ; opening quote
	charmap "”",         $de ; closing quote

	charmap "←",         $df
	charmap "'",         $e0
	charmap "<PK>",      $e1
	charmap "<MN>",      $e2
	charmap "-",         $e3

	charmap "<PO>",      $e4
	charmap "<KE>",      $e5

	charmap "?",         $e6
	charmap "!",         $e7
	charmap ".",         $e8
	charmap "&",         $e9

	charmap "é",         $ea
	charmap "→",         $eb
	charmap "▷",         $ec
	charmap "▶",         $ed
	charmap "▼",         $ee
	charmap "♂",         $ef
	charmap "¥",         $f0
	charmap "×",         $f1
	charmap "…",         $f2 ; ellipsis
	charmap "/",         $f3
	charmap ",",         $f4
	charmap "♀",         $f5

	charmap "0",         $f6
	charmap "1",         $f7
	charmap "2",         $f8
	charmap "3",         $f9
	charmap "4",         $fa
	charmap "5",         $fb
	charmap "6",         $fc
	charmap "7",         $fd
	charmap "8",         $fe
	charmap "9",         $ff

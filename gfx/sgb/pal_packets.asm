; macros taken from pokered's data/sgb_packets.asm
; names taken from pandocs
; http://gbdev.gg8.se/wiki/articles/SGB_Functions#SGB_Palette_Commands

sgb_pal_set: MACRO
	db (SGB_PAL_SET << 3) + 1
	dw PAL_\1, PAL_\2, PAL_\3, PAL_\4
	ds 7
ENDM

sgb_pal01: MACRO
	db (SGB_PAL01 << 3) + 1
ENDM

sgb_pal23: MACRO
	db (SGB_PAL23 << 3) + 1
ENDM

PalPacket_UnownPuzzle:
	sgb_pal_set UNOWN_PUZZLE, UNOWN_PUZZLE, UNOWN_PUZZLE, UNOWN_PUZZLE

PalPacket_9bd6:
	sgb_pal_set ROUTE, ROUTE, ROUTE, ROUTE

PalPacket_Pack:
	sgb_pal_set PACK, ROUTE, ROUTE, ROUTE

PalPacket_PartyMenu:
	sgb_pal_set SHINY_GREYMON, HP_GREEN, HP_YELLOW, HP_RED

PalPacket_BattleGrayscale:
	sgb_pal_set BLACKOUT, BLACKOUT, BLACKOUT, BLACKOUT

PalPacket_Pokegear:
	sgb_pal_set POKEGEAR, ROUTE, ROUTE, ROUTE

PalPacket_SlotMachine:
	sgb_pal_set SLOT_MACHINE_0, SLOT_MACHINE_1, SLOT_MACHINE_2, SLOT_MACHINE_3

PalPacket_Diploma:
	sgb_pal_set MEWMON, ROUTE, ROUTE, ROUTE

PalPacket_TradeTube:
	sgb_pal_set BLUEMON, ROUTE, ROUTE, ROUTE

PalPacket_GamefreakLogo:
	sgb_pal_set GS_INTRO_GAMEFREAK_LOGO, ROUTE, ROUTE, ROUTE

PalPacket_TitleScreen:
	sgb_pal_set TITLE_SCREEN, ROUTE, ROUTE, ROUTE

PalPacket_9ce6:
	sgb_pal01
	RGB 31, 31, 31
rept 6
	RGB 00, 00, 00
endr
	ds 1

PalPacket_9cf6:
	sgb_pal23
	RGB 31, 31, 31
rept 6
	RGB 00, 00, 00
endr
	ds 1

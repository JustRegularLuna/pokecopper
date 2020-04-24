INCLUDE "constants.asm"


SECTION "Audio", ROMX

INCLUDE "audio/engine.asm"
INCLUDE "data/trainers/encounter_music.asm"
INCLUDE "audio/music_pointers.asm"
INCLUDE "audio/music/nothing.asm"
INCLUDE "audio/cry_pointers.asm"
INCLUDE "audio/sfx_pointers.asm"


SECTION "Cries", ROMX

INCLUDE "data/pokemon/cries.asm"
INCLUDE "audio/cries.asm"


INCLUDE "audio/music.asm"

INCLUDE "audio/sfx.asm"

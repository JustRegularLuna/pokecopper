; rg/bs requires rgbds 0.5.2 or newer.
MAJOR EQU 0
MINOR EQU 5
PATCH EQU 2

if !DEF(__RGBDS_MAJOR__) || !DEF(__RGBDS_MINOR__) || !DEF(__RGBDS_PATCH__)
	fail "pokecopper requires rgbds {MAJOR}.{MINOR}.{PATCH} or newer."
elif (__RGBDS_MAJOR__ < MAJOR) || \
	(__RGBDS_MAJOR__ == MAJOR && __RGBDS_MINOR__ < MINOR) || \
	(__RGBDS_MAJOR__ == MAJOR && __RGBDS_MINOR__ == MINOR && __RGBDS_PATCH__ < PATCH)
	fail "pokecopper requires rgbds {MAJOR}.{MINOR}.{PATCH} or newer."
endc

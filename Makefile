roms := pokecopper.gbc poketin.gbc

rom_obj := \
audio.o \
home.o \
main.o \
wram.o \
data/text/common.o \
data/maps/map_data.o \
data/pokemon/egg_moves.o \
data/pokemon/evos_attacks.o \
engine/movie/credits.o \
engine/overworld/events.o \
gfx/sprites.o \
gfx/tilesets.o \
gfx/pics.o

# Distinguish asm files which are game-exclusive for building (*_[copper|tin].asm)
gs_excl_asm := \
data/pokemon/dex_entries

copper_excl_obj := $(addsuffix _copper.o,$(gs_excl_asm))
tin_excl_obj := $(addsuffix _tin.o,$(gs_excl_asm))
copper_obj := $(rom_obj:.o=_copper.o) $(copper_excl_obj)
tin_obj := $(rom_obj:.o=_tin.o) $(tin_excl_obj)


### Build tools

ifeq (,$(shell which sha1sum))
SHA1 := shasum
else
SHA1 := sha1sum
endif

RGBDS ?=
RGBASM  ?= $(RGBDS)rgbasm
RGBFIX  ?= $(RGBDS)rgbfix
RGBGFX  ?= $(RGBDS)rgbgfx
RGBLINK ?= $(RGBDS)rgblink


### Build targets

.SUFFIXES:
.PHONY: all copper tin clean tidy compare tools
.SECONDEXPANSION:
.PRECIOUS:
.SECONDARY:

all: $(roms)
copper: pokecopper.gbc
tin:    poketin.gbc

clean:
	rm -f $(roms) $(copper_obj) $(tin_obj) $(roms:.gbc=.map) $(roms:.gbc=.sym) rgbdscheck.o
	find gfx \( -name "*.[12]bpp" -o -name "*.lz" -o -name "*.gbcpal" -o -name "*.dimensions" -o -name "*.sgb.tilemap" \) -delete
	$(MAKE) clean -C tools/

tidy:
	rm -f $(roms) $(copper_obj) $(tin_obj) $(roms:.gbc=.map) $(roms:.gbc=.sym) rgbdscheck.o
	$(MAKE) clean -C tools/

compare: $(roms)
	@$(SHA1) -c roms.sha1

tools:
	$(MAKE) -C tools/


RGBASMFLAGS = -hL -Q8 -Weverything -Wnumeric-string=2 -Wtruncation=1
# Create a sym/map for debug purposes if `make` run with `DEBUG=1`
ifeq ($(DEBUG),1)
RGBASMFLAGS += -E
endif

$(copper_obj): RGBASMFLAGS += -D _COPPER
$(tin_obj):    RGBASMFLAGS += -D _TIN

rgbdscheck.o: rgbdscheck.asm
	$(RGBASM) -o $@ $<

# The dep rules have to be explicit or else missing files won't be reported.
# As a side effect, they're evaluated immediately instead of when the rule is invoked.
# It doesn't look like $(shell) can be deferred so there might not be a better way.
define DEP
$1: $2 $$(shell tools/scan_includes $2) | rgbdscheck.o
	$$(RGBASM) $$(RGBASMFLAGS) -o $$@ $$<
endef

# Build tools when building the rom.
# This has to happen before the rules are processed, since that's when scan_includes is run.
ifeq (,$(filter clean tools,$(MAKECMDGOALS)))

$(info $(shell $(MAKE) -C tools))

# Dependencies for shared objects (drop _copper and _tin from asm file basenames)
$(foreach obj, $(filter-out $(copper_excl_obj), $(copper_obj)), \
	$(eval $(call DEP,$(obj),$(obj:_copper.o=.asm))))
$(foreach obj, $(filter-out $(tin_excl_obj), $(tin_obj)), \
	$(eval $(call DEP,$(obj),$(obj:_tin.o=.asm))))

# Dependencies for game-exclusive objects (keep _copper and _tin in asm file basenames)
$(foreach obj, $(copper_excl_obj) $(tin_excl_obj), $(eval $(call DEP,$(obj),$(obj:.o=.asm))))

endif


pokecopper.gbc: $(copper_obj) layout.link
	$(RGBLINK) -n pokecopper.sym -m pokecopper.map -l layout.link -o $@ $(copper_obj)
	$(RGBFIX) -cjsv -t "POKEMON2COPPER" -k 01 -l 0x33 -m 0x10 -r 3 -p 0 $@

poketin.gbc: $(tin_obj) layout.link
	$(RGBLINK) -n poketin.sym -m poketin.map -l layout.link -o $@ $(tin_obj)
	$(RGBFIX) -cjsv -t "POKEMON2TIN" -k 01 -l 0x33 -m 0x10 -r 3 -p 0 $@


### LZ compression rules

%.lz: %
	tools/lzcomp $(LZFLAGS) -- $< $@


### Misc file-specific graphics rules

gfx/pokemon/%/front.2bpp: rgbgfx += -Z
gfx/pokemon/%/back.2bpp: rgbgfx += -Z
gfx/pokemon/monfront/%.2bpp: rgbgfx += -Z
gfx/pokemon/monback/%.2bpp: rgbgfx += -Z

gfx/trainers/%.2bpp: rgbgfx += -Z

gfx/intro/fire1.2bpp: gfx/intro/charizard1.2bpp gfx/intro/charizard2_top.2bpp gfx/intro/space.2bpp ; cat $^ > $@
gfx/intro/fire2.2bpp: gfx/intro/charizard2_bottom.2bpp gfx/intro/charizard3.2bpp ; cat $^ > $@
gfx/intro/fire3.2bpp: gfx/intro/fire.2bpp gfx/intro/unused_blastoise_venusaur.2bpp ; cat $^ > $@

gfx/new_game/shrink1.2bpp: rgbgfx += -Z
gfx/new_game/shrink2.2bpp: rgbgfx += -Z

gfx/mail/dragonite.1bpp: tools/gfx += --remove-whitespace
gfx/mail/large_note.1bpp: tools/gfx += --remove-whitespace
gfx/mail/surf_mail_border.1bpp: tools/gfx += --remove-whitespace
gfx/mail/flower_mail_border.1bpp: tools/gfx += --remove-whitespace
gfx/mail/litebluemail_border.1bpp: tools/gfx += --remove-whitespace

gfx/pokedex/pokedex.2bpp: tools/gfx += --trim-whitespace
gfx/pokedex/pokedex_sgb.2bpp: tools/gfx += --trim-whitespace
gfx/pokedex/question_mark.2bpp: rgbgfx += -Z
gfx/pokedex/slowpoke.2bpp: tools/gfx += --trim-whitespace

gfx/pokegear/pokegear.2bpp: rgbgfx += -x2
gfx/pokegear/pokegear_sprites.2bpp: tools/gfx += --trim-whitespace

gfx/mystery_gift/mystery_gift.2bpp: tools/gfx += --remove-whitespace
gfx/mystery_gift/mystery_gift_2.2bpp: tools/gfx += --trim-whitespace
gfx/mystery_gift/question_mark.1bpp: tools/gfx += --remove-whitespace

gfx/trade/ball.2bpp: tools/gfx += --remove-whitespace
gfx/trade/game_boy.2bpp: tools/gfx += --remove-duplicates --preserve=0x23,0x27
gfx/trade/game_boy_cable.2bpp: gfx/trade/game_boy.2bpp gfx/trade/link_cable.2bpp ; cat $^ > $@

gfx/slots/slots_1.2bpp: tools/gfx += --trim-whitespace
gfx/slots/slots_2.2bpp: tools/gfx += --interleave --png=$<
gfx/slots/slots_3.2bpp: tools/gfx += --interleave --png=$< --remove-duplicates --keep-whitespace --remove-xflip

gfx/card_flip/card_flip_1.2bpp: tools/gfx += --trim-whitespace
gfx/card_flip/card_flip_2.2bpp: tools/gfx += --remove-whitespace

gfx/battle_anims/angels.2bpp: tools/gfx += --trim-whitespace
gfx/battle_anims/beam.2bpp: tools/gfx += --remove-xflip --remove-yflip --remove-whitespace
gfx/battle_anims/bubble.2bpp: tools/gfx += --trim-whitespace
gfx/battle_anims/charge.2bpp: tools/gfx += --trim-whitespace
gfx/battle_anims/egg.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/explosion.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/hit.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/horn.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/lightning.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/misc.2bpp: tools/gfx += --remove-duplicates --remove-xflip
gfx/battle_anims/noise.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/objects.2bpp: tools/gfx += --remove-whitespace --remove-xflip
gfx/battle_anims/pokeball.2bpp: tools/gfx += --remove-xflip --keep-whitespace
gfx/battle_anims/reflect.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/rocks.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/skyattack.2bpp: tools/gfx += --remove-whitespace
gfx/battle_anims/status.2bpp: tools/gfx += --remove-whitespace

gfx/player/hiro.2bpp: rgbgfx += -Z
gfx/player/hiro_back.2bpp: rgbgfx += -Z
gfx/player/sylvia.2bpp: rgbgfx += -Z
gfx/player/sylvia_back.2bpp: rgbgfx += -Z

gfx/trainer_card/leaders.2bpp: tools/gfx += --trim-whitespace

gfx/overworld/hiro_fish.2bpp: tools/gfx += --trim-whitespace
gfx/overworld/sylvia_fish.2bpp: tools/gfx += --trim-whitespace

gfx/sprites/big_onix.2bpp: tools/gfx += --remove-whitespace --remove-xflip

gfx/battle/dude.2bpp: rgbgfx += -Z
gfx/battle/ghost.2bpp: rgbgfx += -Z

gfx/font/unused_bold_font.1bpp: tools/gfx += --trim-whitespace

gfx/sgb/copper_border.2bpp: tools/gfx += --trim-whitespace
gfx/sgb/tin_border.2bpp: tools/gfx += --trim-whitespace
gfx/sgb/copper_border.sgb.tilemap: gfx/sgb/copper_border.bin ; tr < $< -d '\000' > $@
gfx/sgb/tin_border.sgb.tilemap: gfx/sgb/tin_border.bin ; tr < $< -d '\000' > $@


### Catch-all graphics rules

%.2bpp: %.png
	$(RGBGFX) $(rgbgfx) -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) -o $@ $@)

%.1bpp: %.png
	$(RGBGFX) $(rgbgfx) -d1 -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) -d1 -o $@ $@)

%.gbcpal: %.png
	$(RGBGFX) -p $@ $<

%.dimensions: %.png
	tools/png_dimensions $< $@

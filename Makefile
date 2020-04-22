roms := redgold.gbc bluesilver.gbc

rgbs_obj := \
audio.o \
home.o \
main.o \
wram.o \
data/text/common.o \
data/maps/map_data.o \
data/pokemon/dex_entries.o \
data/pokemon/egg_moves.o \
data/pokemon/evos_attacks.o \
engine/movie/credits.o \
engine/overworld/events.o \
gfx/battle_anims.o \
gfx/emotes.o \
gfx/misc.o \
gfx/pics.o \
gfx/sprites.o \
gfx/tilesets.o

redgold_obj := $(rgbs_obj:.o=_rg.o)
bluesilver_obj := $(rgbs_obj:.o=_bs.o)


### Build tools

RGBDS ?=
RGBASM  ?= $(RGBDS)rgbasm
RGBFIX  ?= $(RGBDS)rgbfix
RGBGFX  ?= $(RGBDS)rgbgfx
RGBLINK ?= $(RGBDS)rgblink


### Build targets

.SUFFIXES:
.PHONY: all redgold bluesilver clean tidy compare tools
.SECONDEXPANSION:
.PRECIOUS:
.SECONDARY:

all: $(roms)
redgold:    redgold.gbc
bluesilver: bluesilver.gbc

clean:
	rm -f $(roms) $(redgold_obj) $(bluesilver_obj) $(roms:.gbc=.map) $(roms:.gbc=.sym) rgbdscheck.o
	find gfx \( -name "*.[12]bpp" -o -name "*.lz" -o -name "*.gbcpal" -o -name "*.sgb.tilemap" \) -delete
	find gfx/pokemon -mindepth 1 ! -path "gfx/pokemon/unown/*" \( -name "bitmask.asm" -o -name "frames.asm" -o -name "front.animated.tilemap" -o -name "front.dimensions" \) -delete
	$(MAKE) clean -C tools/

tidy:
	rm -f $(roms) $(redgold_obj) $(bluesilver_obj) $(roms:.gbc=.map) $(roms:.gbc=.sym) rgbdscheck.o
	$(MAKE) clean -C tools/

tools:
	$(MAKE) -C tools/


RGBASMFLAGS = -L -Weverything
$(redgold_obj):    RGBASMFLAGS += -D _REDGOLD
$(bluesilver_obj): RGBASMFLAGS += -D _BLUESILVER

rgbdscheck.o: rgbdscheck.asm
	$(RGBASM) -o $@ $<

# The dep rules have to be explicit or else missing files won't be reported.
# As a side effect, they're evaluated immediately instead of when the rule is invoked.
# It doesn't look like $(shell) can be deferred so there might not be a better way.
define DEP
$1: $2 $$(shell tools/scan_includes $2)
	$$(RGBASM) $$(RGBASMFLAGS) -o $$@ $$<
endef

# Build tools when building the rom.
# This has to happen before the rules are processed, since that's when scan_includes is run.
ifeq (,$(filter clean tools,$(MAKECMDGOALS)))

$(info $(shell $(MAKE) -C tools))

$(foreach obj, $(redgold_obj), $(eval $(call DEP,$(obj),$(obj:_rg.o=.asm))))
$(foreach obj, $(bluesilver_obj), $(eval $(call DEP,$(obj),$(obj:_bs.o=.asm))))

endif


redgold.gbc: $(redgold_obj) layout.link
	$(RGBLINK) -n redgold.sym -m redgold.map -l layout.link -p 0xff -o $@ $(redgold_obj)
	$(RGBFIX) -Cjv -t POKEMON_2_ -i GOLD -k 01 -l 0x33 -m 0x10 -n 1 -p 0xff -r 3 $@

bluesilver.gbc: $(bluesilver_obj) layout.link
	$(RGBLINK) -n bluesilver.sym -m bluesilver.map -l layout.link -p 0xff -o $@ $(bluesilver_obj)
	$(RGBFIX) -Cjv -t POKEMON_2_ -i SILV -k 01 -l 0x33 -m 0x10 -n 1 -p 0xff -r 3 $@


### Misc file-specific graphics rules

gfx/pokemon/gmon/%.2bpp: rgbgfx += -h
gfx/pokemon/monback/%.2bpp: rgbgfx += -h
gfx/pokemon/unown/%.2bpp: rgbgfx += -h
gfx/pokemon/unownback/%.2bpp: rgbgfx += -h

gfx/trainers/%.2bpp: rgbgfx += -h

gfx/new_game/shrink1.2bpp: rgbgfx += -h
gfx/new_game/shrink2.2bpp: rgbgfx += -h

gfx/mail/dragonite.1bpp: tools/gfx += --remove-whitespace
gfx/mail/large_note.1bpp: tools/gfx += --remove-whitespace
gfx/mail/surf_mail_border.1bpp: tools/gfx += --remove-whitespace
gfx/mail/flower_mail_border.1bpp: tools/gfx += --remove-whitespace
gfx/mail/litebluemail_border.1bpp: tools/gfx += --remove-whitespace

gfx/pokedex/pokedex.2bpp: tools/gfx += --trim-whitespace
gfx/pokedex/pokedex_sgb.2bpp: tools/gfx += --trim-whitespace
gfx/pokedex/question_mark.2bpp: rgbgfx += -h
gfx/pokedex/slowpoke.2bpp: tools/gfx += --trim-whitespace

gfx/pokegear/pokegear.2bpp: rgbgfx += -x2
gfx/pokegear/pokegear_sprites.2bpp: tools/gfx += --trim-whitespace

gfx/title/crystal.2bpp: tools/gfx += --interleave --png=$<
gfx/title/logo.2bpp: rgbgfx += -x 4

gfx/trade/ball.2bpp: tools/gfx += --remove-whitespace

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

gfx/player/hiro.2bpp: rgbgfx += -h
gfx/player/hiro_back.2bpp: rgbgfx += -h
gfx/player/sylvia.2bpp: rgbgfx += -h
gfx/player/sylvia_back.2bpp: rgbgfx += -h

gfx/trainer_card/hiro_card.2bpp: rgbgfx += -h
gfx/trainer_card/sylvia_card.2bpp: rgbgfx += -h
gfx/trainer_card/leaders.2bpp: tools/gfx += --trim-whitespace

gfx/overworld/chris_fish.2bpp: tools/gfx += --trim-whitespace
gfx/overworld/kris_fish.2bpp: tools/gfx += --trim-whitespace

gfx/sprites/big_onix.2bpp: tools/gfx += --remove-whitespace --remove-xflip

gfx/battle/dude.2bpp: rgbgfx += -h

gfx/sgb/sgb_border.2bpp: tools/gfx += --trim-whitespace
gfx/sgb/sgb_border.sgb.tilemap: gfx/sgb/sgb_border.bin ; tr < $< -d '\000' > $@


### Catch-all graphics rules

%.lz: %
	tools/lzcomp -- $< $@

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

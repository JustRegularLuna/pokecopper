INCLUDE "data/trainers/party_pointers.asm"

Trainers:
; Trainer data structure:
; - db "NAME@", TRAINERTYPE_* constant
; - 1 to 6 Pokémon:
;    * for TRAINERTYPE_NORMAL:     db level, species
;    * for TRAINERTYPE_MOVES:      db level, species, 4 moves
;    * for TRAINERTYPE_ITEM:       db level, species, item
;    * for TRAINERTYPE_ITEM_MOVES: db level, species, item, 4 moves
; - db -1 ; end

FalknerGroup:

WhitneyGroup:

BugsyGroup:

MortyGroup:

PryceGroup:

JasmineGroup:

ChuckGroup:

ClairGroup:

Rival1Group:

PokemonProfGroup:

WillGroup:

PKMNTrainerGroup:

BrunoGroup:

KarenGroup:

KogaGroup:

ChampionGroup:

BrockGroup:

MistyGroup:

LtSurgeGroup:

ScientistGroup:

ErikaGroup:

YoungsterGroup:

SchoolboyGroup:

BirdKeeperGroup:

LassGroup:

JanineGroup:

CooltrainerMGroup:

CooltrainerFGroup:

BeautyGroup:

PokemaniacGroup:

GruntMGroup:

GentlemanGroup:

SkierGroup:

TeacherGroup:

SabrinaGroup:

BugCatcherGroup:

FisherGroup:

SwimmerMGroup:

SwimmerFGroup:

SailorGroup:

SuperNerdGroup:

Rival2Group:

GuitaristGroup:

HikerGroup:

BikerGroup:

BlaineGroup:

BurglarGroup:

FirebreatherGroup:

JugglerGroup:

BlackbeltGroup:

ExecutiveMGroup:

PsychicGroup:

PicnickerGroup:

CamperGroup:

ExecutiveFGroup:

SageGroup:

MediumGroup:

BoarderGroup:

PokefanMGroup:

KimonoGirlGroup:

TwinsGroup:

PokefanFGroup:

RedGroup:

BlueGroup:

OfficerGroup:

GruntFGroup:
; Placeholder
	db "TRAINER@", TRAINERTYPE_NORMAL
	db 5, BULBASAUR
	db -1 ; end

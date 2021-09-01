INCLUDE "constants.asm"


SECTION "Evolutions and Attacks", ROMX

; Evos+attacks data structure:
; - Evolution methods:
;    * db EVOLVE_LEVEL, level, species
;    * db EVOLVE_ITEM, used item, species
;    * db EVOLVE_TRADE, held item (or -1 for none), species
;    * db EVOLVE_HAPPINESS, TR_* constant (ANYTIME, MORNDAY, NITE), species
;    * db EVOLVE_STAT, level, ATK_*_DEF constant (LT, GT, EQ), species
; - db 0 ; no more evolutions
; - Learnset (in increasing level order):
;    * db level, move
; - db 0 ; no more level-up moves

INCLUDE "data/pokemon/evos_attacks_pointers.asm"

BulbasaurEvosAttacks:
	db EVOLVE_LEVEL, 16, IVYSAUR
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

IvysaurEvosAttacks:
	db EVOLVE_LEVEL, 32, VENUSAUR
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

VenusaurEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

CharmanderEvosAttacks:
	db EVOLVE_LEVEL, 16, CHARMELEON
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

CharmeleonEvosAttacks:
	db EVOLVE_LEVEL, 36, CHARIZARD
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

CharizardEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

SquirtleEvosAttacks:
	db EVOLVE_LEVEL, 16, WARTORTLE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

WartortleEvosAttacks:
	db EVOLVE_LEVEL, 36, BLASTOISE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

BlastoiseEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

CaterpieEvosAttacks:
	db EVOLVE_LEVEL, 7, METAPOD
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

MetapodEvosAttacks:
	db EVOLVE_LEVEL, 10, BUTTERFREE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

ButterfreeEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

WeedleEvosAttacks:
	db EVOLVE_LEVEL, 7, KAKUNA
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

KakunaEvosAttacks:
	db EVOLVE_LEVEL, 10, BEEDRILL
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

BeedrillEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

PidgeyEvosAttacks:
	db EVOLVE_LEVEL, 18, PIDGEOTTO
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

PidgeottoEvosAttacks:
	db EVOLVE_LEVEL, 36, PIDGEOT
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

PidgeotEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

RattataEvosAttacks:
	db EVOLVE_LEVEL, 20, RATICATE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

RaticateEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

SpearowEvosAttacks:
	db EVOLVE_LEVEL, 20, FEAROW
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

FearowEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

EkansEvosAttacks:
	db EVOLVE_LEVEL, 22, ARBOK
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

ArbokEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

PikachuEvosAttacks:
	db EVOLVE_ITEM, THUNDERSTONE, RAICHU
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

RaichuEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

SandshrewEvosAttacks:
	db EVOLVE_LEVEL, 22, SANDSLASH
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

SandslashEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

NidoranFEvosAttacks:
	db EVOLVE_LEVEL, 16, NIDORINA
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

NidorinaEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, NIDOQUEEN
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

NidoqueenEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

NidoranMEvosAttacks:
	db EVOLVE_LEVEL, 16, NIDORINO
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

NidorinoEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, NIDOKING
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

NidokingEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

ClefairyEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, CLEFABLE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

ClefableEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

VulpixEvosAttacks:
	db EVOLVE_ITEM, FIRE_STONE, NINETALES
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

NinetalesEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

JigglypuffEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, WIGGLYTUFF
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

WigglytuffEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

ZubatEvosAttacks:
	db EVOLVE_LEVEL, 22, GOLBAT
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

GolbatEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

OddishEvosAttacks:
	db EVOLVE_LEVEL, 21, GLOOM
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

GloomEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, VILEPLUME
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

VileplumeEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

ParasEvosAttacks:
	db EVOLVE_LEVEL, 24, PARASECT
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

ParasectEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

VenonatEvosAttacks:
	db EVOLVE_LEVEL, 31, VENOMOTH
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

VenomothEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

DiglettEvosAttacks:
	db EVOLVE_LEVEL, 26, DUGTRIO
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

DugtrioEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

MeowthEvosAttacks:
	db EVOLVE_LEVEL, 28, PERSIAN
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

PersianEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

PsyduckEvosAttacks:
	db EVOLVE_LEVEL, 33, GOLDUCK
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

GolduckEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

MankeyEvosAttacks:
	db EVOLVE_LEVEL, 28, PRIMEAPE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

PrimeapeEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

GrowlitheEvosAttacks:
	db EVOLVE_ITEM, FIRE_STONE, ARCANINE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

ArcanineEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

PoliwagEvosAttacks:
	db EVOLVE_LEVEL, 25, POLIWHIRL
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

PoliwhirlEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, POLIWRATH
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

PoliwrathEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

AbraEvosAttacks:
	db EVOLVE_LEVEL, 16, KADABRA
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

KadabraEvosAttacks:
	db EVOLVE_TRADE, -1, ALAKAZAM
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

AlakazamEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

MachopEvosAttacks:
	db EVOLVE_LEVEL, 28, MACHOKE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

MachokeEvosAttacks:
	db EVOLVE_TRADE, -1, MACHAMP
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

MachampEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

BellsproutEvosAttacks:
	db EVOLVE_LEVEL, 21, WEEPINBELL
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

WeepinbellEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, VICTREEBEL
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

VictreebelEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

TentacoolEvosAttacks:
	db EVOLVE_LEVEL, 30, TENTACRUEL
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

TentacruelEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

GeodudeEvosAttacks:
	db EVOLVE_LEVEL, 25, GRAVELER
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

GravelerEvosAttacks:
	db EVOLVE_TRADE, -1, GOLEM
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

GolemEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

PonytaEvosAttacks:
	db EVOLVE_LEVEL, 40, RAPIDASH
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

RapidashEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

SlowpokeEvosAttacks:
	db EVOLVE_LEVEL, 37, SLOWBRO
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

SlowbroEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

MagnemiteEvosAttacks:
	db EVOLVE_LEVEL, 30, MAGNETON
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

MagnetonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

FarfetchDEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

DoduoEvosAttacks:
	db EVOLVE_LEVEL, 31, DODRIO
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

DodrioEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

SeelEvosAttacks:
	db EVOLVE_LEVEL, 34, DEWGONG
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

DewgongEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

GrimerEvosAttacks:
	db EVOLVE_LEVEL, 38, MUK
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

MukEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

ShellderEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, CLOYSTER
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

CloysterEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

GastlyEvosAttacks:
	db EVOLVE_LEVEL, 25, HAUNTER
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

HaunterEvosAttacks:
	db EVOLVE_TRADE, -1, GENGAR
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

GengarEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

OnixEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

DrowzeeEvosAttacks:
	db EVOLVE_LEVEL, 26, HYPNO
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

HypnoEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

KrabbyEvosAttacks:
	db EVOLVE_LEVEL, 28, KINGLER
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

KinglerEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

VoltorbEvosAttacks:
	db EVOLVE_LEVEL, 30, ELECTRODE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

ElectrodeEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

ExeggcuteEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, EXEGGUTOR
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

ExeggutorEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

CuboneEvosAttacks:
	db EVOLVE_LEVEL, 28, MAROWAK
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

MarowakEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

HitmonleeEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

HitmonchanEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

LickitungEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

KoffingEvosAttacks:
	db EVOLVE_LEVEL, 35, WEEZING
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

WeezingEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

RhyhornEvosAttacks:
	db EVOLVE_LEVEL, 42, RHYDON
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

RhydonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

ChanseyEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

TangelaEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

KangaskhanEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

HorseaEvosAttacks:
	db EVOLVE_LEVEL, 32, SEADRA
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

SeadraEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

GoldeenEvosAttacks:
	db EVOLVE_LEVEL, 33, SEAKING
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

SeakingEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

StaryuEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, STARMIE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

StarmieEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

MrMimeEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

ScytherEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

JynxEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

ElectabuzzEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

MagmarEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

PinsirEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

TaurosEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

MagikarpEvosAttacks:
	db EVOLVE_LEVEL, 20, GYARADOS
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

GyaradosEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

LaprasEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

DittoEvosAttacks:
	db 0 ; no more evolutions
	db 1, TRANSFORM
	db 0 ; no more level-up moves

EeveeEvosAttacks:
	db EVOLVE_ITEM, THUNDERSTONE, JOLTEON
	db EVOLVE_ITEM, WATER_STONE, VAPOREON
	db EVOLVE_ITEM, FIRE_STONE, FLAREON
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

VaporeonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

JolteonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

FlareonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

PorygonEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

OmanyteEvosAttacks:
	db EVOLVE_LEVEL, 40, OMASTAR
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

OmastarEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

KabutoEvosAttacks:
	db EVOLVE_LEVEL, 40, KABUTOPS
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

KabutopsEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

AerodactylEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

SnorlaxEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

ArticunoEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

ZapdosEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

MoltresEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

DratiniEvosAttacks:
	db EVOLVE_LEVEL, 30, DRAGONAIR
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

DragonairEvosAttacks:
	db EVOLVE_LEVEL, 55, DRAGONITE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

DragoniteEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

MewtwoEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

MewEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves



UnownEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

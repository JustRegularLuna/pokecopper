trainerclass: MACRO
	enum \1
const_value = 1
ENDM

; trainer class ids
; `trainerclass` indexes are for:
; - TrainerClassNames (see data/trainers/class_names.asm)
; - TrainerClassAttributes (see data/trainers/attributes.asm)
; - TrainerClassDVs (see data/trainers/dvs.asm)
; - TrainerGroups (see data/trainers/party_pointers.asm)
; - TrainerEncounterMusic (see data/trainers/encounter_music.asm)
; - TrainerPicPointers (see data/trainers/pic_pointers.asm)
; trainer constants are Trainers indexes, for the sub-tables of TrainerGroups (see data/trainers/parties.asm)
	enum_start

	trainerclass TRAINER_NONE ; 0
	const PHONECONTACT_MOM
	const PHONECONTACT_OAK
	const PHONECONTACT_BILL

	trainerclass POKEMON_PROF
	const OAK1

	trainerclass HIRO ; used in link battles, trainer house later
	const HIRO1

	trainerclass SYLVIA ; hopefully for future use in link battles, and trainer house later
	const SYLVIA1

	trainerclass RIVAL1
	const RIVAL1_LAB_STARTER1
	const RIVAL1_LAB_STARTER2
	const RIVAL1_LAB_STARTER3

NUM_TRAINER_CLASSES EQU __enum__

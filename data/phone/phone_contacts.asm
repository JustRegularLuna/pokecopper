phone: MACRO
; trainer class, trainer id, map, callee time, callee script, caller time, caller script
	db \1, \2
	map_id \3
	db \4
	dba \5
	db \6
	dba \7
ENDM

PhoneContacts:
; entries correspond to PHONE_* constants
	phone TRAINER_NONE, PHONE_00,              N_A,                       0,       UnusedPhoneScript,        0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONECONTACT_MOM,      PLAYERS_HOUSE_1F,          ANYTIME, MomPhoneCalleeScript,     0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONECONTACT_BIKESHOP, N_A,                       0,       UnusedPhoneScript,        0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONECONTACT_BILL,     N_A,                       ANYTIME, BillPhoneCalleeScript,    0,       BillPhoneCallerScript
	phone TRAINER_NONE, PHONECONTACT_ELM,      N_A,                       ANYTIME, ElmPhoneCalleeScript,     0,       ElmPhoneCallerScript
	phone SCHOOLBOY,    JACK1,                 N_A,                       ANYTIME, JackPhoneCalleeScript,    ANYTIME, JackPhoneCallerScript
	phone POKEFANF,     BEVERLY1,              N_A,                       ANYTIME, BeverlyPhoneCalleeScript, ANYTIME, BeverlyPhoneCallerScript
	phone SAILOR,       HUEY1,                 N_A,                       ANYTIME, HueyPhoneCalleeScript,    ANYTIME, HueyPhoneCallerScript
	phone TRAINER_NONE, PHONE_00,              N_A,                       0,       UnusedPhoneScript,        0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,              N_A,                       0,       UnusedPhoneScript,        0,       UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,              N_A,                       0,       UnusedPhoneScript,        0,       UnusedPhoneScript
	phone COOLTRAINERM, GAVEN3,                N_A,                       ANYTIME, GavenPhoneCalleeScript,   ANYTIME, GavenPhoneCallerScript
	phone COOLTRAINERF, BETH1,                 N_A,                       ANYTIME, BethPhoneCalleeScript,    ANYTIME, BethPhoneCallerScript
	phone BIRD_KEEPER,  JOSE2,                 N_A,                       ANYTIME, JosePhoneCalleeScript,    ANYTIME, JosePhoneCallerScript
	phone COOLTRAINERF, REENA1,                N_A,                       ANYTIME, ReenaPhoneCalleeScript,   ANYTIME, ReenaPhoneCallerScript
	phone YOUNGSTER,    JOEY1,                 N_A,                       ANYTIME, JoeyPhoneCalleeScript,    ANYTIME, JoeyPhoneCallerScript
	phone BUG_CATCHER,  WADE1,                 N_A,                       ANYTIME, WadePhoneCalleeScript,    ANYTIME, WadePhoneCallerScript
	phone FISHER,       RALPH1,                N_A,                       ANYTIME, RalphPhoneCalleeScript,   ANYTIME, RalphPhoneCallerScript
	phone PICNICKER,    LIZ1,                  N_A,                       ANYTIME, LizPhoneCalleeScript,     ANYTIME, LizPhoneCallerScript
	phone HIKER,        ANTHONY2,              N_A,                       ANYTIME, AnthonyPhoneCalleeScript, ANYTIME, AnthonyPhoneCallerScript
	phone CAMPER,       TODD1,                 N_A,                       ANYTIME, ToddPhoneCalleeScript,    ANYTIME, ToddPhoneCallerScript
	phone PICNICKER,    GINA1,                 N_A,                       ANYTIME, GinaPhoneCalleeScript,    ANYTIME, GinaPhoneCallerScript
	phone JUGGLER,      IRWIN1,                N_A,                       ANYTIME, IrwinPhoneCalleeScript,   ANYTIME, IrwinPhoneCallerScript
	phone BUG_CATCHER,  ARNIE1,                N_A,                       ANYTIME, ArniePhoneCalleeScript,   ANYTIME, ArniePhoneCallerScript
	phone SCHOOLBOY,    ALAN1,                 N_A,                       ANYTIME, AlanPhoneCalleeScript,    ANYTIME, AlanPhoneCallerScript
	phone TRAINER_NONE, PHONE_00,              N_A,                       0,       UnusedPhoneScript,        0,       UnusedPhoneScript
	phone LASS,         DANA1,                 N_A,                       ANYTIME, DanaPhoneCalleeScript,    ANYTIME, DanaPhoneCallerScript
	phone SCHOOLBOY,    CHAD1,                 N_A,                       ANYTIME, ChadPhoneCalleeScript,    ANYTIME, ChadPhoneCallerScript
	phone POKEFANM,     DEREK1,                N_A,                       ANYTIME, DerekPhoneCalleeScript,   ANYTIME, DerekPhoneCallerScript
	phone FISHER,       CHRIS1,                N_A,                       ANYTIME, ChrisPhoneCalleeScript,   ANYTIME, ChrisPhoneCallerScript
	phone POKEMANIAC,   BRENT1,                N_A,                       ANYTIME, BrentPhoneCalleeScript,   ANYTIME, BrentPhoneCallerScript
	phone PICNICKER,    TIFFANY3,              N_A,                       ANYTIME, TiffanyPhoneCalleeScript, ANYTIME, TiffanyPhoneCallerScript
	phone BIRD_KEEPER,  VANCE1,                N_A,                       ANYTIME, VancePhoneCalleeScript,   ANYTIME, VancePhoneCallerScript
	phone FISHER,       WILTON1,               N_A,                       ANYTIME, WiltonPhoneCalleeScript,  ANYTIME, WiltonPhoneCallerScript
	phone BLACKBELT_T,  KENJI3,                N_A,                       ANYTIME, KenjiPhoneCalleeScript,   ANYTIME, KenjiPhoneCallerScript
	phone HIKER,        PARRY1,                N_A,                       ANYTIME, ParryPhoneCalleeScript,   ANYTIME, ParryPhoneCallerScript
	phone PICNICKER,    ERIN1,                 N_A,                       ANYTIME, ErinPhoneCalleeScript,    ANYTIME, ErinPhoneCallerScript

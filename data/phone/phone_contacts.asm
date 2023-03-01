MACRO phone
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
	phone TRAINER_NONE, PHONE_00,              N_A,                       0,       PlaceholderPhoneScript,   0,       PlaceholderPhoneScript
	phone TRAINER_NONE, PHONECONTACT_MOM,      PLAYERS_HOUSE_1F,          ANYTIME, MomPhoneCalleeScript,     0,       PlaceholderPhoneScript
	phone TRAINER_NONE, PHONECONTACT_OAK,      N_A,                       ANYTIME, OakPhoneCalleeScript,     0,       OakPhoneCallerScript
	phone TRAINER_NONE, PHONECONTACT_BILL,     N_A,                       ANYTIME, BillPhoneCalleeScript,    0,       BillPhoneCallerScript

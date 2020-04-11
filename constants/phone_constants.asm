; PhoneContacts indexes (see data/phone/phone_contacts.asm)
	const_def
	const PHONE_00
	const PHONE_MOM
	const PHONE_OAK
	const PHONE_BILL

; SpecialPhoneCallList indexes (see data/phone/special_calls.asm)
	const_def
	const SPECIALCALL_NONE
	const SPECIALCALL_POKERUS

; phone struct members
	const_def
	const PHONE_CONTACT_TRAINER_CLASS
	const PHONE_CONTACT_TRAINER_NUMBER
	const PHONE_CONTACT_MAP_GROUP
	const PHONE_CONTACT_MAP_NUMBER
	const PHONE_CONTACT_SCRIPT1_TIME
	const PHONE_CONTACT_SCRIPT1_BANK
	const PHONE_CONTACT_SCRIPT1_ADDR_LO
	const PHONE_CONTACT_SCRIPT1_ADDR_HI
	const PHONE_CONTACT_SCRIPT2_TIME
	const PHONE_CONTACT_SCRIPT2_BANK
	const PHONE_CONTACT_SCRIPT2_ADDR_LO
	const PHONE_CONTACT_SCRIPT2_ADDR_HI
PHONE_CONTACT_SIZE EQU const_value

; maximum number of pokegear contacts
CONTACT_LIST_SIZE EQU 10

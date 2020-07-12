OakPhoneCalleeScript:
	readvar VAR_SPECIALPHONECALL
	ifequal SPECIALCALL_POKERUS, .pokerus
	; and more here as needed
	writetext OakPhoneHealYourMonText
	end

.pokerus
	writetext OakPhoneDiscoveredPokerusText
	specialphonecall SPECIALCALL_NONE
	end

OakPhoneCallerScript:
	; check for others as needed
	writetext OakPhoneDiscoveredPokerusText
	specialphonecall SPECIALCALL_NONE
	end

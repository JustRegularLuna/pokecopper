OakPhoneCalleeScript:
	readvar VAR_SPECIALPHONECALL
	ifequal SPECIALCALL_POKERUS, .pokerus
	; and more here as needed
	farwritetext OakPhoneHealYourMonText
	end

.pokerus
	farwritetext OakPhoneDiscoveredPokerusText
	specialphonecall SPECIALCALL_NONE
	end

OakPhoneCallerScript:
	; check for others as needed
	farwritetext OakPhoneDiscoveredPokerusText
	specialphonecall SPECIALCALL_NONE
	end

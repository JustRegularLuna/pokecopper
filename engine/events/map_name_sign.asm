; There is no map name sign anymore, just like RBY/GS/Spaceworld
InitMapNameSign::
	xor a
	ldh [hBGMapMode], a
PlaceMapNameSign::
	ld a, $90
	ldh [rWY], a
	ldh [hWY], a
	xor a
	ldh [hLCDCPointer], a
	ret

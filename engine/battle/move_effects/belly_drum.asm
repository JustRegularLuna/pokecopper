BattleCommand_BellyDrum:
; bellydrum

	farcall GetHalfMaxHP
	farcall CheckUserHasEnoughHP
	jr nc, .failed

	push bc
	call BattleCommand_AttackUp2
	pop bc
	ld a, [wAttackMissed]
	and a
	jr nz, .failed

	push bc
	call AnimateCurrentMove
	pop bc
	farcall SubtractHPFromUser
	call UpdateUserInParty
	ld a, 5

.max_attack_loop
	push af
	call BattleCommand_AttackUp2
	pop af
	dec a
	jr nz, .max_attack_loop

	ld hl, BellyDrumText
	jp StdBattleTextbox

.failed
	call AnimateFailedMove
	jp PrintButItFailed

// Calculate Player Dashing
if (key_roll and rollCooldownTimer == 0 and (hspeed != 0 or vspeed != 0)) {
	hspeed = hspeed * rollSpeed;
	vspeed = vspeed * rollSpeed;
	isRolling = true;
	rollCooldownTimer = rollCooldown;
	rollDurationTimer = rollDuration;
}
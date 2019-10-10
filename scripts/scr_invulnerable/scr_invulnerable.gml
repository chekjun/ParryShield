if (invulnerableDurationTimer > 0) {
	--invulnerableDurationTimer;
} else {
	isInvulnerable = false;
}

isInvulnerable = true;
invulnerableDurationTimer = argument0;
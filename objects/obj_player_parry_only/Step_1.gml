if (parryCooldownTimer > 0) {
	--parryCooldownTimer;
}

if (parryDurationTimer > 0) {
	--parryDurationTimer;
} else {
	isParrying = false;
}
if (shootCooldownTimer > 0) {
	--shootCooldownTimer;
}

if (shootDurationTimer) {
	--shootDurationTimer;
} else {
	isShooting = false;
}
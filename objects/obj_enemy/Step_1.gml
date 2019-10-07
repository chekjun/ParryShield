if (isDead) {
	exit;
}

if (shootCooldownTimer > 0) {
	--shootCooldownTimer;
}
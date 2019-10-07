if (shootCooldownTimer > 0) {
	--shootCooldownTimer;
}

if (shootDurationTimer) {
	--shootDurationTimer;
} else {
	isShooting = false;
}

scr_get_player_input();
scr_shoot();
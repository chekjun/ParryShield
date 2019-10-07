if (isDead) {
	exit;
}

scr_cooldown();

if (isDashing) {
	exit;
}

scr_get_player_input();

if (!isParrying) {
	scr_walk();
	scr_dash();
}

if (!isShooting) {
	scr_shoot();
}

if (!isParrying) {
	scr_parry();
}

if (!isParrying) {
	scr_block();
}
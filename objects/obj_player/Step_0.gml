if (isDead) {
	exit;
}

scr_cooldown();
scr_get_player_input();

if (!isDashing and !isParrying) {
	scr_walk();
	scr_dash();
}


if (!isDashing and !isShooting) {
	scr_shoot();
}

if (!isDashing and !isParrying) {
	scr_parry();
}

if (!isDashing and !isParrying) {
	scr_block();
}
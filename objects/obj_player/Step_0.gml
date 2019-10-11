if (isDead) exit;
scr_cooldown();
scr_get_player_input();

if (!isRolling and !isParrying) {
	scr_walk();
	scr_roll();
}

if (!isRolling) {
	scr_shoot();
}

if (!isRolling) {
	scr_parry();
}

if (!isRolling and !isParrying) {
	scr_block();
}

// Check health
if (health <= 0 and !isDead) {
	isDead = true;
	hspeed = 0;
	vspeed = 0;
}

depth = -bbox_bottom;
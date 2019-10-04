if (!isDead and HP <= 0) {
	isDead = true;
	sprite_index = spr_enemy_dead;
}

depth = -bbox_bottom;
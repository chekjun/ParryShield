if (HP <= 0 and !isDead) {
	show_debug_message("Enemy Died!")
	isDead = true;
	sprite_index = spr_enemydead;
}
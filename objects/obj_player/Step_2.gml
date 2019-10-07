// Check health
if (health <= 0 and !isDead) {
	show_debug_message("Player has Died!");
	isDead = true;
}

depth = -bbox_bottom;
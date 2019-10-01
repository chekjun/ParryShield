// Check HP
if (HP <= 0 and !isDead) {
	show_debug_message("Player has Died!");
	isDead = true;
}
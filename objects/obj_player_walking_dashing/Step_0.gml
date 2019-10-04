scr_get_player_input();
if (!isDashing and !isParrying) {
	scr_walk();	
}

if (!isParrying) {
	scr_dash();	
}
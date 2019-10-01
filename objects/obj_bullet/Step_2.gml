// Horizontal Collision with Parrying Shield
if (place_meeting(x + hspeed, y, obj_shield)) {
	if (obj_player.parryDuration > 0) {
		show_debug_message("Parried!");
		hspeed *= -1;
	} else if (obj_player.MP >= 0) {
		show_debug_message("Blocked!");
		instance_destroy();
		obj_player.MP -= 10;
	}
}

// Vertical Collision with Parrying Shield
if (place_meeting(x, y + speed, obj_shield)) {
	if (obj_player.parryDuration > 0) {
		show_debug_message("Parried!");
		vspeed *= -1;
	} else if (obj_player.MP >= 0) {
		show_debug_message("Blocked!");
		instance_destroy();
		obj_player.MP -= 10;
	}
}
if (key_parry and parryCooldownTimer == 0) {
		show_debug_message("Parry Triggered!");
		isParrying = true;
		parryCooldownTimer = parryCooldown;
		parryDurationTimer = parryDuration;
		scr_parry_anim();
		instance_create_depth(
			x + lengthdir_x(24, point_direction(x, y, mouse_x, mouse_y)),
			y + lengthdir_y(24, point_direction(x, y, mouse_x, mouse_y)),
			depth,
			obj_parry
		);
}
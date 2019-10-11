key_up = keyboard_check(ord("W"));
key_left = keyboard_check(ord("A"));
key_down = keyboard_check(ord("S"));
key_right = keyboard_check(ord("D"));
key_dash = keyboard_check_pressed(vk_space);
key_shoot = mouse_check_button_pressed(mb_left);
key_parry = mouse_check_button_pressed(mb_right);
key_shield = mouse_check_button(mb_right);
if (!isDashing) {
	
	// Calculate Player Walking
	hspeed = (key_right - key_left) * moveSpeed;
	vspeed = (key_down - key_up) * moveSpeed;

	if (hspeed != 0 and vspeed != 0) {
		hspeed = hspeed * round(sqrt(2) / 2);
		vspeed = vspeed * round(sqrt(2) / 2);
	}

	if (place_meeting(x + hspeed, y, obj_wall)) {
		while (!place_meeting(x + sign(hspeed), y, obj_wall)) {
			x = x + sign(hspeed);
		}
		hspeed = 0;
	}

	if (place_meeting(x, y + vspeed, obj_wall)) {
			while (!place_meeting(x, y + sign(vspeed), obj_wall)) {
			y = y + sign(vspeed);
		}
		vspeed = 0;
	}

}

// Calculate Player Dashing
if (key_dash and dashCooldownTimer == 0 and (hspeed != 0 or vspeed != 0)) {
	show_debug_message("Dash Triggered!");
	if (hspeed != 0 and vspeed != 0) {
		hspeed = hspeed * round(sqrt(2) / 2);
		vspeed = vspeed * round(sqrt(2) / 2);
	}
	hspeed = sign(hspeed) * dashSpeed;
	vspeed = sign(vspeed) * dashSpeed;
	isDashing = true;
	dashCooldownTimer = dashCooldown;
	dashDurationTimer = dashDuration;
}

// Check that player has dashed.
if (!hasDashed and key_dash and (hspeed != 0 or vspeed != 0)) hasDashed = true;
if (hasDashed and keyboard_check_pressed(vk_enter)) room_goto_next();
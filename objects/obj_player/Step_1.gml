if (isDead) {
	exit;
}

// Get Player Input
key_up = keyboard_check(ord("W"));
key_left = keyboard_check(ord("A"));
key_down = keyboard_check(ord("S"));
key_right = keyboard_check(ord("D"));
key_dash = keyboard_check(vk_space);
key_shoot = mouse_check_button(mb_left);
key_parry = mouse_check_button_pressed(mb_right);
key_shield = mouse_check_button(mb_right);

if (isDashing or isParrying or isShooting) {
	key_up = 0;
	key_left = 0;
	key_down = 0;
	key_right = 0;
	key_shoot = 0;
	key_parry = 0;
	key_shield = 0;
}

// Dash Cooldown
if (dashCooldown > 0) {
	--dashCooldown;
}

if (dashDuration > 0) {
	--dashDuration;
	if (place_meeting(x + dashX, y, obj_wall)) {
		while (!place_meeting(x + sign(dashX), y, obj_wall)) {
			x = x + sign(dashX);
		}
		dashX = 0;
	}
	x = x + dashX;
	if (place_meeting(x, y + dashY, obj_wall)) {
		while (!place_meeting(x, y + sign(dashY), obj_wall)) {
			y = y + sign(dashY);
		}
		dashY = 0;
	}
	y = y + dashY;
} else {
	isDashing = false;
}

// Shoot Cooldown
if (shootCooldown > 0) {
	--shootCooldown;
}

if (shootDuration > 0) {
	--shootDuration;
} else {
	isShooting = false;
}

// Parry Cooldown
if (parryCooldown > 0) {
	--parryCooldown;
}

if (parryDuration > 0) {
	--parryDuration;
} else {
	isParrying = false;
}
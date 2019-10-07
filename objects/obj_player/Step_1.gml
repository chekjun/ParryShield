if (isDead) {
	exit;
}

scr_get_player_input();

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

	if (place_meeting(x, y + dashY, obj_wall)) {
		while (!place_meeting(x, y + sign(dashY), obj_wall)) {
			y = y + sign(dashY);
		}
		dashY = 0;
	}
	
	x = x + dashX;
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

// isBusy Check
if (isDashing or isParrying) {
	key_up = 0;
	key_left = 0;
	key_down = 0;
	key_right = 0;
	key_shoot = 0;
	key_parry = 0;
	key_shield = 0;
}
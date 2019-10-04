// Calculate Player Dash
if (dashCooldownTimer > 0) {
	--dashCooldownTimer;
}

if (dashDurationTimer > 0) {
	--dashDurationTimer;
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
} else {
	isDashing = false;
}

if (key_dash and dashCooldownTImer == 0) {
	hspeed = hspeed * hspeed;
	vspeed = vspeed * vspeed;
	isDashing = true;
	dashCooldownTimer = dashCooldown;
	dashDurationTimer = dashDuration;
}
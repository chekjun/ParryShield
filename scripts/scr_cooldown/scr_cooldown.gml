// Dash Cooldown Timer
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

// Shoot Cooldown Timer
if (shootCooldownTimer > 0) {
	--shootCooldownTimer;
}

if (shootDurationTimer) {
	--shootDurationTimer;
} else {
	isShooting = false;
}

// Parry Cooldown Timer
if (parryCooldownTimer > 0) {
	--parryCooldownTimer;
}

if (parryDurationTimer > 0) {
	--parryDurationTimer;
} else {
	isParrying = false;
}
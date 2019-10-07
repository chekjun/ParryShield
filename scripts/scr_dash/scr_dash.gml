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
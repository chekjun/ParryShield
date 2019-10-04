// Calculate Player Shooting
if (key_shoot and shootCooldownTimer == 0) {
	show_debug_message("Shoot Triggered!");
	lookingAngle = point_direction(x, y, mouse_x, mouse_y);
	instance_create_depth(
		x + lengthdir_x(16, lookingAngle),
		y + lengthdir_y(16, lookingAngle),
		depth,
		obj_player_bullet);
	isShooting = true;
	shootCooldownTimer = shootCooldown;
	shootDurationTimer = shootDuration;
}
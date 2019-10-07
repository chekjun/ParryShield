// Calculate Player Shooting
if (key_shoot and shootCooldownTimer == 0) {
	show_debug_message("Shoot Triggered!");
	instance_create_depth(x, y, depth, obj_player_bullet);
	isShooting = true;
	shootCooldownTimer = shootCooldown;
	shootDurationTimer = shootDuration;
}
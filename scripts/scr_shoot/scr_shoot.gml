// Calculate Player Shooting
if (key_shoot and shootCooldownTimer == 0 and !collision_circle(x, y, 16, obj_wall, false, false)) {
	show_debug_message("Shoot Triggered!");
	instance_create_depth(x, y, depth, obj_player_bullet);
	isShooting = true;
	shootCooldownTimer = shootCooldown;
	shootDurationTimer = shootDuration;
}
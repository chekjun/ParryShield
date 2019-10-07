if (isDead) {
	exit;
}

if (shootCooldownTimer > 0) {
	--shootCooldownTimer;
}

if (!collision_line(x, y, obj_player.x, obj_player.y, obj_wall, true, true) and distance_to_object(obj_player) < 250 and detectCooldownTimer > 0) {
	--detectCooldownTimer;
} else {
	detectCooldownTimer = detectCooldown;
}

if (detectCooldownTimer == 0 and shootCooldownTimer == 0) {
	shootCooldownTimer = shootCooldown;
	instance_create_depth(x, y, depth, obj_enemy_bullet);
}
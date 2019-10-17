if (isDead) {
	exit;
}

if (!collision_line(x, y, obj_delta.x, obj_delta.y, obj_wall, true, true)
	and distance_to_object(obj_delta) < detectionRange
	and detectCooldownTimer > 0) {
	--detectCooldownTimer;
} else if (detectCooldownTimer < detectCooldown) {
	++detectCooldownTimer;
}

if (shootCooldownTimer > 0) {
	--shootCooldownTimer;
}

if (detectCooldownTimer == 0 and shootCooldownTimer == 0) {
	shootCooldownTimer = shootCooldown;
	instance_create_depth(x, y, depth, obj_enemy_bullet);
}

if (HP <= 0 and !isDead) {
	isDead = true;
	sprite_index = spr_enemy_dead;
}
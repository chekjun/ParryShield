if (isDead) {
	exit;
}

if (!collision_line(x, y, obj_delta.x, obj_delta.y, obj_wall, true, true) and distance_to_object(obj_delta) < 200 and detectCooldownTimer > 0) {
	--detectCooldownTimer;
} else if (detectCooldownTimer < detectCooldown) {
	++detectCooldownTimer;
}

if (shootCooldownTimer > 0) {
	--shootCooldownTimer;
}

if (shootDurationTimer > 0) {
	--shootDurationTimer;
}

if (detectCooldownTimer == 0 and shootCooldownTimer == 0) {
	shootCooldownTimer = shootCooldown;
	burstCounter = 3;
}

if (burstCounter > 0 and shootDurationTimer == 0) {
	instance_create_depth(x, y, depth, obj_enemy_bullet);
	--burstCounter;
	shootDurationTimer = shootDuration;
}

if (HP <= 0 and !isDead) {
	isDead = true;
	sprite_index = spr_enemy_dead;
}
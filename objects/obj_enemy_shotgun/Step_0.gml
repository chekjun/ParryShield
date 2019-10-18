if (isDead) {
	exit;
}

if (shootCooldownTimer > 0) {
	--shootCooldownTimer;
}

if (!collision_line(x, y, obj_delta.x, obj_delta.y, obj_wall, true, true) and distance_to_object(obj_delta) < 200 and detectCooldownTimer > 0) {
	--detectCooldownTimer;
} else {
	detectCooldownTimer = detectCooldown;
}

if (detectCooldownTimer == 0 and shootCooldownTimer == 0) {
	shootCooldownTimer = shootCooldown;
	instance_create_depth(x, y, depth, obj_enemy_bullet);
	rightBullet = instance_create_depth(x, y, depth, obj_enemy_bullet);
	rightBullet.direction = rightBullet.direction - 15;
	leftBullet = instance_create_depth(x, y, depth, obj_enemy_bullet);
	leftBullet.direction = leftBullet.direction + 15;
}

if (HP <= 0 and !isDead) {
	show_debug_message("Enemy Died!")
	isDead = true;
	sprite_index = spr_enemy_dead;
}
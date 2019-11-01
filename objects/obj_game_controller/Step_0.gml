if (obj_delta.state == PlayerStates.DEAD) {
	instance_destroy(obj_delta);
	with (obj_enemy_single) {
		state = EnemyStates.IDLE;
		detectCooldownTimer = detectCooldown;
	}
	with (obj_enemy_fan) {
		state = EnemyStates.IDLE;
		detectCooldownTimer = detectCooldown;
	}
	with (obj_enemy_burst) {
		state = EnemyStates.IDLE;
		detectCooldownTimer = detectCooldown;
	}
	instance_create_depth(obj_respawn_point.x, obj_respawn_point.y, depth, obj_delta);
}

if (bulletTimeCooldownTimer > 0) {
	--bulletTimeCooldownTimer;
}

if (bulletTimeDurationTimer > 0) {
	--bulletTimeDurationTimer;
} else {
	isBulletTime = false;
}
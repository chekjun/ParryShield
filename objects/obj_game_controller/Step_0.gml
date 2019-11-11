if (bulletTimeCooldownTimer > 0) {
	--bulletTimeCooldownTimer;
}

if (bulletTimeDurationTimer > 0) {
	--bulletTimeDurationTimer;
}

if (obj_delta.state == PlayerStates.DEAD) {
	with (obj_enemy_single) {
		state = EnemyStates.IDLE;
		detectCooldownTimer = detectCooldown;
	}
	with (obj_enemy_burst) {
		state = EnemyStates.IDLE;
		detectCooldownTimer = detectCooldown;
	}
	with (obj_enemy_shotgun) {
		state = EnemyStates.IDLE;
		detectCooldownTimer = detectCooldown;
	}
	with (obj_enemy_fan) {
		state = EnemyStates.IDLE;
		detectCooldownTimer = detectCooldown;
	}
	with (obj_enemy_bullet) {
		instance_destroy();
	}
	instance_destroy(obj_delta);
	instance_create_depth(obj_respawn_point.x, obj_respawn_point.y, depth, obj_delta);
}

globalvar grid;
grid = mp_grid_create(0, 0, room_width div 32, room_height div 32, 32, 32);
mp_grid_add_instances(grid, obj_log, false);
// mp_grid_add_instances(grid, obj_tree, false);
mp_grid_add_instances(grid, obj_wall, false);
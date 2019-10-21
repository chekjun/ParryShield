if (isPaused) {
	if (keyboard_check_pressed(vk_escape)) {
		isPaused = false;
		instance_activate_all();
	} else {
		exit;
	}
} else {
	if (keyboard_check_pressed(vk_escape)) {
		isPaused = true;
		instance_deactivate_all(true);
		exit;
	}
}

player = obj_delta;

if (player.state == PlayerStates.DEAD and keyboard_check_pressed(ord("R"))) {
	instance_destroy(obj_delta);
	instance_create_depth(obj_respawn_point.x, obj_respawn_point.y, depth, obj_delta);
}

if (bulletTimeCooldownTimer > 0) {
	--bulletTimeCooldownTimer;
}

if (bulletTimeDurationTimer > 0) {
	--bulletTimeDurationTimer;
	with(obj_enemy_bullet) {
		speed = 0;
	}
} else {
	isBulletTime = false;
	with(obj_enemy_bullet) {
		speed = 3;
	}
}
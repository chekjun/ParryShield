if (instance_exists(obj_delta)) {
	player = obj_delta;
}

if (player.state == PlayerStates.DEAD and keyboard_check_pressed(ord("R"))) {
	instance_destroy(obj_delta);
	instance_create_depth(obj_respawn_point.x, obj_respawn_point.y, depth, obj_delta);
}

if (keyboard_check_pressed(ord("N")) and room_exists(current_room - 1)) {
	--current_room;
	room_goto_previous();
}

if (keyboard_check_pressed(ord("M")) and room_exists(current_room + 1)) {
	++current_room;
	room_goto_next();
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
		speed = 2.5;
	}
}
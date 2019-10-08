if (instance_exists(obj_player) and obj_player.isDead and keyboard_check_pressed(ord("R"))) {
	game_restart();
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
		speed = 2;
	}
}
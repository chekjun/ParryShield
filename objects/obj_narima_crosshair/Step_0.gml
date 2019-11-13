if (obj_game_controller.bulletTimeDurationTimer <= 0) {
	--timer;	
}

if (timer <= 0) {
	instance_create_depth(x, y, -1000, obj_narima_explosion);
	instance_create_depth(x, y, -999, obj_narima_explosion_hitbox);
	instance_destroy();
}
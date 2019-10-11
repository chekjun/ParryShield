instance_create_depth(x, y, depth, obj_player_bullet);
obj_player.parryCooldownTimer = 0;
if (obj_game_controller.bulletTimeCooldownTimer == 0) {
	obj_game_controller.bulletTimeCooldownTimer = obj_game_controller.bulletTimeCooldown;
	obj_game_controller.bulletTimeDurationTimer = obj_game_controller.bulletTimeDuration;
	obj_game_controller.isBulletTime = true;
}
instance_destroy();
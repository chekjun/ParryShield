instance_create_depth(x, y, depth, obj_effect_spark);
instance_create_depth(x, y, depth, obj_player_bullet);
health = health + 10;
other.hasParried = true;
obj_delta.parryCooldownTimer = 1;
obj_delta.energy = obj_delta.energy + 5;
if (obj_game_controller.bulletTimeCooldownTimer == 0) {
	obj_game_controller.bulletTimeCooldownTimer = obj_game_controller.bulletTimeCooldown;
	obj_game_controller.bulletTimeDurationTimer = obj_game_controller.bulletTimeDuration;
	obj_game_controller.isBulletTime = true;
}

instance_destroy();
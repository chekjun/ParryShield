instance_create_depth(x, y, depth, obj_effect_spark);
instance_create_depth(x, y, depth, obj_player_bullet);
other.hasParried = true;
obj_delta.parryCooldownTimer = 1;
health = health + 10;
obj_delta.energy = obj_delta.energy + 5;
obj_game_controller.bulletTimeDurationTimer = obj_game_controller.bulletTimeDuration;
instance_destroy();
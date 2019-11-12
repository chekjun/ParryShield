// Reload
if (shootCooldownTimer > 0 and obj_game_controller.bulletTimeDurationTimer <= 0) {
	--shootCooldownTimer;
}

switch state {
	case EnemyStates.DEAD:
		instance_destroy();
		exit;
	break;
	
	case EnemyStates.IDLE:
		path_speed = 0;
		image_index = 0;
		image_speed = 0;
		if (scr_in_view()) {
			if (detectCooldownTimer > 0) {
				--detectCooldownTimer;
			} else {
				state = EnemyStates.WALK;
			}
		}
	break;
	
	case EnemyStates.WALK:
		image_speed = 1;
		if (changePathCooldownDuration <= 0) {
			var path = path_add();
			if mp_grid_path(grid, path, x, y, obj_delta.x, obj_delta.y, true) {
				path_start(path, 1, path_action_continue, true);
			}
			
			if (direction > 45 and direction < 135) {
				facing = EnemyDirection.UP;
			} else if (direction >= 135 and direction <= 225) {
				facing = EnemyDirection.LEFT;
			} else if (direction > 225 and direction < 315) {
				facing = EnemyDirection.DOWN;
			} else if (direction >= 315 or direction <= 45) {
				facing = EnemyDirection.RIGHT;
			}

			changePathCooldownDuration = changePathCooldown;
		
		} else {
			--changePathCooldownDuration;
		}

		if (distance_to_object(obj_delta) <= shootRange) {
			path_speed = 0.5;
			if (shootCooldownTimer <= 0) {
				state = EnemyStates.ATTACK;
			}
			// move_towards_point(obj_delta.x, obj_delta.y, 0.8);
		} else {
			path_speed = 1.25;
			// move_towards_point(obj_delta.x, obj_delta.y, 1.2);
		}
	break;
	
	case EnemyStates.ATTACK:
		speed = 0;
		for (i = 0; i < 8 ; ++i) {
			if (random(100) <= 8) {
				var bullet = instance_create_depth(x, y, depth, obj_heal_bullet);
			} else {
				var bullet = instance_create_depth(x, y, depth, obj_enemy_bullet);
			}
			bullet.direction += i * 45;
			bullet.speed = 3;
		}
		shootCooldownTimer = shootCooldown;
		state = EnemyStates.WALK;
	break;
}

switch facing {
	case EnemyDirection.UP:
		sprite_index = spr_enemy_fan_up;
	break;
	case EnemyDirection.LEFT:
		sprite_index = spr_enemy_fan_left;
	break;
	case EnemyDirection.DOWN:
		sprite_index = spr_enemy_fan_down;
	break;
	case EnemyDirection.RIGHT:
		sprite_index = spr_enemy_fan_right;
	break;
}

if (obj_game_controller.bulletTimeDurationTimer > 0) {
	path_speed = 0;
}

if (HP <= 0) {
	state = EnemyStates.DEAD;
}
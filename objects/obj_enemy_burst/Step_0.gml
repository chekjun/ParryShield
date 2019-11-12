// Reload
if (shootCooldownTimer > 0 and obj_game_controller.bulletTimeDurationTimer <= 0) {
	--shootCooldownTimer;
}

// Burst timer
if (shootDurationTimer > 0 and obj_game_controller.bulletTimeDurationTimer <= 0) {
	--shootDurationTimer;
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
			path_speed = 0.7;
			if (shootCooldownTimer <= 0) {
				state = EnemyStates.ATTACK;
			}
			// move_towards_point(obj_delta.x, obj_delta.y, 0.8);
		} else {
			path_speed = 1.1;
			// move_towards_point(obj_delta.x, obj_delta.y, 1.2);
		}
		
	break;
	
	case EnemyStates.ATTACK:
		path_speed = 0;
		image_index = 0;
		image_speed = 0;
		
		var playerDir = point_direction(x, y, obj_delta.x, obj_delta.y);
		if (playerDir > 45 and playerDir < 135) {
			facing = EnemyDirection.UP;
		} else if (playerDir >= 135 and playerDir <= 225) {
			facing = EnemyDirection.LEFT;
		} else if (playerDir > 225 and playerDir < 315) {
			facing = EnemyDirection.DOWN;
		} else if (playerDir >= 315 or playerDir <= 45) {
			facing = EnemyDirection.RIGHT;
		}
			
		if (shootCooldownTimer == 0) {
			shootCooldownTimer = shootCooldown;
			burstCounter = 3;	
		}
		
		if (burstCounter > 0 and shootDurationTimer <= 0) {
			if (random(100) <= 8) {
				instance_create_depth(x, y, depth, obj_heal_bullet);
			} else {
				instance_create_depth(x, y, depth, obj_enemy_bullet);	
			}
			--burstCounter;
			shootDurationTimer = shootDuration;
		}
		
		if (burstCounter == 0) {
			state = EnemyStates.IDLE;
		}
	break;
}

		
switch facing {
	case EnemyDirection.UP:
		sprite_index = spr_enemy_burst_up;
	break;

	case EnemyDirection.LEFT:
		sprite_index = spr_enemy_burst_left;
	break;
	
	case EnemyDirection.DOWN:
		sprite_index = spr_enemy_burst_down;
	break;
	
	case EnemyDirection.RIGHT:
		sprite_index = spr_enemy_burst_right;
	break;
}

if (obj_game_controller.bulletTimeDurationTimer > 0) {
	path_speed = 0;
}

if (HP <= 0) {
	state = EnemyStates.DEAD;
}
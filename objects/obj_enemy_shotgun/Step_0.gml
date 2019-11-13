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
			path_speed = 0.6;
			if (shootCooldownTimer <= 0) {
				state = EnemyStates.ATTACK;
			}
			// move_towards_point(obj_delta.x, obj_delta.y, 0.8);
		} else {
			path_speed = 1.5;
			// move_towards_point(obj_delta.x, obj_delta.y, 1.2);
		}
	break;
	
	case EnemyStates.ATTACK:
		instance_create_depth(x, y, depth, obj_enemy_bullet);
		rightBullet = instance_create_depth(x, y, depth, obj_enemy_bullet);
		rightBullet.direction = rightBullet.direction - 10;
		leftBullet = instance_create_depth(x, y, depth, obj_enemy_bullet);
		leftBullet.direction = leftBullet.direction + 10;
		shootCooldownTimer = shootCooldown;
		state = EnemyStates.WALK;
	break;
}

switch facing {
	case EnemyDirection.UP:
		sprite_index = spr_enemy_shotgun_up;
	break;
	case EnemyDirection.LEFT:
		sprite_index = spr_enemy_shotgun_left;
	break;
	case EnemyDirection.DOWN:
		sprite_index = spr_enemy_shotgun_down;
	break;
	case EnemyDirection.RIGHT:
		sprite_index = spr_enemy_shotgun_right;
	break;
}

if (obj_game_controller.bulletTimeDurationTimer > 0) {
	path_speed = 0;
}

if (HP <= 0) {
	state = EnemyStates.DEAD;
}

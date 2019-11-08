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
		speed = 0;
		image_index = 0;
		image_speed = 0;
		if (detectCooldownTimer <= 0) {
			if (shootCooldownTimer <= 0) {
				state = EnemyStates.ATTACK;
			} else {
				state = EnemyStates.WALK;
			}
		} else {
			var camera = view_camera[0];
			if (point_in_rectangle(x, y,
					camera_get_view_x(camera) + 16,
					camera_get_view_y(camera) + 16,
					camera_get_view_x(camera) + camera_get_view_width(camera) - 16,
					camera_get_view_y(camera) + camera_get_view_height(camera) - 16)) {
				--detectCooldownTimer
			}
		}
	break;
	
	case EnemyStates.WALK:
		image_speed = 1;
		if (shootCooldownTimer <= 0) {
				state = EnemyStates.ATTACK;
		} else if (obj_game_controller.bulletTimeDurationTimer > 0) {
				state = EnemyStates.IDLE;
		} else if (distance_to_object(obj_delta) > shootRange) {
			direction = point_direction(x, y, obj_delta.x, obj_delta.y) + random_range(-25, 25);
			speed = 2;
		}
	break;
	
	case EnemyStates.ATTACK:
		instance_create_depth(x, y, depth, obj_enemy_bullet);
		rightBullet = instance_create_depth(x, y, depth, obj_enemy_bullet);
		rightBullet.direction = rightBullet.direction - 15;
		leftBullet = instance_create_depth(x, y, depth, obj_enemy_bullet);
		leftBullet.direction = leftBullet.direction + 15;
		shootCooldownTimer = shootCooldown;
		state = EnemyStates.IDLE;
	break;
}

if (HP <= 0) {
	instance_destroy();
	state = EnemyStates.DEAD;
}

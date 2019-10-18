// Reload
if (shootCooldownTimer > 0 and obj_game_controller.bulletTimeDurationTimer <= 0) {
	--shootCooldownTimer;
}

switch state {
	case EnemyStates.DEAD:
		sprite_index = spr_enemy_dead;
		exit;
	break;
	
	case EnemyStates.IDLE:
		if (abs(obj_delta.x - x) < (room_width / 2) and abs(obj_delta.y - y) < (room_height / 2)) {
			if (detectCooldownTimer <= 0) {
				state = PlayerStates.WALK;
			}
			if (!collision_line(x, y, obj_delta.x, obj_delta.y, obj_wall, true, true)
				and distance_to_object(obj_delta) <= detectionRange
				and detectCooldownTimer > 0) {
				--detectCooldownTimer;
			} else if (detectCooldownTimer < detectCooldown) {
				++detectCooldownTimer;
			}
		}
	break;
	
	case EnemyStates.WALK:
		if (abs(obj_delta.x - x) > (room_width / 2) or abs(obj_delta.y - y) > (room_height / 2) or health <= 0) {
			speed = 0;
			state = EnemyStates.IDLE;
		} else if (distance_to_object(obj_delta) < 75) {
			move_towards_point(obj_delta.x, obj_delta.y, -0.5);
		} else if (distance_to_object(obj_delta) > 125) {
			move_towards_point(obj_delta.x, obj_delta.y, 0.5);
		} else {
			if (shootCooldownTimer <= 0) {
				speed = 0;
				state = EnemyStates.ATTACK;
			}
		}
	break;
	
	case EnemyStates.ATTACK:
		instance_create_depth(x, y, depth, obj_enemy_bullet);
		shootCooldownTimer = shootCooldown;
		state = EnemyStates.WALK;
	break;
}

if (HP <= 0) {
	speed = 0;
	state = EnemyStates.DEAD;
}
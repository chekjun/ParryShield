// Reload
if (shootCooldownTimer > 0 and obj_game_controller.bulletTimeDurationTimer <= 0) {
	--shootCooldownTimer;
}

switch state {
	case EnemyStates.DEAD:
		speed = 0;
		sprite_index = spr_enemy_dead;
		exit;
	break;
	
	case EnemyStates.IDLE:
		speed = 0;
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
		if (health <= 0) {
			state = EnemyStates.IDLE;
		}
		if (distance_to_object(obj_delta) < 50) {
			move_towards_point(obj_delta.x, obj_delta.y, -1);
		} else if (distance_to_object(obj_delta) > 150) {
			move_towards_point(obj_delta.x, obj_delta.y, 1);
		} else {
			if (shootCooldownTimer <= 0) {
				state = EnemyStates.ATTACK;		
			}
		}
	break;
	
	case EnemyStates.ATTACK:
		speed = 0;
		instance_create_depth(x, y, depth, obj_enemy_bullet);
		shootCooldownTimer = shootCooldown;
		state = EnemyStates.WALK;
	break;
}

if (HP <= 0) {
	state = EnemyStates.DEAD;
}
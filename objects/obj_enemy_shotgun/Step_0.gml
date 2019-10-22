// Reload
if (shootCooldownTimer > 0 and obj_game_controller.bulletTimeDurationTimer <= 0) {
	--shootCooldownTimer;
}

switch state {
	case EnemyStates.DEAD:
		mask_index = spr_enemy_dead_hitbox;
		sprite_index = spr_enemy_dead;
		exit;
	break;
	
	case EnemyStates.IDLE:
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
	break;
	
	case EnemyStates.WALK:
		if (abs(obj_delta.x - x) > (chaseRangeLimit) or abs(obj_delta.y - y) > (chaseRangeLimit) or health <= 0) {
			speed = 0;
			state = EnemyStates.IDLE;
		} else if (distance_to_object(obj_delta) < retreatRange) {
			move_towards_point(obj_delta.x, obj_delta.y, -1);
		} else if (distance_to_object(obj_delta) > advanceRange) {
			move_towards_point(obj_delta.x, obj_delta.y, 1);
		} else {
			if (shootCooldownTimer <= 0) {
				speed = 0;
				state = EnemyStates.ATTACK;
			}
		}
	break;
	
	case EnemyStates.ATTACK:
		instance_create_depth(x, y, depth, obj_enemy_bullet);
		rightBullet = instance_create_depth(x, y, depth, obj_enemy_bullet);
		rightBullet.direction = rightBullet.direction - 15;
		leftBullet = instance_create_depth(x, y, depth, obj_enemy_bullet);
		leftBullet.direction = leftBullet.direction + 15;
		shootCooldownTimer = shootCooldown;
		state = EnemyStates.WALK;
	break;
}

if (HP <= 0) {
	speed = 0;
	state = EnemyStates.DEAD;
}
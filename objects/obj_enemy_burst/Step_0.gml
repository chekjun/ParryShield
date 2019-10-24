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
		} else if (distance_to_object(obj_delta) > advanceRange) {
			move_towards_point(obj_delta.x, obj_delta.y, 0.5);
		} else {
			if (shootCooldownTimer <= 0) {
				speed = 0;
				state = EnemyStates.ATTACK;
			}
		}
	break;
	
	case EnemyStates.ATTACK:
		if (shootCooldownTimer == 0) {
			shootCooldownTimer = shootCooldown;
			burstCounter = 3;	
		}
		
		if (burstCounter > 0 and shootDurationTimer <= 0) {
			instance_create_depth(x, y, depth, obj_enemy_bullet);
			--burstCounter;
			shootDurationTimer = shootDuration;
		}
		
		if (burstCounter == 0) {
			state = EnemyStates.WALK;
		}

	break;
}

if (HP <= 0) {
	speed = 0;
	state = EnemyStates.DEAD;
}
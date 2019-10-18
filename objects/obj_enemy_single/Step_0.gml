if (isDead) {
	exit;
}

switch alert {
	case EnemyStates.DEAD:
		sprite_index = spr_enemy_dead;
		exit;
	break;
	
	case EnemyStates.PASSIVE:
		if (rectangle_in_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, bview_xview[0], view_yview[0], view_xview[0] + view_wview[0], view_yview[0] + view_hview[0])) {
			if (!collision_line(x, y, obj_delta.x, obj_delta.y, obj_wall, true, true)
				and distance_to_object(obj_delta) <= detectionRange
				and detectCooldownTimer > 0) {
				--detectCooldownTimer;
			} else if (detectCooldownTimer < detectCooldown) {
				++detectCooldownTimer;
			}
		} else {
			// Put randomised movement here
		}
	break;
	
	case EnemyStates.ALERT:
		if (distance_to_object(obj_delta) < 50) {
			move_towards_point(obj_delta.x, obj_delta.y, -2)
		}
		if (distance_to_object(obj_delta) > 150) {
			move_towards_point(obj_delta.x, obj_delta.y, 2);
		}
	break;
}



if (shootCooldownTimer > 0 and obj_game_controller.bulletTimeDurationTimer <= 0) {
	--shootCooldownTimer;
}

if (detectCooldownTimer == 0 and shootCooldownTimer == 0 and obj_game_controller.bulletTimeDurationTimer <= 0) {
	shootCooldownTimer = shootCooldown;
	instance_create_depth(x, y, depth, obj_enemy_bullet);
}

if (health <= 0) {
	state = EnemyStates.PASSIVE;
}

if (HP <= 0) {
	state = EnemyStates.DEAD;
}
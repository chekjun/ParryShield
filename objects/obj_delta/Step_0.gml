scr_cooldown();
scr_get_player_input();

switch state {
	case PlayerStates.DEAD:
		exit;
	break;
	
	case PlayerStates.IDLE:
		scr_idle_anim();
		
		// Idle to Parry
		if (key_parry and parryCooldownTimer <= 0) {
			parryCooldownTimer = parryCooldown;
			parryDurationTimer = parryDuration;
			instance_create_depth(
				x + lengthdir_x(24, point_direction(x, y, mouse_x, mouse_y)),
				y + lengthdir_y(24, point_direction(x, y, mouse_x, mouse_y)),
				depth,
				obj_parry
			);
			lookingAngle = point_direction(x, y, mouse_x, mouse_y);
			if (lookingAngle > 45 and lookingAngle < 135) {
				facing = PlayerDirections.UP;
			} else if (lookingAngle >= 135 and lookingAngle <= 225) {
				facing = PlayerDirections.LEFT;
			} else if (lookingAngle > 225 and lookingAngle < 315) {
				facing = PlayerDirections.DOWN;
			} else if (lookingAngle >= 315 or lookingAngle <= 45) {
				facing = PlayerDirections.RIGHT;
			}
			state = PlayerStates.PARRY;
			break;
		}
		
		// Idle to Shoot
		if (key_shoot and shootCooldownTimer <= 0 and energy >= 50) {
			show_debug_message("Shoot Triggered!");
			instance_create_depth(x, y, depth, obj_delta_bullet);
			shootCooldownTimer = shootCooldown;
			shootDurationTimer = shootDuration;
			energy = energy - 50;
			state = PlayerStates.SHOOT;
			break;
		}
		
		// Idle to Walk
		if (key_right - key_left != 0 or key_down - key_up != 0) {
			state = PlayerStates.WALK;
			break;
		}	
	break;
	
	case PlayerStates.WALK:
		// Check Walk Direction
		if (key_left) {
			facing = PlayerDirections.LEFT;
		} else if (key_right) {
			facing = PlayerDirections.RIGHT;
		} else if (key_up){
			facing = PlayerDirections.UP;
		} else if (key_down) {
			facing = PlayerDirections.DOWN;
		}
		
		// Walk Animation
		scr_walk_anim();
		
		// Walk
		horizontalSpeed = (key_right - key_left) * moveSpeed;
		verticalSpeed = (key_down - key_up) * moveSpeed;
		scr_delta_move(horizontalSpeed, verticalSpeed);
	
		// Walk to Parry
		if (key_parry and parryCooldownTimer <= 0) {
			show_debug_message("Parry Triggered!");
			parryCooldownTimer = parryCooldown;
			parryDurationTimer = parryDuration;
			instance_create_depth(
				x + lengthdir_x(24, point_direction(x, y, mouse_x, mouse_y)),
				y + lengthdir_y(24, point_direction(x, y, mouse_x, mouse_y)),
				depth,
				obj_parry
			);
			lookingAngle = point_direction(x, y, mouse_x, mouse_y);
			if (lookingAngle > 45 and lookingAngle < 135) {
				facing = PlayerDirections.UP;
			} else if (lookingAngle >= 135 and lookingAngle <= 225) {
				facing = PlayerDirections.LEFT;
			} else if (lookingAngle > 225 and lookingAngle < 315) {
				facing = PlayerDirections.DOWN;
			} else if (lookingAngle >= 315 or lookingAngle <= 45) {
				facing = PlayerDirections.RIGHT;
			}
			state = PlayerStates.PARRY;
			break;
		}
		
		// Walk to Shoot
		if (key_shoot and shootCooldownTimer <= 0 and energy >= 50) {
			show_debug_message("Shoot Triggered!");
			instance_create_depth(x, y, depth, obj_delta_bullet);
			shootCooldownTimer = shootCooldown;
			shootDurationTimer = shootDuration;
			energy = energy - 50;
			state = PlayerStates.SHOOT;
			break;
		}
		
		// Walk to Roll
		if (key_roll and rollCooldownTimer <= 0) {
			show_debug_message("Roll Triggered!");
			rollCooldownTimer = rollCooldown;
			rollDurationTimer = rollDuration;
			horizontalSpeed = (key_right - key_left) * moveSpeed * moveSpeed;
			verticalSpeed = (key_down - key_up) * moveSpeed * moveSpeed;
			state = PlayerStates.ROLL;
			break;
		}
		
		// Walk to Idle
		if (key_right - key_left == 0 and key_down - key_up == 0) {
			state = PlayerStates.IDLE;
			break;
		}
	break;
	
	case PlayerStates.ROLL:
		scr_roll_anim();
	
		if (rollDurationTimer > 0) {
			--rollDurationTimer;	
			// Roll
			scr_delta_move(horizontalSpeed, verticalSpeed);
		} else {
			state = PlayerStates.IDLE;
		}
	break;
	
	case PlayerStates.SHOOT:
		if (shootDurationTimer > 0) {
			--shootDurationTimer;
		} else {
			state = PlayerStates.IDLE;
		}
	break;
	
	case PlayerStates.PARRY:
		scr_parry_anim();
		if (parryDurationTimer > 0) {
			--parryDurationTimer;
			if (key_parry and parryCooldownTimer == 0) {
				parryCooldownTimer = parryCooldown;
				parryDurationTimer = parryDuration;
				lookingAngle = point_direction(x, y, mouse_x, mouse_y);
				if (lookingAngle > 45 and lookingAngle < 135) {
					facing = PlayerDirections.UP;
				} else if (lookingAngle >= 135 and lookingAngle <= 225) {
					facing = PlayerDirections.LEFT;
				} else if (lookingAngle > 225 and lookingAngle < 315) {
					facing = PlayerDirections.DOWN;
				} else if (lookingAngle >= 315 or lookingAngle <= 45) {
					facing = PlayerDirections.RIGHT;
				}
				image_index = 0;
			}
		} else {
			state = PlayerStates.IDLE;
		}
	break;
}

if (health <= 0) {
	state = PlayerStates.DEAD;
}

if (health > 100) {
	health = 100;
}

if (energy < 0) {
	energy = 0;
}

if (energy > 100) {
	energy = 100;
}
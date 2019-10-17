if (rollCooldownTimer > 0) {
	--rollCooldownTimer;
}
if (shootCooldownTimer > 0) {
	--shootCooldownTimer;
}
if (parryCooldownTimer > 0) {
	--parryCooldownTimer;
}

// Get Player Input
key_up = keyboard_check(ord("W"));
key_left = keyboard_check(ord("A"));
key_down = keyboard_check(ord("S"));
key_right = keyboard_check(ord("D"));
key_roll = keyboard_check_pressed(vk_space);
key_shoot = mouse_check_button_pressed(mb_left);
key_parry = mouse_check_button_pressed(mb_right);
key_shield = mouse_check_button(mb_right);

switch state {
	case PlayerStates.DEAD:
		if (keyboard_check_pressed(ord("R"))) {
			room_restart();
		}
		exit;
	break;
	case PlayerStates.IDLE:
		hspeed = 0;
		vspeed = 0;
		if (key_shoot and shootCooldownTimer <= 0 and energy > 0) {
			show_debug_message("Shoot Triggered!");
			instance_create_depth(x, y, depth, obj_player_bullet);
			shootCooldownTimer = shootCooldown;
			shootDurationTimer = shootDuration;
			energy = energy - 50;
			break;
		}
		if (key_parry and parryCooldownTimer <= 0) {
			parryDurationTimer = parryDuration;
			instance_create_depth(
				x + lengthdir_x(24, point_direction(x, y, mouse_x, mouse_y)),
				y + lengthdir_y(24, point_direction(x, y, mouse_x, mouse_y)),
				depth,
				obj_parry
			);
			lookingAngle = point_direction(x, y, mouse_x, mouse_y);
			if (lookingAngle > 45 and lookingAngle < 135) {
				sprite_index = spr_delta_parry_up;
				facing = PlayerDirections.UP;
			} else if (lookingAngle >= 135 and lookingAngle <= 225) {
				sprite_index = spr_delta_parry_left;
				facing = PlayerDirections.LEFT;
			} else if (lookingAngle > 225 and lookingAngle < 315) {
				sprite_index = spr_delta_parry_down;
				facing = PlayerDirections.DOWN;
			} else if (lookingAngle >= 315 or lookingAngle <= 45) {
				sprite_index = spr_delta_parry_right;
				facing = PlayerDirections.RIGHT;
			}
			state = PlayerStates.PARRY;
			break;
		}
		if (key_right - key_left != 0 or key_down - key_up != 0) {
			state = PlayerStates.WALK;
		}
		
		if (facing == PlayerDirections.UP) sprite_index = spr_delta_idle_up;
		else if (facing == PlayerDirections.LEFT) sprite_index = spr_delta_idle_left;
		else if (facing == PlayerDirections.DOWN) sprite_index = spr_delta_idle_down;
		else if (facing == PlayerDirections.RIGHT) sprite_index = spr_delta_idle_right;
		
	break;
	case PlayerStates.WALK:
		if (key_roll and rollCooldownTimer <= 0) {
			show_debug_message("Roll Triggered!");
			rollDurationTimer = rollDuration;
			if (facing == PlayerDirections.UP) sprite_index = spr_delta_roll_up;
			else if (facing == PlayerDirections.LEFT) sprite_index = spr_delta_roll_left;
			else if (facing == PlayerDirections.DOWN) sprite_index = spr_delta_roll_down;
			else if (facing == PlayerDirections.RIGHT) sprite_index = spr_delta_roll_right;
			state = PlayerStates.ROLL;
			break;
		}
		if (key_shoot and shootCooldownTimer <= 0 and energy > 0) {
			show_debug_message("Shoot Triggered!");
			instance_create_depth(x, y, depth, obj_player_bullet);
			shootCooldownTimer = shootCooldown;
			shootDurationTimer = shootDuration;
			energy = energy - 50;
			break;
		}
		if (key_parry and parryCooldownTimer <= 0) {
			show_debug_message("Parry Triggered!");
			parryDurationTimer = parryDuration;
			instance_create_depth(
				x + lengthdir_x(24, point_direction(x, y, mouse_x, mouse_y)),
				y + lengthdir_y(24, point_direction(x, y, mouse_x, mouse_y)),
				depth,
				obj_parry
			);
			lookingAngle = point_direction(x, y, mouse_x, mouse_y);
			if (lookingAngle > 45 and lookingAngle < 135) {
				sprite_index = spr_delta_parry_up;
			} else if (lookingAngle >= 135 and lookingAngle <= 225) {
				sprite_index = spr_delta_parry_left;
			} else if (lookingAngle > 225 and lookingAngle < 315) {
				sprite_index = spr_delta_parry_down;
			} else if (lookingAngle >= 315 or lookingAngle <= 45) {
				sprite_index = spr_delta_parry_right;
			}
			state = PlayerStates.PARRY;
			break;
		}
		if (key_right - key_left == 0 and key_down - key_up == 0) {
			state = PlayerStates.IDLE;
			break;
		}
		
		hspeed = (key_right - key_left) * moveSpeed;
		vspeed = (key_down - key_up) * moveSpeed;
		if (hspeed != 0 and vspeed != 0) {
			hspeed = hspeed * (sqrt(2) / 2);
			vspeed = vspeed * (sqrt(2) / 2);
		}
		if (place_meeting(x + hspeed, y, obj_wall)) {
			while (!place_meeting(x + sign(hspeed), y, obj_wall)) {
				x = x + sign(hspeed);
			}
			hspeed = 0;
		}
		if (place_meeting(x, y + vspeed, obj_wall)) {
				while (!place_meeting(x, y + sign(vspeed), obj_wall)) {
				y = y + sign(vspeed);
			}
			vspeed = 0;
		}
		
		if (key_left) {
			sprite_index = spr_delta_walk_left;
			facing = PlayerDirections.LEFT;
		} else if (key_right) {
			sprite_index = spr_delta_walk_right;
			facing = PlayerDirections.RIGHT;
		} else if (key_up){
			sprite_index = spr_delta_walk_up;
			facing = PlayerDirections.UP;
		} else if (key_down) {
			sprite_index = spr_delta_walk_down;
			facing = PlayerDirections.DOWN;
		}

	break;
	case PlayerStates.ROLL:
		if (rollDurationTimer > 0) {
			show_debug_message(rollDurationTimer);
			--rollDurationTimer;
			hspeed = (key_right - key_left) * rollSpeed;
			vspeed = (key_down - key_up) * rollSpeed;
			if (hspeed != 0 and vspeed != 0) {
				hspeed = hspeed * (sqrt(2) / 2);
				vspeed = vspeed * (sqrt(2) / 2);
			}
			if (place_meeting(x + hspeed, y, obj_wall)) {
				while (!place_meeting(x + sign(hspeed), y, obj_wall)) {
					x = x + sign(hspeed);
				}
				hspeed = 0;
			}
			if (place_meeting(x, y + vspeed, obj_wall)) {
					while (!place_meeting(x, y + sign(vspeed), obj_wall)) {
					y = y + sign(vspeed);
				}
				vspeed = 0;
			}
		} else {
			show_debug_message("ROLL OVER");
			rollCooldownTimer = rollCooldown;
			hspeed = 0;
			vspeed = 0;
			state = PlayerStates.IDLE;
		}
	break;
	case PlayerStates.SHOOT:
		hspeed = 0;
		vspeed = 0;
	break;
	case PlayerStates.PARRY:
		hspeed = 0;
		vspeed = 0;
		if (parryDurationTimer > 0) {
			--parryDurationTimer;
		} else {
			parryCooldownTimer = parryCooldown;
			state = PlayerStates.IDLE;
		}
	break;
}

if (health <= 0) {
	state = PlayerStates.DEAD;
}
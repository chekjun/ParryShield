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
		if (key_shoot) {
			
			break;
		}
		if (key_parry) {
			
			break;
		}
		if (key_right - key_left != 0 or key_down - key_up != 0) {
			state = PlayerStates.WALK;
		}
		
		if (facing == PlayerDirections.UP) {
			sprite_index = spr_delta_idle_up;
		} else if (facing == PlayerDirections.LEFT) {
			sprite_index = spr_delta_idle_left;
		} else if (facing == PlayerDirections.DOWN) {
			sprite_index = spr_delta_idle_down;
		} else if (facing == PlayerDirections.RIGHT) {
			sprite_index = spr_delta_idle_right;
		}
	break;
	case PlayerStates.WALK:
		if (key_shoot) {
			break;
		}
		if (key_parry) {
			break;
		}
		if (key_right - key_left == 0 and key_down - key_up == 0) {
			state = PlayerStates.IDLE;
			break;
		}
		if (key_roll) {
			state = PlayerStates.ROLL;
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
	break;
	case PlayerStates.SHOOT:
	
	break;
	case PlayerStates.PARRY:
	
	break;
}

if (health <= 0) {
	state = PlayerStates.DEAD;
}
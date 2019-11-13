scr_cooldown();
scr_get_player_input();

switch state {
	case PlayerStates.DEAD:
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
			scr_look_at_mouse();
			audio_play_sound(snd_shield_swing, 1, false);
			state = PlayerStates.PARRY;
			break;
		}
		
		// Idle to Shoot
		if (key_shoot and shootCooldownTimer <= 0 and energy >= 100) {
			show_debug_message("Shoot Triggered!");
			shootCooldownTimer = shootCooldown;
			shootDurationTimer = shootDuration;
			chargingDurationTimer = chargingDuration;
			energy = energy - 100;
			scr_look_at_mouse();
			audio_play_sound(snd_delta_charging, 1, false);
			state = PlayerStates.SHOOT;
			break;
		}
		
		// Idle to Walk
		if (key_right - key_left != 0 or key_down - key_up != 0) {
			state = PlayerStates.WALK;
			audio_play_sound(snd_step_grass, 1, true);
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
			scr_look_at_mouse();
			audio_stop_sound(snd_step_grass);
			audio_play_sound(snd_shield_swing, 1, false);
			state = PlayerStates.PARRY;
			break;
		}
		
		// Walk to Shoot
		if (key_shoot and shootCooldownTimer <= 0 and energy >= 100) {
			show_debug_message("Shoot Triggered!");
			shootCooldownTimer = shootCooldown;
			shootDurationTimer = shootDuration;
			chargingDurationTimer = chargingDuration;
			energy = energy - 100;
			scr_look_at_mouse();
			audio_stop_sound(snd_step_grass);
			audio_play_sound(snd_delta_charging, 1, false);
			state = PlayerStates.SHOOT;
			break;
		}
		
		// Walk to Roll
		if (key_roll and rollCooldownTimer <= 0) {
			show_debug_message("Roll Triggered!");
			rollCooldownTimer = rollCooldown;
			rollDurationTimer = rollDuration;
			horizontalSpeed = horizontalSpeed * moveSpeed;
			verticalSpeed = verticalSpeed * moveSpeed;
			audio_stop_sound(snd_step_grass);
			state = PlayerStates.ROLL;
			break;
		}
		
		// Walk to Idle
		if (key_right - key_left == 0 and key_down - key_up == 0) {
			audio_stop_sound(snd_step_grass);
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
		scr_shoot_anim();
		obj_game_controller.bulletTimeDurationTimer = 2;
		--chargingDurationTimer;	
		show_debug_message(chargingDurationTimer);
		if(chargingDurationTimer == 0) {
			instance_create_depth(x, y, depth, obj_delta_bullet);
			audio_play_sound(snd_delta_shot, 1, false);
		}
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
				scr_look_at_mouse();
				audio_stop_sound(snd_shield_swing);
				audio_play_sound(snd_shield_swing, 1, false);
				image_index = 0;
			}
		} else {
			state = PlayerStates.IDLE;
		}
	break;
}

if (health <= 0) {
	health = 0;
	sprite_index = spr_delta_idle_down;
	audio_stop_sound(snd_delta_charging);
	audio_stop_sound(snd_delta_shot);
	audio_stop_sound(snd_shield_swing);
	audio_stop_sound(bgm_loop);
	audio_stop_sound(bgm_boss);
	state = PlayerStates.DEAD;
}

if (health >= 100) {
	health = 100;
}

if (energy <= 0) {
	energy = 0;
}

if (energy >= 100) {
	energy = 100;
}
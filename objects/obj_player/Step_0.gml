if (isDead) {
	exit;
}

var lookingAngle = point_direction(x, y, mouse_x, mouse_y);

// Walking Animation
if (key_left) {
	sprite_index = spr_playerA;
} else if (key_right) {
	sprite_index = spr_playerD;
} else if (key_up){
	sprite_index = spr_playerW;
} else if (key_down) {
	sprite_index = spr_playerS;
}

// Calculate Player Movement
horizontalSpeed = (key_right - key_left) * moveSpeed;
verticalSpeed = (key_down - key_up) * moveSpeed;
if (horizontalSpeed != 0 and verticalSpeed != 0) {
	horizontalSpeed = horizontalSpeed * round(sqrt(2) / 2);
	verticalSpeed = verticalSpeed * round(sqrt(2) / 2);
}

if (place_meeting(x + horizontalSpeed, y, obj_wall)) {
	while (!place_meeting(x + sign(horizontalSpeed), y, obj_wall)) {
		x = x + sign(horizontalSpeed);
	}
	horizontalSpeed = 0;
}

if (place_meeting(x, y + verticalSpeed, obj_wall)) {
		while (!place_meeting(x, y + sign(verticalSpeed), obj_wall)) {
		y = y + sign(verticalSpeed);
	}
	verticalSpeed = 0;
}

x = x + horizontalSpeed;
y = y + verticalSpeed;

// Dash
if (key_dash and dashCooldown == 0) {
	show_debug_message("Dash Triggered!");
	isDashing = true;
	dashCooldown = 200;
	dashDuration = 20;
	dashX = horizontalSpeed * dashSpeed;
	dashY = verticalSpeed * dashSpeed;
	if (dashX != 0 and dashY != 0) {
		dashX = dashX * round(sqrt(2) / 2);
		dashY = dashY * round(sqrt(2) / 2);
	}
}

// Shoot
if (key_shoot and
	!isDashing and
	!isParrying and
	!isBlocking and
	shootCooldown == 0 and
	distance_to_point(mouse_x, mouse_y) > round(sqrt(16 * 16 + 16 * 16))) {
	show_debug_message("Shoot Triggered!");
	isShooting = true;
	shootCooldown = 50;
	shootDuration = 50;
	instance_create_depth(
		x + lengthdir_x(16, lookingAngle),
		y + lengthdir_y(16, lookingAngle),
		depth,
		obj_player_bullet);
}

// Parry
if (key_parry) {
	if (parryCooldown == 0) {
		show_debug_message("Parry Triggered!");
		isParrying = true;
		parryCooldown = 100;
		parryDuration = 25;
		if (key_shield and (parryDuration > 0 or MP > 0) and !instance_exists(obj_shield)) {
			instance_create_depth(
			x + lengthdir_x(16, point_direction(x, y, mouse_x, mouse_y)),
			y + lengthdir_y(16, point_direction(x, y, mouse_x, mouse_y)),
			depth,
			obj_parry
			); 	
		}
		
		// Parry Animation
		if (lookingAngle > 45 and lookingAngle < 135) {
			show_debug_message("PARRY UP");
			sprite_index = spr_player_parry_up;
		} else if (lookingAngle >= 135 and lookingAngle <= 225) {
			show_debug_message("PARRY LEFT");
			sprite_index = spr_player_parry_left;
		} else if (lookingAngle > 225 and lookingAngle < 315) {
			show_debug_message("PARRY DOWN");
			sprite_index = spr_player_parry_down;
		} else if (lookingAngle >= 315 or lookingAngle <= 45) {
			show_debug_message("PARRY RIGHT");
			sprite_index = spr_player_parry_right;
		} else {
			show_debug_message(lookingAngle);
		}
	}
}

// Shield
if (key_shield) {
	if (parryDuration <= 0 and MP > 0 and !instance_exists(obj_shield)) {
		isBlocking = true;
		instance_create_depth(
			x + lengthdir_x(16, point_direction(x, y, mouse_x, mouse_y)),
			y + lengthdir_y(16, point_direction(x, y, mouse_x, mouse_y)),
			depth,
			obj_shield
			); 		
	}
} else {
	isBlocking = false;
}


if (isDead) {
	if (keyboard_check_pressed(vk_enter)) {
		room_goto_next();
	}
	exit;
}

if (detectCooldownTimer == 0 and shootCooldownTimer == 0) {
	var playerDirection = point_direction(x, y, obj_player_parry_only.x, obj_player_parry_only.y)
	var bullet = instance_create_depth(
		x + lengthdir_x(16, playerDirection),
		y + lengthdir_y(16, playerDirection),
		depth,
		obj_enemy_bullet);
	bullet.direction = point_direction(bullet.x, bullet.y, obj_player_parry_only.x, obj_player_parry_only.y);
	bullet.speed = 2;
	shootCooldownTimer = shootCooldown;
}
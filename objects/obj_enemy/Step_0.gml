if (isDead) {
	exit;
}

if (shootCooldown == 0 and instance_exists(obj_player) and !collision_line(x, y, obj_player.x, obj_player.y, obj_wall, true, true) and distance_to_object(obj_player) < 300) {
	shootCooldown = 250;
	var bullet = instance_create_depth(
		x + lengthdir_x(16, point_direction(x, y, obj_player.x, obj_player.y)),
		y + lengthdir_y(16, point_direction(x, y, obj_player.x, obj_player.y)),
		depth,
		obj_enemy_bullet);
	bullet.direction = point_direction(bullet.x, bullet.y, obj_player.x, obj_player.y);
	bullet.speed = 5;
}
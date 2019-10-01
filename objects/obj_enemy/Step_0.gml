if (isDead) {
	exit;
}

if (instance_exists(obj_player) and shootCooldown == 0) {
	shootCooldown = 250;
	var bullet = instance_create_depth(
		x + lengthdir_x(40, point_direction(x, y, obj_player.x, obj_player.y)),
		y + lengthdir_y(40, point_direction(x, y, obj_player.x, obj_player.y)),
		depth,
		obj_bullet);
	bullet.direction = point_direction(bullet.x, bullet.y, obj_player.x, obj_player.y);
	bullet.speed = 5;
}

if (shootCooldown > 0) {
	--shootCooldown;
}
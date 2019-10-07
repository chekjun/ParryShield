if (key_shield and energy >= 0 and !instance_exists(obj_shield)) {
	isBlocking = true;
	instance_create_depth(
		x + lengthdir_x(24, point_direction(x, y, mouse_x, mouse_y)),
		y + lengthdir_y(24, point_direction(x, y, mouse_x, mouse_y)),
		depth,
		obj_shield);
} else {
	isBlocking = false;
}
if (collision_circle(x, y, 16, obj_wall, true, true)) {
	instance_destroy();
}

numberOfBounces = 1;
direction = point_direction(x, y, mouse_x, mouse_y);
speed = 2;
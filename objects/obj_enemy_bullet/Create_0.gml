if (collision_circle(x, y, 16, obj_wall, true, true)) {
	instance_destroy();
}

numberOfBounces = 2;
direction = point_direction(x, y, obj_delta.x, obj_delta.y);
speed = 3;
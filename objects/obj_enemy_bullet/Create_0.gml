if (collision_circle(x, y, 16, obj_wall, true, true)) {
	instance_destroy();
}

numberOfBounces = 2;
direction = point_direction(x, y, obj_player.x, obj_player.y);
speed = 3;
if (instance_exists(obj_player)) {
	player = obj_player;
} else {
	player = obj_delta;
}

if (player.parryDurationTimer == 0) {
	show_debug_message("Parry Over!");
	instance_destroy();
}

playerX = player.x;
playerY = player.y;

x = playerX + lengthdir_x(24, point_direction(playerX, playerY, mouse_x, mouse_y));
y = playerY + lengthdir_y(24, point_direction(playerX, playerY, mouse_x, mouse_y));
image_angle = point_direction(playerX, playerY, mouse_x, mouse_y);
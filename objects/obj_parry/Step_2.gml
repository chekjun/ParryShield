if (obj_player.parryDurationTimer == 0) {
	show_debug_message("Parry Over!");
	instance_destroy();
}

playerX = obj_player.x;
playerY = obj_player.y;

x = playerX + lengthdir_x(24, point_direction(playerX, playerY, mouse_x, mouse_y));
y = playerY + lengthdir_y(24, point_direction(playerX, playerY, mouse_x, mouse_y));
image_angle = point_direction(playerX, playerY, mouse_x, mouse_y);
if (obj_player.key_shield == 0 or obj_player.MP <= 0) {
	show_debug_message("Shield Retracted!");
	instance_destroy();
}

playerX = obj_player.x;
playerY = obj_player.y;

x = playerX + lengthdir_x(20, point_direction(playerX, playerY, mouse_x, mouse_y));
y = playerY + lengthdir_y(20, point_direction(playerX, playerY, mouse_x, mouse_y));
image_angle = point_direction(playerX, playerY, mouse_x, mouse_y);
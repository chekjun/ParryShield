playerX = obj_player.x;
playerY = obj_player.y;

x = playerX + lengthdir_x(16, point_direction(playerX, playerY, mouse_x, mouse_y));
y = playerY + lengthdir_y(16, point_direction(playerX, playerY, mouse_x, mouse_y));
image_angle = point_direction(playerX, playerY, mouse_x, mouse_y);

if (obj_player.parryDuration == 0) {
	show_debug_message("Parry Over!");
	instance_destroy();
}
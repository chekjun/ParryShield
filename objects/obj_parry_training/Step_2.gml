player = obj_player_parry_only;

if (player.parryDurationTimer == 0) {
	show_debug_message("Parry Over!");
	instance_destroy();
}

x = player.x + lengthdir_x(24, point_direction(player.x, player.y, mouse_x, mouse_y));
y = player.y + lengthdir_y(24, point_direction(player.x, player.y, mouse_x, mouse_y));
image_angle = point_direction(player.x, player.y, mouse_x, mouse_y);
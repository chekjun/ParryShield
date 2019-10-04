player = obj_player_block_only;

if (player.key_shield == 0 or player.energy <= 0) {
	show_debug_message("Shield Retracted!");
	instance_destroy();
}

x = player.x + lengthdir_x(24, point_direction(player.x, player.y, mouse_x, mouse_y));
y = player.y + lengthdir_y(24, point_direction(player.x, player.y, mouse_x, mouse_y));
image_angle = point_direction(player.x, player.y, mouse_x, mouse_y);
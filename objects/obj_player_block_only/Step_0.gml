scr_get_player_input();
if (key_shield and energy >= 0 and !instance_exists(obj_shield_training)) {
	isBlocking = true;
	instance_create_depth(
		x + lengthdir_x(24, point_direction(x, y, mouse_x, mouse_y)),
		y + lengthdir_y(24, point_direction(x, y, mouse_x, mouse_y)),
		depth,
		obj_shield_training);
} else {
	isBlocking = false;
}

if (energy <= 0 and keyboard_check_pressed(vk_enter)) {
	room_goto_next();
}
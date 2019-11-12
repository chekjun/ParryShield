if (isPaused) {
	//x = camera_get_view_x(view_camera[0]) + 0.5 * camera_get_view_width(view_camera[0]);
	//y = camera_get_view_y(view_camera[0]) + 0.4 * camera_get_view_height(view_camera[0]);

	menu_move =
		(keyboard_check_pressed(ord("S")) or keyboard_check_pressed(vk_down) or
		keyboard_check_pressed(ord("D")) or keyboard_check_pressed(vk_right))
		-
		(keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up) or
		keyboard_check_pressed(ord("A")) or keyboard_check_pressed(vk_left));

	menu_index += menu_move;

	if (menu_index < 0) menu_index = buttons - 1;

	if (menu_index > buttons - 1) menu_index = 0;

	if (menu_index != last_selected) audio_play_sound(snd_menu_hover, 1, false);

	last_selected = menu_index;	
}
var i = 0;
repeat (buttons) {
	/*
	var cx = camera_get_view_x(view_camera[0]);
	var cy = camera_get_view_y(view_camera[0]);
	draw_sprite(spr_pause_help, 0, cx + 320, cy + 180);
	*/
	
	draw_set_alpha(1);
	draw_set_font(font_main_menu);
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);
	draw_set_color(c_ltgray);
	
	if (menu_index == i) draw_set_color(c_red);
	
	draw_text_transformed(x, y + 32 * i, button[i], 0.5, 0.5, 0);
	++i;
}
if (isPaused) {
	var i = 0;
	repeat (buttons) {
		draw_set_alpha(1);
		draw_set_font(font_main_menu);
		draw_set_halign(fa_middle);
		draw_set_valign(fa_middle);
		draw_set_color(c_ltgray);

		if (menu_index == i) draw_set_color(c_red);

		// draw_text_transformed(x, y + 32 * i, button[i], 0.5, 0.5, 0);
		// var cx = camera_get_view_x(view_camera);
		// var cy = camera_get_view_y(view_camera);
		var cx = 3 * surface_get_width(application_surface) / 5;
		var cy = 9 * surface_get_height(application_surface) / 10;
		draw_text(cx + 256 * i, cy, button[i]);
		++i;
	}
}
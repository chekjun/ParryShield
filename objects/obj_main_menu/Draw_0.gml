
var i = 0;
repeat (buttons) {
	
	draw_set_font(font_main_menu);
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);
	draw_set_color(c_ltgray);
	
	if (menu_index == i) draw_set_color(c_red);
	
	draw_text(x, y + 64 * i, button[i]);
	++i;
	
}
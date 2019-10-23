if(keyboard_check_pressed(vk_anykey)) {
	room_goto(0);	
}


draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_red);
draw_set_alpha(text_alpha);
draw_text(x, y, "yeet");
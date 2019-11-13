draw_sprite_part(spr_narima_hp_meter, 0, 0, 0, (640 * HP / 3200), 64, 320, 0);
draw_sprite(spr_narima_hp_bar, 0, 640, 32);

if (textTimer > 0) {
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);
	draw_set_font(font_pixel_text);
	if (textTimer <= 140) {
		draw_text(150 + camera_get_view_width(view_current) / 2, camera_get_view_height(view_current) - 160, "Your time is up now, Delta!");
	} else if (textTimer <= 280) {
		draw_text(150 + camera_get_view_width(view_current) / 2, camera_get_view_height(view_current) - 160, "All you do is parry like a coward");
	} else if (textTimer <= 420) {
		draw_text(150 + camera_get_view_width(view_current) / 2, camera_get_view_height(view_current) - 160, "Even though you hold a legendary weapon,");
	}
}
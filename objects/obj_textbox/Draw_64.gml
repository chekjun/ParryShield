/// @description Insert description here
// You can write your code in this editor

draw_sprite_part(spr_textbox, 1, 0, 0, 750, 135, x, y);

draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_color(c_white);

// Title
draw_set_font(font_pixel_text);
draw_text(x + 15, y + 15, string(text));
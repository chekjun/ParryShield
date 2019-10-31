draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_set_alpha(text_alpha);

// Title
draw_set_font(font_credit_title);
draw_text(x, y - 50, string(title));

// Subtitle 1
draw_set_font(font_credit_subtitle);
draw_text(x, y, string(sub1));

// Subtitle 2
draw_set_font(font_credit_subtitle);
draw_text(x, y + 40, string(sub2));


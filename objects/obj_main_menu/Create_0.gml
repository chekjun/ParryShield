window_set_fullscreen(true);
window_set_cursor(cr_none);

x = (room_width / 2) - 1;
y = (2 * room_height / 5) - 1;

// buttons
button[0] = "Play";
button[1] = "Help";
button[2] = "Credits";
button[3] = "Exit";
buttons = array_length_1d(button);

menu_index = 0;
last_selected = 0;

with(obj_help) {
	visible = false;	
}
help = false;
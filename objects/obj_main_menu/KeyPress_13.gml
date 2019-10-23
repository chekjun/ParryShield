audio_play_sound(snd_menu_select, 1, false);

if (help) {
	layer_set_visible(0, true); // Menu Appear
	layer_set_visible(1, false); // Help Disappear
	help = false;
	show_debug_message("help fuck off");	
} else {
	switch (menu_index) {
	
		// Play
		case 0:
			room_goto(2);
		break;
	
		// Help
		case 1:
			layer_set_visible(0, false); // Menu Disappear
			layer_set_visible(1, true); // Help ppear
			help = true;
			show_debug_message("help appear");	
		break;
	
		// Credits
		case 2:
			room_goto(1);
		break;
	
		// Exit
		case 3:
			game_end();
		break;
	
	}
}
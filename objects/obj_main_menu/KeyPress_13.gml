audio_play_sound(snd_menu_select, 1, false);

if (help) {
	//layer_set_visible(0, true); // Menu Appear
	//layer_set_visible(1, false); // Help Disappear
	with(obj_main_menu) {
		visible = true;	
	}
	with(obj_help) {
		visible = false;	
	}
	help = false;
} else {
	switch (menu_index) {
	
		// Play
		case 0:
			room_goto_next();
		break;
	
		// Help
		case 1:
			//layer_set_visible(0, false); // Menu Disappear
			//layer_set_visible(1, true); // Help ppear
			with(obj_main_menu) {
				visible = false;	
			}
			with(obj_help) {
				visible = true;
			}
			help = true;
		break;
	
		// Credits
		case 2:
			room_goto(room_credit);
		break;
	
		// Exit
		case 3:
			game_end();
		break;
	
	}
}
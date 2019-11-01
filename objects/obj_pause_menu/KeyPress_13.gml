audio_play_sound(snd_menu_select, 1, false);

if (help) {
	with(obj_help) {
		visible = false;	
	}
	help = false;
} else {
	switch (menu_index) {
	
		// Play
		case 0:
		break;
	
		// Help
		case 1:
			with(obj_main_menu) {
				visible = false;
			}
			with (obj_title_text) {
				visible = false;
			}
			with (obj_title_bonfire) {
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
audio_play_sound(snd_menu_select, 1, false);
if help {
	with (obj_pausemenu) {
		visible = true;
	}
	with (obj_pause_help) {
		visible = false;
	}
	help = false;
} else {
	switch (menu_index) {
	
		// Play
		case 0:
			instance_activate_all();
			obj_pause.isPaused = false;
			with (obj_pause_help) {
				visible = false;
			}
			instance_destroy();
		break;
	
		// Help
		case 1:
			with (obj_pausemenu) {
				visible = false;
			}
			with (obj_pause_help) {
				visible = true;
			}
			help = true;
		break;
	
		// Main Menu
		case 2:
			game_restart();
		break;
	
	}
}
audio_play_sound(snd_menu_select, 1, false);
switch (menu_index) {
	
		// Play
		case 0:
			instance_activate_all();
			obj_pause.isPaused = false;
			instance_destroy();
		break;
	
		// Main Menu
		case 1:
			game_restart();
		break;
}
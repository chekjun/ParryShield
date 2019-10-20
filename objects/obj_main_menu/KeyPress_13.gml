audio_play_sound(snd_menu_select, 1, false); 
switch (menu_index) {
	
	// Play
	case 0:
		room_goto_next();
	break;
	
	// Help
	case 1:
		
	break;
	
	// Credits
	case 2:
		
	break;
	
	// Exit
	case 3:
		game_end();
	break;
	
}
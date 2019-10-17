switch sprite_index {
	case spr_delta_roll_left:
		show_debug_message("ANIMATION END");
		if (image_index == 0) {
			show_debug_message("roll left end");
			//sprite_index = spr_delta_idle_left;	
		}
	break;
	case spr_delta_roll_right:
	show_debug_message("ANIMATION END");
		if (image_index == 0) {
			show_debug_message("roll right end");
			//sprite_index = spr_delta_idle_right;	
		}
	break;
}
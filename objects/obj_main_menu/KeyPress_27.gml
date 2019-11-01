if (menu_index == 1 and help) {
	with(obj_main_menu) {
		visible = true;
	}
	with (obj_title_text) {
		visible = true;
	}
	with (obj_title_bonfire) {
		visible = true;
	}
	with(obj_help) {
		visible = false;	
	}
	help = false;
}
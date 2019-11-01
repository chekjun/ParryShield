if (isPaused) {
	instance_activate_all();
	instance_destroy(obj_pausemenu);
	with(obj_pause_help) {
		visible = false;	
	}
	isPaused = false;
} else {
	instance_deactivate_all(true);
	instance_create_depth(x, y, 0,  obj_pausemenu);
	isPaused = true;
}
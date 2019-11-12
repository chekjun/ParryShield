if (isPaused) {
	instance_activate_all();
	isPaused = false;
} else {
	instance_deactivate_all(true);
	instance_create_depth(x, y, depth + 1,  obj_pause_help);
	isPaused = true;
}
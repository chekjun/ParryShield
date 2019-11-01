if (isPaused) {
	instance_activate_all();
	isPaused = false;
} else {
	instance_deactivate_all(true);
	isPaused = true;
}
cy = surface_get_height(application_surface) / 2;

if (obj_next_area.cleared) {
	if (room != 1 and victoryNotPlayed) {
		audio_pause_sound(bgm_loop);
		audio_pause_sound(bgm_boss);
		audio_play_sound(bgm_victory, 1, false);
		victoryNotPlayed = false;
	}
	if (cx >= surface_get_width(application_surface) / 2) {
		cx = cx - 10;
	} else {
		--stayDurationTimer;
	}
	if (stayDurationTimer <= 0 and cx >= -200) {
		cx = cx - 10;
	}
}
if (obj_next_area.cleared) {
	if (cx >= surface_get_width(application_surface) / 2) {
		cx = cx - 10;
	} else {
		--stayDurationTimer;
	}
	if (stayDurationTimer <= 0 and cx >= -200) {
		cx = cx - 10;
	}
}
if ((invulnerableDurationTimer <= 40 and invulnerableDurationTimer > 30) or
		(invulnerableDurationTimer <= 15 and invulnerableDurationTimer > 5)) {
	shader_set(sha_flash);
	image_alpha = 0.75;
	draw_self();
	shader_reset();
} else {
	image_alpha = 1;
	draw_self();
}
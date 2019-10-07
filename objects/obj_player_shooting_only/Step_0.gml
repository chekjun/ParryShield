if (shootCooldownTimer > 0) {
	--shootCooldownTimer;
}

scr_get_player_input();

if (key_shoot and shootCooldownTimer == 0) {
	instance_create_depth(x, y, depth, obj_player_bullet_training);
	shootCooldownTimer = shootCooldown;
}
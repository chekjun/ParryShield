if(shootCooldownTimer > 0 and obj_game_controller.bulletTimeDurationTimer <= 0) {
	--shootCooldownTimer;	
}

if (shootCooldownTimer <= 0) {
	instance_create_depth(x, y, depth, obj_tutorial_bullet_beam);
	shootCooldownTimer = shootCooldown;
}
if(shootCooldownTimer > 0 and obj_game_controller.bulletTimeDurationTimer <= 0) {
	--shootCooldownTimer;	
}

if (shootCooldownTimer <= 0) {
	var bullet = instance_create_depth(x, y, depth, obj_tutorial_bullet_beam);
	bullet.direction = 180;
	bullet.speed = 3.5;
	shootCooldownTimer = shootCooldown;
}
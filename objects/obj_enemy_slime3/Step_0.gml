if(currentShotCooldown <= 0) {
	instance_create_depth(x, y, depth, obj_tutorial_bullet_beam);
	obj_tutorial_bullet_beam.direction = 180;
	currentShotCooldown = shotCooldown;
}

if(currentShotCooldown > 0) {
	currentShotCooldown--;	
}


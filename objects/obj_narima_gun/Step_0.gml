if (!instance_exists(obj_narima) or obj_narima.state = BossStates.DEAD) {
	chargingDuration = 999;
}

if (chargingDuration > 0) {
	--chargingDuration;
} else {
	if (random(100) <= 8) {
		var bullet = instance_create_depth(x, y, depth, obj_heal_bullet);
	} else {
		var bullet = instance_create_depth(x, y, depth, obj_enemy_bullet);	
	}
	bullet.speed = 4;
	bullet.direction += random_range(-10, 10); 
	chargingDuration = 999;
}
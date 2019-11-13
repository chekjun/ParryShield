if (obj_game_controller.bulletTimeDurationTimer > 0) {
	exit;
}

switch state {

	case BossStates.DEAD:
		if (y < -16) {
			instance_destroy();
		} else {
			--y;
		}
		HP = 0;
		exit;
	break;
	
	case BossStates.QUARTER:
		if (HP <= 0) {
			HP = 0;
			state = BossStates.DEAD;
		}
	break;
	
	case BossStates.HALF:
		if (HP <= 5000 / 4) {
			state = BossStates.QUARTER;
			shootCooldown = 18;
			explosionCooldown = 120;
		}
	break;
	
	case BossStates.THREE_QUARTER: 
		if (HP <= 5000 / 2) {
			state = BossStates.HALF;
			shootCooldown = 22;
			explosionCooldown = 130;
		}

	break;
	
	case BossStates.FULL:
		if (HP <= 5000 * 3 / 4) {
			state = BossStates.THREE_QUARTER;
			shootCooldown = 26;
			explosionCooldown = 140;
		}
		
	break;

}

if (shootCooldownTimer > 0) {
	--shootCooldownTimer;
} else {
	var randX = random_range(70, 570);
	var randY = random_range(20, 44);
	instance_create_depth(randX, randY, depth, obj_narima_gun);	
	shootCooldownTimer = shootCooldown;
}

if (explosionCooldownTimer > 0) {
	--explosionCooldownTimer;
} else {
	instance_create_depth(obj_delta.x, obj_delta.y, depth, obj_narima_crosshair);	
	explosionCooldownTimer = explosionCooldown;
}
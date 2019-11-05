if (obj_game_controller.bulletTimeDurationTimer > 0) {
	exit;
}


if (shootCooldownTimer > 0) {
	--shootCooldownTimer;
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
			shootCooldown = 12;
		}
	break;
	
	case BossStates.THREE_QUARTER: 
		if (HP <= 5000 / 2) {
			state = BossStates.HALF;
			shootCooldown = 18;
		}

	break;
	
	case BossStates.FULL:
		if (HP <= 5000 * 3 / 4) {
			state = BossStates.THREE_QUARTER;
			shootCooldown = 24;
		}
		
	break;

}

var randX = random_range(50, 590);
var randY = random_range(16, 64);
instance_create_depth(randX, randY, depth, obj_narima_gun);

shootCooldownTimer = shootCooldown;
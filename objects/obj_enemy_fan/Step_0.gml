// Reload
if (shootCooldownTimer > 0 and obj_game_controller.bulletTimeDurationTimer <= 0) {
	--shootCooldownTimer;
}

switch state {
	case EnemyStates.DEAD:
		mask_index = spr_enemy_dead_hitbox;
		sprite_index = spr_enemy_dead;
		exit;
	break;
	
	case EnemyStates.IDLE:
	
	break;
	
	case EnemyStates.WALK:
	
	break;
	
	case EnemyStates.ATTACK:
		for (i = 0; i < 8; ++i) {
			var tempDir = 0 + 45 * i
			var bullet = instance_create_depth(x, y, depth, obj_enemy_bullet);
			bullet.direction = tempDir;
		}
		shootCooldownTimer = shootCooldown;
	break;
}

if (HP <= 0) {
	speed = 0;
	state = EnemyStates.DEAD;
}
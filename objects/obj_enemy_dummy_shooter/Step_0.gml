if (isDead) {
	if (keyboard_check_pressed(vk_enter)) {
		room_goto_next();
	}
	exit;
}

if (shootCooldownTimer == 0) {
	if (instance_exists(obj_player_block_only) and obj_player_block_only.energy <= 0) {
		exit;
	}
	instance_create_depth(x, y, depth, obj_enemy_bullet_training);
	shootCooldownTimer = shootCooldown;
}
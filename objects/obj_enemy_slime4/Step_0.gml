if(shotCooldownTimer > 0 and obj_game_controller.bulletTimeDurationTimer <= 0) {
	--shotCooldownTimer;	
}

if(shotCooldownTimer == 28) {
	sprite_index = spr_white_slime_attack;
}

if (shotCooldownTimer <= 0) {
	instance_create_depth(x, y, depth, obj_tutorial_bullet_heal);
	sprite_index = spr_white_slime_idle;
	shotCooldownTimer = shotCooldown;
}
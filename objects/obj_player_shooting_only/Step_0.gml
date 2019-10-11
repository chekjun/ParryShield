if (shootCooldownTimer > 0) {
	--shootCooldownTimer;
}

key_up = keyboard_check(ord("W"));
key_left = keyboard_check(ord("A"));
key_down = keyboard_check(ord("S"));
key_right = keyboard_check(ord("D"));
key_dash = keyboard_check_pressed(vk_space);
key_shoot = mouse_check_button_pressed(mb_left);
key_parry = mouse_check_button_pressed(mb_right);
key_shield = mouse_check_button(mb_right);

if (key_shoot and shootCooldownTimer == 0) {
	instance_create_depth(x, y, depth, obj_player_bullet_training);
	shootCooldownTimer = shootCooldown;
}
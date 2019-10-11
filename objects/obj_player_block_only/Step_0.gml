key_up = keyboard_check(ord("W"));
key_left = keyboard_check(ord("A"));
key_down = keyboard_check(ord("S"));
key_right = keyboard_check(ord("D"));
key_dash = keyboard_check_pressed(vk_space);
key_shoot = mouse_check_button_pressed(mb_left);
key_parry = mouse_check_button_pressed(mb_right);
key_shield = mouse_check_button(mb_right);
if (key_shield and energy >= 0 and !instance_exists(obj_shield_training)) {
	isBlocking = true;
	instance_create_depth(
		x + lengthdir_x(24, point_direction(x, y, mouse_x, mouse_y)),
		y + lengthdir_y(24, point_direction(x, y, mouse_x, mouse_y)),
		depth,
		obj_shield_training);
} else {
	isBlocking = false;
}

if (energy <= 0 and keyboard_check_pressed(vk_enter)) {
	room_goto_next();
}
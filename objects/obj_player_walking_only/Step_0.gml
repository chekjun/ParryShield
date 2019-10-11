key_up = keyboard_check(ord("W"));
key_left = keyboard_check(ord("A"));
key_down = keyboard_check(ord("S"));
key_right = keyboard_check(ord("D"));
key_dash = keyboard_check_pressed(vk_space);
key_shoot = mouse_check_button_pressed(mb_left);
key_parry = mouse_check_button_pressed(mb_right);
key_shield = mouse_check_button(mb_right);

// Calculate Player Walking
hspeed = (key_right - key_left) * moveSpeed;
vspeed = (key_down - key_up) * moveSpeed;

if (hspeed != 0 and vspeed != 0) {
	hspeed = hspeed * round(sqrt(2) / 2);
	vspeed = vspeed * round(sqrt(2) / 2);
}

if (place_meeting(x + hspeed, y, obj_wall)) {
	while (!place_meeting(x + sign(hspeed), y, obj_wall)) {
		x = x + sign(hspeed);
	}
	hspeed = 0;
}

if (place_meeting(x, y + vspeed, obj_wall)) {
		while (!place_meeting(x, y + sign(vspeed), obj_wall)) {
		y = y + sign(vspeed);
	}
	vspeed = 0;
}

scr_walk_anim();

// Check that player has walked in 4 directions.
if (!hasMovedUp and key_up) hasMovedUp = true;
if (!hasMovedLeft and key_left) hasMovedLeft = true;
if (!hasMovedDown and key_down) hasMovedDown = true;
if (!hasMovedRight and key_right) hasMovedRight = true;
if (hasMovedUp and hasMovedLeft and hasMovedDown and hasMovedRight and keyboard_check_pressed(vk_enter)) room_goto_next();
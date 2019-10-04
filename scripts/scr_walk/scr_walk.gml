// Calculate Player Movement
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
// Horizontal Collision with Wall
if (!place_meeting(x - hspeed, y, obj_wall)) {
	--numberOfBounces;
	/*
	while (!place_meeting(x + sign(hspeed), y, obj_wall)) {
		x = x + sign(hspeed);
	}
	*/
	hspeed *= -1;
}

// Vertical Collision with Wall
if (!place_meeting(x, y - vspeed, obj_wall)) {
	--numberOfBounces;
	/*
	while (!place_meeting(x + sign(vspeed), y, obj_wall)) {
		y = y + sign(vspeed);
	}
	*/
	vspeed *= -1;
}
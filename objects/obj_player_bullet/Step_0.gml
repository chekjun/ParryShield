if (numberOfBounces <= 0) {
	instance_destroy();
}

if (place_meeting(x + hspeed, y, obj_wall)) {
	--numberOfBounces;
	while (!place_meeting(x + sign(hspeed), y, obj_wall)) {
		x = x + sign(hspeed);
	}
	hspeed = -hspeed;
}

if (place_meeting(x, y + vspeed, obj_wall)) {
	--numberOfBounces;
	while (!place_meeting(x, y + sign(vspeed), obj_wall)) {
		y = y + sign(vspeed);
	}
	vspeed = -vspeed;
}
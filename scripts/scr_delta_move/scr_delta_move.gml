hspd = argument0;
vspd = argument1;
if (hspd != 0 and vspd != 0) {
	hspd = hspd * round(sqrt(3) / 3);
	vspd = vspd * round(sqrt(3) / 3);
}
if (place_meeting(x + hspd, y, obj_wall)) {
	while (!place_meeting(x + sign(hspd), y, obj_wall)) {
		x = x + sign(hspd);
	}
	hspd = 0;
}
if (place_meeting(x, y + vspd, obj_wall)) {
		while (!place_meeting(x, y + sign(vspd), obj_wall)) {
		y = y + sign(vspd);
	}
	vspd = 0;
}
// Added by Timothy
if (place_meeting(x + hspd, y, obj_invisible_wall)) {
	while (!place_meeting(x + sign(hspd), y, obj_invisible_wall)) {
		x = x + sign(hspd);
	}
	hspd = 0;
}
if (place_meeting(x, y + vspd, obj_invisible_wall)) {
		while (!place_meeting(x, y + sign(vspd), obj_invisible_wall)) {
		y = y + sign(vspd);
	}
	vspd = 0;
}

if (place_meeting(x + hspd, y, obj_tree)) {
	while (!place_meeting(x + sign(hspd), y, obj_tree)) {
		x = x + sign(hspd);
	}
	hspd = 0;
}
if (place_meeting(x, y + vspd, obj_tree)) {
		while (!place_meeting(x, y + sign(vspd), obj_tree)) {
		y = y + sign(vspd);
	}
	vspd = 0;
}
x = x + hspd;
y = y + vspd;
x = clamp(x, 0, room_width);
y = clamp(y, 0, room_height);
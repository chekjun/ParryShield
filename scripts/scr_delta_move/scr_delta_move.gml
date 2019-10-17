horizontalSpeed = argument0;
verticalSpeed = argument1;
if (horizontalSpeed != 0 and verticalSpeed != 0) {
	horizontalSpeed = horizontalSpeed * round(sqrt(2) / 2);
	verticalSpeed = verticalSpeed * round(sqrt(2) / 2);
}
if (place_meeting(x + horizontalSpeed, y, obj_wall)) {
	while (!place_meeting(x + sign(horizontalSpeed), y, obj_wall)) {
		x = x + sign(horizontalSpeed);
	}
	horizontalSpeed = 0;
}
if (place_meeting(x, y + verticalSpeed, obj_wall)) {
		while (!place_meeting(x, y + sign(verticalSpeed), obj_wall)) {
		y = y + sign(verticalSpeed);
	}
	verticalSpeed = 0;
}
x = x + horizontalSpeed;
y = y + verticalSpeed;
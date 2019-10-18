// Look at mouse
lookingAngle = point_direction(x, y, mouse_x, mouse_y);
if (lookingAngle > 45 and lookingAngle < 135) {
	facing = PlayerDirections.UP;
} else if (lookingAngle >= 135 and lookingAngle <= 225) {
	facing = PlayerDirections.LEFT;
} else if (lookingAngle > 225 and lookingAngle < 315) {
	facing = PlayerDirections.DOWN;
} else if (lookingAngle >= 315 or lookingAngle <= 45) {
	facing = PlayerDirections.RIGHT;
}
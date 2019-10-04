// Parry Animation
lookingAngle = point_direction(x, y, mouse_x, mouse_y);
if (lookingAngle > 45 and lookingAngle < 135) {
	sprite_index = spr_player_parry_up;
} else if (lookingAngle >= 135 and lookingAngle <= 225) {
	sprite_index = spr_player_parry_left;
} else if (lookingAngle > 225 and lookingAngle < 315) {
	sprite_index = spr_player_parry_down;
} else if (lookingAngle >= 315 or lookingAngle <= 45) {
	sprite_index = spr_player_parry_right;
}
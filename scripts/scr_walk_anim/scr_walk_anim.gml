// Walking Animation
if (hspeed == 0 and vspeed == 0) {
	image_index = 0;
	image_speed = 0;
} else {
	image_speed = 1;
	if (key_left) {
		sprite_index = spr_playerA;
	} else if (key_right) {
		sprite_index = spr_playerD;
	} else if (key_up){
		sprite_index = spr_playerW;
	} else if (key_down) {
		sprite_index = spr_playerS;
	}
}
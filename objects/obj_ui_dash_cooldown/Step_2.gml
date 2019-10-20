x = obj_delta.x + shiftX;
y = obj_delta.y + shiftY;

if (obj_delta.rollCooldownTimer == 0) {
	image_alpha = 0;
} else {
	image_alpha = 1;
	if (obj_delta.rollCooldownTimer <= 5) {
		image_index = 9;
	} else if (obj_delta.rollCooldownTimer <= 11) {
		image_index = 8;
	} else if (obj_delta.rollCooldownTimer <= 17) {
		image_index = 7;
	} else if (obj_delta.rollCooldownTimer <= 23) {
		image_index = 6;
	} else if (obj_delta.rollCooldownTimer <= 29) {
		image_index = 5;
	} else if (obj_delta.rollCooldownTimer <= 35) {
		image_index = 4;
	} else if (obj_delta.rollCooldownTimer <= 41) {
		image_index = 3;
	} else if (obj_delta.rollCooldownTimer <= 47) {
		image_index = 2;
	} else if (obj_delta.rollCooldownTimer <= 53) {
		image_index = 1;
	} else {
		image_index = 0;
	}
}
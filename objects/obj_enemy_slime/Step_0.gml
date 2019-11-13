if(HP == 0) {
	instance_destroy(obj_enemy_slime);	
}

if(currentShotCooldown == 25) {
	sprite_index = spr_slime_attack;	
}

if(currentShotCooldown <= 0) {
	instance_create_depth(x, y, depth, obj_tutorial_bullet);
	if (scr_in_view()) {
		audio_play_sound(snd_slime_shoot, 1, false);
	}
	sprite_index = spr_slime_idle;
	currentShotCooldown = shotCooldown;
}

var camera = view_camera[0];
if(currentShotCooldown > 0) {
		if (point_in_rectangle(x, y,
			camera_get_view_x(camera) + 16,
			camera_get_view_y(camera) + 16,
			camera_get_view_x(camera) + camera_get_view_width(camera) - 16,
			camera_get_view_y(camera) + camera_get_view_height(camera) - 16)) {
			if (distance_to_object(obj_delta) < shootRange) {
				currentShotCooldown--;	
			}
		
	}
}


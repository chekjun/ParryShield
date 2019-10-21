var healthX = 50;
var healthY = 575;

if (health == 0) {
	draw_sprite_part(spr_health_bar, 0, 0, 0, 256, 32, healthX, healthY);
} else if (health <= 10) {
	draw_sprite_part(spr_health_bar, 1, 0, 0, 256, 32, healthX, healthY);
} else if (health <= 20) {
	draw_sprite_part(spr_health_bar, 2, 0, 0, 256, 32, healthX, healthY);
} else if (health <= 30) {
	draw_sprite_part(spr_health_bar, 3, 0, 0, 256, 32, healthX, healthY);
} else if (health <= 40) {
	draw_sprite_part(spr_health_bar, 4, 0, 0, 256, 32, healthX, healthY);
} else if (health <= 50) {
	draw_sprite_part(spr_health_bar, 5, 0, 0, 256, 32, healthX, healthY);
} else if (health <= 60) {
	draw_sprite_part(spr_health_bar, 6, 0, 0, 256, 32, healthX, healthY);
} else if (health <= 70) {
	draw_sprite_part(spr_health_bar, 7, 0, 0, 256, 32, healthX, healthY);
} else if (health <= 80) {
	draw_sprite_part(spr_health_bar, 8, 0, 0, 256, 32, healthX, healthY);
} else if (health <= 90) {
	draw_sprite_part(spr_health_bar, 9, 0, 0, 256, 32, healthX, healthY);
} else {
	draw_sprite_part(spr_health_bar, 10, 0, 0, 256, 32, healthX, healthY);
}

var energyX = 50;
var energyY = 600;

if (energy <= 0) {
	draw_sprite_part(spr_energy_bar, 0, 0, 0, 256, 32, energyX, energyY);
} else if (energy <= 10) {
	draw_sprite_part(spr_energy_bar, 1, 0, 0, 256, 32, energyX, energyY);
} else if (energy <= 20) {
	draw_sprite_part(spr_energy_bar, 2, 0, 0, 256, 32, energyX, energyY);
} else if (energy <= 30) {
	draw_sprite_part(spr_energy_bar, 3, 0, 0, 256, 32, energyX, energyY);
} else if (energy <= 40) {
	draw_sprite_part(spr_energy_bar, 4, 0, 0, 256, 32, energyX, energyY);
} else if (energy <= 50) {
	draw_sprite_part(spr_energy_bar, 5, 0, 0, 256, 32, energyX, energyY);
} else if (energy <= 60) {
	draw_sprite_part(spr_energy_bar, 6, 0, 0, 256, 32, energyX, energyY);
} else if (energy <= 70) {
	draw_sprite_part(spr_energy_bar, 7, 0, 0, 256, 32, energyX, energyY);
} else if (energy <= 80) {
	draw_sprite_part(spr_energy_bar, 8, 0, 0, 256, 32, energyX, energyY);
} else if (energy <= 90) {
	draw_sprite_part(spr_energy_bar, 9, 0, 0, 256, 32, energyX, energyY);
} else {
	draw_sprite_part(spr_energy_bar, 10, 0, 0, 256, 32, energyX, energyY);
}

///get camera coords
var cx = camera_get_view_x(view_camera);
var cy = camera_get_view_y(view_camera);
///make the adjustment to gui
var rollX = (x - cx) * 2 - 32;
var rollY = (y - cy) * 2 + 16;

if (rollCooldownTimer > 0) {
	if (rollCooldownTimer <= 6) {
	draw_sprite_part(spr_roll_bar, 0, 0, 0, 64, 64, rollX, rollY);
	} else if (rollCooldownTimer <= 12) {
		draw_sprite_part(spr_roll_bar, 1, 0, 0, 64, 64, rollX, rollY);
	} else if (rollCooldownTimer <= 18) {
		draw_sprite_part(spr_roll_bar, 2, 0, 0, 64, 64, rollX, rollY);
	} else if (rollCooldownTimer <= 24) {
		draw_sprite_part(spr_roll_bar, 3, 0, 0, 64, 64, rollX, rollY);
	} else if (rollCooldownTimer <= 30) {
		draw_sprite_part(spr_roll_bar, 4, 0, 0, 64, 64, rollX, rollY);
	} else if (rollCooldownTimer <= 36) {
		draw_sprite_part(spr_roll_bar, 5, 0, 0, 64, 64, rollX, rollY);
	} else if (rollCooldownTimer <= 42) {
		draw_sprite_part(spr_roll_bar, 6, 0, 0, 64, 64, rollX, rollY);
	} else if (rollCooldownTimer <= 48) {
		draw_sprite_part(spr_roll_bar, 7, 0, 0, 64, 64, rollX, rollY);
	} else if (rollCooldownTimer <= 54) {
		draw_sprite_part(spr_roll_bar, 8, 0, 0, 64, 64, rollX, rollY);
	} else if (rollCooldownTimer <= 60) {
		draw_sprite_part(spr_roll_bar, 9, 0, 0, 64, 64, rollX, rollY);
	}
}
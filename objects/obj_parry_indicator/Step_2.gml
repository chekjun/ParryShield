var player = obj_delta;

if (player.parryCooldownTimer == 0 and player.state != PlayerStates.DEAD) {
	visible = true;
} else {
	visible = false;
}

var playerX = player.x;
var playerY = player.y;

x = playerX + lengthdir_x(24, point_direction(playerX, playerY, mouse_x, mouse_y));
y = playerY + lengthdir_y(24, point_direction(playerX, playerY, mouse_x, mouse_y));
image_angle = point_direction(playerX, playerY, mouse_x, mouse_y);
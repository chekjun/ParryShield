numberOfBounces = 0;
if (instance_exists(obj_player_parry_only)) {
	direction = point_direction(x, y, obj_player_parry_only.x, obj_player_parry_only.y);
} else {
	direction = point_direction(x, y, obj_player_block_only.x, obj_player_block_only.y);
}

speed = 2.5;
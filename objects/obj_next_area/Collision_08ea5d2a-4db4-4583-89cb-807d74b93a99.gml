var cleared = true;
if (instance_exists(obj_enemy_single)) {
	cleared = false;
}
if (instance_exists(obj_enemy_burst)) {
	cleared = false;
}
if (instance_exists(obj_enemy_shotgun)) {
	cleared = false;
}
if (instance_exists(obj_enemy_fan)) {
	cleared = false;
}
if (instance_exists(obj_narima)) {
	cleared = false;
}
if (cleared) {
	room_goto_next();	
}
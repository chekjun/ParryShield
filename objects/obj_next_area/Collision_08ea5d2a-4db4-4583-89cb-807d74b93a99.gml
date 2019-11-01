var cleared = true;
with (obj_enemy_single) {	
	if (state != EnemyStates.DEAD) {
		cleared = false;
	}
}
with (obj_enemy_burst) {
	if (state != EnemyStates.DEAD) {
		cleared = false;
	}
}
with (obj_enemy_fan) {
	if (state != EnemyStates.DEAD) {
		cleared = false;
	}
}
if (cleared) {
	room_goto_next();	
}
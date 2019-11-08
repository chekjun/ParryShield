if (direction > 45 and direction < 135) {
	facing = EnemyDirection.UP;
} else if (direction >= 135 and direction <= 225) {
	facing = EnemyDirection.LEFT;
} else if (direction > 225 and direction < 315) {
	facing = EnemyDirection.DOWN;
} else if (direction >= 315 or direction <= 45) {
	facing = EnemyDirection.RIGHT;
}

switch facing {
	case EnemyDirection.UP:
		sprite_index = spr_enemy_shotgun_up;
	break;
	
	case EnemyDirection.LEFT:
		sprite_index = spr_enemy_shotgun_left;
	break;
	
	case EnemyDirection.DOWN:
		sprite_index = spr_enemy_shotgun_down;
	break;
	
	case EnemyDirection.RIGHT:
		sprite_index = spr_enemy_shotgun_right;
	break;
}

image_speed = 1;
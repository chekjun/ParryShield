if (obj_delta.state == PlayerStates.DEAD) {
	instance_destroy(obj_delta);
	instance_create_depth(obj_respawn_point.x, obj_respawn_point.y, depth, obj_delta);
}

if (bulletTimeCooldownTimer > 0) {
	--bulletTimeCooldownTimer;
}

if (bulletTimeDurationTimer > 0) {
	--bulletTimeDurationTimer;
} else {
	isBulletTime = false;
}
if (rollCooldownTimer > 0) {
	--rollCooldownTimer;
}
if (shootCooldownTimer > 0) {
	--shootCooldownTimer;
}
if (parryCooldownTimer > 0) {
	--parryCooldownTimer;
	if (parryCooldownTimer == 15) {
		instance_create_depth(x, y + 10, -bbox_bottom - 10, obj_effect_spark);
	}
}
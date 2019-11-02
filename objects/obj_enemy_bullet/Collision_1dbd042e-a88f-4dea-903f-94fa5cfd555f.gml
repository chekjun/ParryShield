if (other.state != PlayerStates.ROLL and other.invulnerableCooldownTimer == 0) {
	instance_destroy();
	health = health - damage;
	other.invulnerableCooldownTimer = other.invulnerableCooldown;
	other.invulnerableDurationTimer = other.invulnerableDuration;
}
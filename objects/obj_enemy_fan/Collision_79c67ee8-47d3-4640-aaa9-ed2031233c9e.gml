if (other.invulnerableCooldownTimer <= 0 and other.rollDurationTimer <= 0) {
	health = health - 10;
	other.invulnerableCooldownTimer = other.invulnerableCooldown;
	other.invulnerableDurationTimer = other.invulnerableDuration;
}
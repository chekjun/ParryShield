if (other.rollDurationTimer <= 0 and other.invulnerableCooldownTimer <= 0) {
	health = health - damage;
	other.invulnerableCooldownTimer = other.invulnerableCooldown;
	other.invulnerableDurationTimer = other.invulnerableDuration;
}
if (other.state != PlayerStates.ROLL and other.invulnerableCooldownTimer == 0) {
	instance_destroy();
	audio_play_sound(snd_hit, 1, false);
	health = health - damage;
	other.invulnerableCooldownTimer = other.invulnerableCooldown;
	other.invulnerableDurationTimer = other.invulnerableDuration;
}
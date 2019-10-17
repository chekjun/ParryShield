if (other.state != PlayerStates.ROLL) {
	instance_destroy();
	health = health - damage;
}
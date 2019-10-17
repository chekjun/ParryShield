// Stats
health = 100;
energy = 100;

// Movement
moveSpeed = 2;
rollSpeed = 5;
state = PlayerStates.IDLE;
facing = PlayerDirections.DOWN;

// Boolean
isDead = false;
isDashing = false;
isShooting = false;
isParrying = false;
isBlocking = false;
isInvulnerable = false;

// Cooldown
invulnerableCooldown = 60;
rollCooldown = 60;
shootCooldown = 60;
parryCooldown = 60;

invulnerableDuration = 30;
rollDuration = 30;
shootDuration = 15;
parryDuration = 15;

// Timer
invulnerableCooldownTimer = 0;
rollCooldownTimer = 0;
shootCooldownTimer = 0;
parryCooldownTimer = 0;

invulnerableDurationTimer = 0;
rollDurationTimer = 0;
shootDurationTimer = 0;
parryDurationTimer = 0;
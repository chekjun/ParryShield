// Stats
health = 100;
energy = 100;

// Movement
moveSpeed = 2;
state = PlayerStates.IDLE;
facing = PlayerDirections.DOWN;

// Cooldown
invulnerableCooldown = 90;
rollCooldown = 90;
shootCooldown = 60;
parryCooldown = 75;

invulnerableDuration = 45;
rollDuration = 30;
shootDuration = 60;
chargingDuration = 30;
parryDuration = 15;

// Timer
invulnerableCooldownTimer = 0;
rollCooldownTimer = 0;
shootCooldownTimer = 0;
parryCooldownTimer = 0;

invulnerableDurationTimer = 0;
rollDurationTimer = 0;
shootDurationTimer = 0;
chargingDurationTimer = 0.0;
parryDurationTimer = 0;

audio_play_sound(bgm_loop, 1, true);
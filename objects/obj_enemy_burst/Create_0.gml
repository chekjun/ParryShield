// Stats
HP = 200;
shootRange = 120;

detectCooldown = 60;
shootCooldown = 120;
shootDuration = 12;

detectCooldownTimer = detectCooldown;
shootCooldownTimer = 0;
shootDurationTimer = 0;

changePathCooldown = 15;
changePathCooldownDuration = 0;

state = EnemyStates.IDLE;
facing = EnemyDirection.DOWN;

burstCounter = 0;
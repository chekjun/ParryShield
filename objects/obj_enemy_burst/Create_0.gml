
// Stats
HP = 150;

detectionRange = 200;
retreatRange = 100;
advanceRange = 125;
chaseRangeLimit = 500;

detectCooldown = 60;
shootCooldown = 120;
shootDuration = 12;

detectCooldownTimer = detectCooldown;
shootCooldownTimer = 0;
shootDurationTimer = 0;

state = EnemyStates.IDLE;
facing = EnemyDirection.DOWN;

burstCounter = 0;
// Stats
HP = 3200;

shootCooldown = 30;
shootCooldownTimer = 420;

explosionCooldown = 150;
explosionCooldownTimer = 420;

textTimer = 420;

state = BossStates.FULL;

audio_stop_sound(bgm_loop);
audio_play_sound(bgm_boss, 1, true);
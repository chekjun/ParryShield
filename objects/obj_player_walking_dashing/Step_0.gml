scr_get_player_input();
if (!isDashing) scr_walk();
scr_dash();

// Check that player has dashed.
if (!hasDashed and (key_up or key_left or key_down or key_right) and key_dash) hasDashed = true;
if (hasDashed and keyboard_check_pressed(vk_enter)) room_goto_next();
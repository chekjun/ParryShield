scr_get_player_input();
if (!isDashing) scr_walk();
scr_dash();

// Check that player has dashed.
if (!hasDashed and key_dash and (hspeed != 0 or vspeed != 0)) hasDashed = true;
if (hasDashed and keyboard_check_pressed(vk_enter)) room_goto_next();
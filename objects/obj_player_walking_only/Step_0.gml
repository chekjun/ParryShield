scr_get_player_input();
scr_walk();

// Check that player has walked in 4 directions.
if (!hasMovedUp and key_up) hasMovedUp = true;
if (!hasMovedLeft and key_left) hasMovedLeft = true;
if (!hasMovedDown and key_down) hasMovedDown = true;
if (!hasMovedRight and key_right) hasMovedRight = true;
if (hasMovedUp and hasMovedLeft and hasMovedDown and hasMovedRight and keyboard_check_pressed(vk_enter)) room_goto_next();
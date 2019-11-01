// Remove everything else
instance_deactivate_all(true);

// Change tracks
audio_stop_all();
audio_play_sound(4, 1, false);

x = (room_width / 2);
y = (room_height / 2);

index = 0;
text_alpha = 0.01;
title = " ";
sub1 = " ";
sub2 = " ";

// Title
line0[0] = " ";
line0[1] = " ";
line0[2] = "Artist";
line0[3] = "Coder";
line0[4] = "Quality Assurance";
line0[5] = "Designers";
line0[6] = "Sound Engineer";
line0[7] = "Producer";
line0[8] = "Additional Credits To";
line0[9] = " ";
line0[10] = " ";
line0[11] = " ";

// Center
line1[0] = "A Kyzure Studios Production";
line1[1] = ".Parry#Shield (2019)";
line1[2] = "Mei Lun";
line1[3] = "Lim Chek Jun";
line1[4] = "Im Dong Won";
line1[5] = "Marcus";
line1[6] = "Marcus";
line1[7] = "Timothy";
line1[8] = "Makai Symphony";
line1[9] = "And Most Importantly";
line1[10] = "You";
line1[11] = " ";

// Last
line2[0] = " ";
line2[1] = " ";
line2[2] = "Timothy";
line2[3] = " ";
line2[4] = " ";
line2[5] = "Timothy";
line2[6] = " ";
line2[7] = " ";
line2[8] = " ";
line2[9] = " ";
line2[10] = " ";
line2[11] = " ";



timer = 120;
// appear/disappear/stay
ads = 1;
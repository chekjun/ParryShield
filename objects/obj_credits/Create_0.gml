// Remove everything else
instance_deactivate_all(true);

// Change tracks
audio_stop_all();
audio_play_sound(bgm_credits, 1, false);

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
line0[2] = "Artists";
line0[3] = "Coder";
line0[4] = "Quality Assurance";
line0[5] = "Designer";
line0[6] = "Producer";
line0[7] = "Additional Credits To";
line0[8] = " ";
line0[9] = " ";
line0[10] = " ";
line0[11] = " ";
line0[12] = " ";

// Center
line1[0] = "A Kyzure Studios Production";
line1[1] = ".Parry#Shield (2019)";
line1[2] = "Meilun";
line1[3] = "Chek Jun";
line1[4] = "Dong Won";
line1[5] = "Marcus";
line1[6] = "Timothy";
line1[7] = "Makai Symphony (https://soundcloud.com/makai-symphony)";
line1[8] = "Tam Music Factory (https://www.tam-music.com/interface)";
line1[9] = "Philippe Groarke (https://opengameart.org/content/punches-hits-swords-and-squishes)";
line1[10] = "And Most Importantly";
line1[11] = "You";
line1[12] = " ";

// Last
line2[0] = " ";
line2[1] = " ";
line2[2] = "Timothy";
line2[3] = " ";
line2[4] = " ";
line2[5] = " ";
line2[6] = " ";
line2[7] = "AudioPhil/PMSFX (https://www.pmsfx.com/free)";
line2[8] = "celestialghost8 (https://opengameart.org/content/victory)";
line2[9] = "Independent.nu (https://opengameart.org/content/37-hitspunches)";
line2[10] = " ";
line2[11] = " ";
line2[12] = " ";



timer = 120;
// appear/disappear/stay
ads = 1;
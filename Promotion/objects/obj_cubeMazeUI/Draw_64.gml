// Inherit the parent event
//event_inherited();

//Background
draw_set_color(c_black);
draw_rectangle(track_start_x - 20, ui_y - 120, track_end_x + 30, ui_y + 120, false);

//Tunnel
draw_set_color(c_white);
draw_set_alpha(1.0);

//Top
draw_line_width(track_start_x, ui_y - tunnel_start_half_height, track_end_x, ui_y-tunnel_end_half_height, 4);

//Bottom
draw_line_width(track_start_x, ui_y + tunnel_start_half_height, track_end_x, ui_y + tunnel_end_half_height, 4);

//Player
draw_set_colour(c_aqua);
draw_rectangle(cube_x - (cube_size/2), cube_y - (cube_size/2), cube_x + (cube_size/2), cube_y + (cube_size/2), false);

//Goal
draw_set_color(is_solved ? c_lime : c_orange);
draw_rectangle(track_end_x, ui_y - tunnel_end_half_height, track_end_x + 10, ui_y + tunnel_end_half_height, false);

//Text
draw_set_halign(fa_center);

// Objective text at the top (Drawn in red/orange to indicate a danger maze, or white)
draw_set_color(c_white);
if (!is_solved) {
    draw_text(ui_x, ui_y - 120, "STABILIZE THE CORES: DO NOT TOUCH THE WALLS");
} else {
    draw_set_color(c_lime);
    draw_text(ui_x, ui_y - 120, "SYSTEM UNLOCKED - CALIBRATION COMPLETE");
}

// Exit prompt text at the bottom
draw_set_color(c_gray);
draw_text(ui_x, ui_y + 100, "Press [ESC] to return to the world");

// Reset alignment safety switch so subsequent UI layers render cleanly
draw_set_halign(fa_left);
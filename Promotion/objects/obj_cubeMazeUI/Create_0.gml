// Inherit the parent event
event_inherited();

//Game State Tracking
is_solved = false;
is_holding_cube = false;

//Window and sprites specs
ui_x = display_get_gui_width() / 2;
ui_y = display_get_gui_height() / 2;

track_start_x = ui_x - 300;
track_end_x = ui_x + 300;

//Tunnel size
tunnel_start_half_height = 80;
tunnel_end_half_height = 12;

cube_x = track_start_x + 10;
cube_y = ui_y;
cube_size = 16;
move_speed = 2;

goal_x = ui_x + 200;
goal_y = ui_y;
goal_size = 32;



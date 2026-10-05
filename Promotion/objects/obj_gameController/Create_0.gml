global.puzzle_states = {
	
	pipe_game : noone,
	maze_game : false,
	light_game : false
	
};

max_time = 60;
current_time_remaining = max_time;

time_per_second = game_get_speed(gamespeed_fps);

timer_active = false;

day_count = 1;
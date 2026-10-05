if (timer_active) {
	
	if (current_time_remaining > 0) {
		
		current_time_remaining -= (1/time_per_second);
		
	} else {
	
		current_time_remaining = 0;
		timer_active = false;
		
		
		global.puzzle_states.pipe_game = noone;
        global.puzzle_states.maze_game = false;
        global.puzzle_states.light_game = false;
	
		if (room_exists(Lose)){
			room_goto(Lose);
		} else {
			show_debug_message("Room does not exist");
		}
	}
}
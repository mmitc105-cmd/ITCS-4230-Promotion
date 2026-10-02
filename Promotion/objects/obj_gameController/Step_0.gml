if(current_time_remaining > 0){
	current_time_remaining -= (1/time_per_second);
}
else{
	current_time_remaining = 0;
	timer_active = false;
	
	//Play sound
	
	//Reset Game states upon failure
	global.puzzle_states.pipe_game = noone;
	global.puzzle_states.maze_game = false;
	global.puzzle_states.light_game = false;
	
	//Send player to lose screen (USING MAIN MENU FOR NOW)
	room_goto(Start_Menu);
	
}
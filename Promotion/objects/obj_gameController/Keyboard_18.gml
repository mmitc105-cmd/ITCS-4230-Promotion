if (keyboard_check_pressed(ord("T"))){ //Resets timer
	current_time_remaining = max_time; 
}

if (keyboard_check_pressed(ord("P"))) { //Solves all puzzles
	global.pipe_maze_solved = true;
	global.puzzle_states.maze_game = true;
	global.puzzle_states.light_game = true;
}

if (keyboard_check_pressed(ord("L"))){ //Sends to lose screen
	room_goto(Lose);
}

if (keyboard_check_pressed(ord("O"))) { //Sets time to 1 second to test win/lose
	current_time_remaining = 1;
}

if (keyboard_check_pressed(ord("N"))){ //Cycle through rooms
	room_goto_next();
}
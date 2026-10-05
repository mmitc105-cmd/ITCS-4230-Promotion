if (variable_global_exists("puzzle_states")) {
	
	draw_set_colour(c_black);
	
	draw_text(20, 50, "--- OBJECTIVES ---");
	
	//Pipe maze
	pipe_status = " [ ] Fix Pipes";
	if (global.puzzle_states[$ "pipe_game"] != noone) {

		if (global.pipe_maze_solved == true) {
			pipe_status = " [X] Fix Pipes - COMPLETE";
		} else {
			pipe_status = " [/] Fix Pipes - IN PROGRESS";
		}
	}
	draw_text(20, 80, pipe_status);
		
	//Maze Game
	maze_status = " [ ] Box Maze";
	if (global.puzzle_states[$ "maze_game"] == true) {
		maze_status = " [X] Box Maze - COMPLETE";
	}
	draw_text(20, 110, maze_status);
	
	//Lights game
	lights_status = " [ ] Lights Out";
	if (global.puzzle_states[$ "light_game"] == true) {
		lights_status = " [X] Lights Out - COMPLETE";
	}
	draw_text(20, 140, lights_status);
	
}
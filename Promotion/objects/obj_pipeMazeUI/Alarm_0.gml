save_angles = global.puzzle_states[$ my_puzzle_ID];

if (save_angles != noone) {
	is_solved = true;
	
	for (r = 0; r < grid_height; r++) {
		for (c = 0; c < grid_width; c++) {
			puzzle_grid[r][c].angle = save_angles[r][c];
		}
	}
	
	pipe_win_con = check_pipe_connection(puzzle_grid);
	if (pipe_win_con) {
		is_solved = true;
	} else {
		is_solved = false;
	}
}
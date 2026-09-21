// Helper function
// Returns [up, right, down, left] openings for a pipe at its current angle
function get_pipe_dirs(cell){

	// Openings at angle 0
	base_dirs = [false, false, false, false];

	switch (cell.sprite) {
		case spr_pipeStraight: base_dirs = [false, true, false, true]; break;
		case spr_pipe90:       base_dirs = [true, true, false, false]; break;
		case spr_pipeT:        base_dirs = [true, true, false, true]; break;
	}

	// Positive angles turn the sprite counter-clockwise
	rot_steps = (round(cell.angle / 90) % 4 + 4) % 4;

	rotated_dirs = [false, false, false, false];
	for (dir_index = 0; dir_index < 4; dir_index++){
		rotated_dirs[dir_index] = base_dirs[(dir_index + rot_steps) % 4];
	}

	return rotated_dirs;
}

// Main check
// Returns true if the flow reaches the drain under [5][5]
function check_pipe_connection(grid){
	h = array_length(grid);
	w = array_length(grid[0]);

	// Fluid pours in from the fake top pipe, so [0][0] needs its top open
	start_dirs = get_pipe_dirs(grid[0][0]);
	if (!start_dirs[0]) {
		show_debug_message("Flow blocked -> [0][0] has no opening at the top");
		return false;
	}

	// Track visited tiles so nothing gets checked twice
	visited = array_create(h);
	for (i = 0; i < h; i++){
		visited[i] = array_create(w, false);
	}

	// Steps for each direction: up, right, down, left
	row_step = [-1, 0, 1, 0];
	col_step = [0, 1, 0, -1];

	// Tiles waiting to be checked, starting with [0][0]
	to_check = [[0, 0]];
	visited[0][0] = true;

	while (array_length(to_check) > 0) {

		flow_pos = array_pop(to_check);
		current_r = flow_pos[0];
		current_c = flow_pos[1];
		cell_dirs = get_pipe_dirs(grid[current_r][current_c]);

		show_debug_message("Flow Tracing -> Cell [" + string(current_r) + "][" + string(current_c) + "]");
		show_debug_message("Exposed directions: " + string(cell_dirs[0]) + "," + string(cell_dirs[1]) + "," + string(cell_dirs[2]) + "," + string(cell_dirs[3]));

		// Win condition: bottom right tile with its bottom open
		if (current_r == (h-1) && current_c == (w-1) && cell_dirs[2]) {
			show_debug_message("SUCCESS -> Flow reached the drain at [" + string(current_r) + "][" + string(current_c) + "]");
			return true;
		}

		// Try every open side of this pipe
		for (out_dir = 0; out_dir < 4; out_dir++){

			if (!cell_dirs[out_dir]) continue;

			next_r = current_r + row_step[out_dir];
			next_c = current_c + col_step[out_dir];

			// Skip anything outside the grid
			if (next_r < 0 || next_r >= h || next_c < 0 || next_c >= w) continue;

			// Skip tiles already checked
			if (visited[next_r][next_c]) continue;

			// The next pipe has to open back toward this one
			next_dirs = get_pipe_dirs(grid[next_r][next_c]);
			if (next_dirs[(out_dir + 2) % 4]) {
				visited[next_r][next_c] = true;
				array_push(to_check, [next_r, next_c]);
			}
		}
	}

	show_debug_message("Flow stopped -> No route reaches the drain");
	return false;
}


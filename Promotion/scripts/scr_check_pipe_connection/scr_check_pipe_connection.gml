function check_pipe_connection(grid){
	h = array_length(grid);
	w = array_length(grid[0]);

	// Helper function
	get_cell_directions = function(cell) {
		
		base_up = false; 
		base_right = false;
		base_down = false;
		base_left = false;
		
		switch (cell.sprite) {
			case spr_pipeStraight: base_left = true; base_right = true; break;
			case spr_pipe90:       base_up = true; base_right = true; break;
			case spr_pipeT:        base_left = true; base_up = true; base_right = true; break;
		}
		
		rot_steps = floor((cell.angle % 360)/90);
		if (rot_steps < 0) rot_steps += 4;
		dirs = [base_up, base_right, base_down, base_left];
		repeat (rot_steps) {
			last = dirs[3]; dirs[3] = dirs[2]; dirs[2] = dirs[1]; dirs[1] = dirs[0]; dirs[0] = last;
		}
		return dirs;
	}

	// Tracers
	current_r = 0;
	current_c = 0;
	
	// Track visited tiles to avoid infinite tracking loops
	visited = array_create(h);
	for (i = 0; i < h; i++){
		visited[i] = array_create(w, false);
	}
	
	// Fluid pours down from the fake top pipe into [0][0] (Direction Index 0 = UP)
	incoming_from = 0; 

	// 3. Trace the path loop
	while (true) {

		visited[current_r][current_c] = true;
		
		cell = grid[current_r][current_c];
		dirs = get_cell_directions(cell);
		
		show_debug_message("Flow Tracing -> Cell [" + string(current_r) + "][" + string(current_c) + "]");
		show_debug_message("Exposed directions: " + string(dirs[0]) + "," + string(dirs[1]) + "," + string(dirs[2]) + "," + string(dirs[3]));
		
		// Rule A: Does this pipe align with where the water is flowing from?
		if (dirs[incoming_from] == false){
			return false;
		}
		
		// Find where the fluid shoots out of this pipe next
		out_dir = -1;
		
		// 1. Check Down first (fluid naturally falls)
		if (dirs[2] && incoming_from != 2) out_dir = 2;
		// 2. Check Right second
		else if (dirs[1] && incoming_from != 1) out_dir = 1;
		// 3. Check Up third
		else if (dirs[0] && incoming_from != 0) out_dir = 0;
		// 4. Check Left last
		else if (dirs[3] && incoming_from != 3) out_dir = 3;

		
		// Rule B: Handle win condition right at the drain exit!
		if (current_r == (h-1) && current_c == (w-1)) {
			if (out_dir == 2 || dirs[2]) return true; 
		}
		
		if (out_dir == -1) return false;
		
		next_r = current_r;
		next_c = current_c;
		next_incoming = -1;
		
		if (out_dir == 0) { next_r--; next_incoming = 2; }
		if (out_dir == 1) { next_c++; next_incoming = 3; }
		if (out_dir == 2) { next_r++; next_incoming = 0; }
		if (out_dir == 3) { next_c--; next_incoming = 1; }
		
		// Rule C: Did the path shoot outside the puzzle grid boundaries?
		if (next_r < 0 || next_r >= h || next_c < 0 || next_c >= w) {
			return false;
		}
		
		// Rule D: Prevent backtracking into a pipe we've already walked through
		if (visited[next_r][next_c]) return false;
		
		// Advance tracer positions forward
		current_r = next_r;
		current_c = next_c;
		incoming_from = next_incoming;
	}
}

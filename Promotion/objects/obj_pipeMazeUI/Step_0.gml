// Inherit the parent event
event_inherited();

if(!is_solved){
	if(mouse_check_button_pressed(mb_left)) {
		mx = device_mouse_x_to_gui(0);
		my = device_mouse_y_to_gui(0);
		grid_pixel_width = grid_width * cell_size;
		grid_pixel_height = grid_height * cell_size;
	
		if(mx >= start_x && mx < start_x + grid_pixel_width &&
		   my >= start_y && my < start_y + grid_pixel_height) {
			clicked_col = floor((mx - start_x) / cell_size);
			clicked_row = floor((my - start_y) / cell_size);
		
			cell = puzzle_grid[clicked_row][clicked_col];
			cell.angle -= 90;
			if(cell.angle < 0) cell.angle += 360;
			
			// 1. Take a snapshot of the grid angles right after the click
			current_angles = [];
			for (r = 0; r < grid_height; r++) {
				current_angles[r] = [];
				for (c = 0; c < grid_width; c++) {
					current_angles[r][c] = puzzle_grid[r][c].angle;
				}
			}
			
			// 2. Save that snapshot directly to your global tracker
			global.puzzle_states[$ my_puzzle_ID] = current_angles;
			
			// 3. Win condition check
			pipe_win_con = check_pipe_connection(puzzle_grid);
			if (pipe_win_con){
				is_solved = true;
				global.pipe_maze_solved = true; // Mark as completely solved globally
				show_debug_message("You did it! Pipes are connected!");
			} else {
				global.pipe_maze_solved = false; // Keep it marked unsolved globally
			}
		   }
	}
}
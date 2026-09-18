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
			
			//Win condition
			pipe_win_con = check_pipe_connection(puzzle_grid);
			if (pipe_win_con){
				is_solved = true;
				show_debug_message("You did it! Pipes are connected!");
			}
		   }
	}
}
// Inherit the parent event
event_inherited();

if (keyboard_check(vk_escape)) {
	instance_destroy();
}

//Checking mouse input
if (!is_solved && mouse_check_button_pressed(mb_left)){
	mx = device_mouse_x_to_gui(0);
	my = device_mouse_y_to_gui(0);
	
	grid_pixel_size = grid_size * cell_size;
	
	//Boundary check
	if (mx >= start_x && mx < start_x + grid_pixel_size &&
		my >= start_y && my < start_y + grid_pixel_size) {
			clicked_col = floor((mx - start_x) / cell_size)
			clicked_row = floor((my - start_y) / cell_size)
			
			flip_light = function (r, c) {
				if (r >= 0 && r < grid_size && c >= 0 && c < grid_size){
					lights_grid[r][c] = !lights_grid[r][c];
				}
		}
		
			// Execute cross-flip sequence centered on your click coordinate targets!
			flip_light(clicked_row, clicked_col);     // Center
			flip_light(clicked_row - 1, clicked_col); // Up
			flip_light(clicked_row + 1, clicked_col); // Down
			flip_light(clicked_row, clicked_col - 1); // Left
			flip_light(clicked_row, clicked_col + 1); // Right
		
			//WIN CON
			all_off = true;
			for (r = 0; r < grid_size; r++){
				for (c = 0; c < grid_size; c++){
					if (lights_grid[r][c] == true) {
						all_off = false;
					}
				}
			}
		
			if (all_off) {
				is_solved = true;
				show_debug_message("-----------LIGHTS OUT----------------")
			}
		}
}
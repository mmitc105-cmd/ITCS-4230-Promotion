// Inherit the parent event
event_inherited();

//Initialized variables
is_solved = false;
grid_size = 3;
cell_size = 64;

//Dimensions
ui_x = display_get_gui_width()/2;
ui_y = display_get_gui_height()/2;
start_x = ui_x - ((grid_size*cell_size)/2);
start_y = ui_y - 100;

//Creating Grid
lights_grid = array_create(grid_size);
for (i = 0; i < grid_size; i++){
	lights_grid[i] = array_create(grid_size, false);
}

//Actual grid layout
lights_grid[1][1] = true; // Center point
lights_grid[0][1] = true; // Top center
lights_grid[2][1] = true; // Bottom center
lights_grid[1][0] = true; // Middle left
lights_grid[1][2] = true; // Middle right
lights_grid[0][0] = true; // Top left
lights_grid[0][2] = true; // Top right
lights_grid[2][0] = true; // Bottom left
lights_grid[2][2] = true; // Bottom right
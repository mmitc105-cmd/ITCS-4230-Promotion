// Inherit the parent event
event_inherited();

//Size Variables
grid_width = 3;
grid_height = 3;
cell_size = 64;

//Placement of UI
ui_x = display_get_gui_width() / 2;
ui_y = display_get_gui_height() / 2;
start_x = ui_x - ((grid_width*cell_size)/2);
start_y = ui_y - 200;

puzzle_grid = [

	[ {sprite: spr_pipe90, angle: 0}, {sprite: spr_pipeStraight, angle: 90}, {sprite: spr_pipeT, angle: 0} ],
	[ {sprite: spr_pipeStraight, angle: 0}, {sprite: spr_pipe90, angle: 180}, {sprite: spr_pipeStraight, angle: 90} ],
	[ {sprite: spr_pipeT, angle: 270}, {sprite: spr_pipeStraight, angle: 0}, {sprite: spr_pipe90, angle: 90} ]
	];

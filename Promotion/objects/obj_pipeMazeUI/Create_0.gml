// Inherit the parent event
event_inherited();

//Size Variables
grid_width = 6;
grid_height = 6;
cell_size = 163;

//Placement of UI
ui_x = display_get_gui_width() / 2;
ui_y = 200;
start_x = ui_x - ((grid_width*cell_size)/2);
start_y = ui_y - 200;

puzzle_grid = [

	[ {sprite: spr_pipe90, angle: 0}, {sprite: spr_pipeT, angle: 90}, {sprite: spr_pipeStraight, angle: 0}, {sprite: spr_pipeT, angle: 270}, {sprite: spr_pipe90, angle: 0}, {sprite: spr_pipeStraight, angle: 90} ],
	[ {sprite: spr_pipe90, angle: 90}, {sprite: spr_pipeStraight, angle: 90}, {sprite: spr_pipe90, angle: 270}, {sprite: spr_pipe90, angle: 270}, {sprite: spr_pipe90, angle: 180}, {sprite: spr_pipeT, angle: 90} ],
	[ {sprite: spr_pipeT, angle: 270}, {sprite: spr_pipeStraight, angle: 0}, {sprite: spr_pipeT, angle: 270}, {sprite: spr_pipeStraight, angle: 0}, {sprite: spr_pipe90, angle: 90}, {sprite: spr_pipeStraight, angle: 0} ],
	[ {sprite: spr_pipe90, angle: 180}, {sprite: spr_pipeT, angle: 90}, {sprite: spr_pipe90, angle: 0}, {sprite: spr_pipeT, angle: 90}, {sprite: spr_pipeStraight, angle: 0}, {sprite: spr_pipe90, angle: 0} ],
	[ {sprite: spr_pipeT, angle: 0}, {sprite: spr_pipeStraight, angle: 180}, {sprite: spr_pipe90, angle: 270}, {sprite: spr_pipe90, angle: 0}, {sprite: spr_pipe90, angle: 0}, {sprite: spr_pipeT, angle: 180}],
	[ {sprite: spr_pipeStraight, angle: 90}, {sprite: spr_pipe90, angle: 270}, {sprite: spr_pipeT, angle: 270}, {sprite: spr_pipeStraight, angle: 90}, {sprite: spr_pipe90, angle: 0}, {sprite: spr_pipe90, angle: 180}]
	
	];
	
is_solved = false;

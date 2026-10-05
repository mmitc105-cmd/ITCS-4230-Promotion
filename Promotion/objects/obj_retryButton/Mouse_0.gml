global.puzzle_states.pipe_game = noone;
global.puzzle_states.maze_game = false;
global.puzzle_states.light_game = false;
obj_gameController.day_count += 1;

if (instance_exists(obj_gameController)){
	
	obj_gameController.current_time_remaining = obj_gameController.max_time;
	obj_gameController.timer_active = true;
	
} else {
	show_debug_message("Controller does not exist");
}

if (room_exists(Room1)) {
	
	room_goto(Room1);
	
} else {
	show_debug_message("Room does not exist");
}
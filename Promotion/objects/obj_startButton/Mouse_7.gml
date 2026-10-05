if (instance_exists(obj_gameController)){
	
	//Resets and starts timer
	obj_gameController.current_time_remaining = obj_gameController.max_time;
	obj_gameController.timer_active = true;
	
	//Reset puzzle states
	global.puzzle_states.pipe_game = noone;
	global.puzzle_states.maze_game = false;
	global.puzzle_states.light_game = false;
	
}

if (room_exists(Room1)){
	
	room_goto(Room1);
	
} else {
	//Fail safe to check if room loads
	show_debug_message("ROOM DOES NOT EXIST");
	image_index = 0; //Returns button to default state
}

audio_play_sound(snd_menuClicked, 1, false);
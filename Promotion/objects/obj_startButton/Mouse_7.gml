if (instance_exists(obj_gameController)){
	
	
	//Reset puzzle states
	global.puzzle_states.pipe_game = noone;
	global.puzzle_states.maze_game = false;
	global.puzzle_states.light_game = false;
	
}

if (room_exists(Intro)){
	
	room_goto(Intro);
	
} else {
	//Fail safe to check if room loads
	show_debug_message("ROOM DOES NOT EXIST");
	image_index = 0; 
}

audio_play_sound(snd_menuClicked, 1, false);
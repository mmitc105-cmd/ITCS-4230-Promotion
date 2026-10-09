if (timer_active) {
	
	if (current_time_remaining > 0) {
		
		current_time_remaining -= (1/time_per_second);
		
	} else {
	
		current_time_remaining = 0;
		timer_active = false;
		
		sprite_index = spr_timer;
		image_index = 0;
		
		
		//AUDIO HERE
		
		alarm[0] = 2 *time_per_second;
			
		global.puzzle_states.pipe_game = noone;
        global.puzzle_states.maze_game = false;
        global.puzzle_states.light_game = false;
	
	}
}

if (alarm[0] > 0) {
	
    anim_speed = 0.2; 
    
    image_index += anim_speed;
    
    if (image_index >= sprite_get_number(sprite_index)) {
        image_index = 0; 
    }
}
audio_play_sound(snd_menuClicked, 1, false);


if (instance_exists(obj_introController)) {

	total_panels = sprite_get_number(obj_introController.sprite_index);
	
	if (obj_introController.image_index < total_panels - 1) {
	
		obj_introController.image_index += 1;
	
	
	} else {
	
		if (instance_exists(obj_gameController)) {
		
				//Resets and starts timer
			obj_gameController.current_time_remaining = obj_gameController.max_time;
			obj_gameController.timer_active = true;
		
		}
		
		if (room_exists(Room1)) {
		
			room_goto(Room1);
		
		} else {
		
			show_debug_message("Room1 does not exist!")
		
		}
	
	}

}

image_index = 0;
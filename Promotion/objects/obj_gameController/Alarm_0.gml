image_speed = 0;
image_index = 0;
sprite_index = -1;

if (room_exists(Lose)){
			room_goto(Lose);
		} else {
			show_debug_message("Room does not exist");
		}
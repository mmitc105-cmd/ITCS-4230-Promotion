// Inherit the parent event
event_inherited();

if (keyboard_check(vk_escape)){
	instance_destroy();
}

if (!is_solved){
	
	//Input commands
	move_h = (keyboard_check(vk_right) || keyboard_check(ord("D"))) - (keyboard_check(vk_left) || keyboard_check(ord("A")));
	move_v = (keyboard_check(vk_down) || keyboard_check(ord("S"))) - (keyboard_check(vk_up) || keyboard_check(ord("W")));
	
	cube_x += move_h * move_speed;
	cube_y += move_v * move_speed;
	
	//Player cannot go left of start
	if (cube_x < track_start_x) cube_x = track_start_x;
	
	//Tunnel mechanics
	factor = (cube_x - track_start_x) / (track_end_x - track_start_x);
	factor = clamp(factor, 0, 1);
	
	current_half_height = lerp(tunnel_start_half_height, tunnel_end_half_height, factor);
	
	ceiling_y = ui_y - current_half_height;
	floor_y = ui_y + current_half_height;
	
	//Collisions
	cube_top = cube_y - (cube_size/2);
	cube_bottom = cube_y + (cube_size/2);
	
	if (cube_top <= ceiling_y || cube_bottom >= floor_y){
		cube_x = track_start_x + 10;
		cube_y = ui_y;
		show_debug_message("-----------------BUZZ COLLISION--------------");
	}
	
	//Win con
	if (cube_x >= track_end_x){
		is_solved = true;
		show_debug_message("-------------------CLEARED-----------------");
	}
}
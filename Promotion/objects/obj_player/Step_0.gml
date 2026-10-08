//Movement keys (either arrow keys or WASD
key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
key_down = keyboard_check(vk_down) || keyboard_check(ord("S"));
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));

//Player Speed
if(instance_exists(obj_UIParent)){
	move_speed = 0;
}
else{
move_speed = 4;
}

//Horizontal and vertical directions
h_input = key_right - key_left;
if (h_input != 0 && !instance_exists(obj_UIParent)) {
	image_xscale = h_input;	
}

v_input = key_down - key_up;

h_speed = h_input * move_speed;
v_speed = v_input * move_speed;
if (h_speed == 0 && v_speed == 0){
	sprite_index = spr_player_idle16;
} else if (v_input > 0){
	sprite_index = spr_player_down8;
} else if (v_input < 0){
	sprite_index = spr_player_up8;
} else if (v_input < 0 and h_input !=0){
	sprite_index = spr_player_up8;
}else {
	sprite_index = spr_player_down8;
}

//Clamping the player
half_width = sprite_width /2;
half_height = sprite_height/2;

x = clamp(x, half_width, room_width - half_width);
y = clamp(y, half_height, room_height - half_height);

//Collision

//Horizontal desk
if(place_meeting(x + h_speed, y, obj_solid)){
	while(!place_meeting(x + sign(h_speed), y, obj_solid)){
		x += sign(h_speed)
	}
	h_speed = 0;
}


//Vertical desk
if(place_meeting(x, y + v_speed, obj_solid)){
	while(!place_meeting(x, y + sign(v_speed), obj_solid)){
		y += sign(v_speed);
	}
	v_speed = 0;
}

//Horizontal door
if(place_meeting(x + h_speed, y, obj_exitDoor)){
	while(!place_meeting(x + sign(h_speed), y, obj_exitDoor)){
		x += sign(h_speed)
	}
	h_speed = 0;
}

//Vertical door
if(place_meeting(x, y + v_speed, obj_exitDoor)){
	while(!place_meeting(x, y + sign(v_speed), obj_exitDoor)){
		y += sign(v_speed);
	}
	v_speed = 0;
}

x += h_speed;
y += v_speed;


//Interacting with the desks/puzzles
if(keyboard_check_pressed(ord("E"))){
	interact_dist = 4;
	target_solid = noone;
	
	
	if(place_meeting(x + h_input * interact_dist, y, obj_solid)){
		target_solid = instance_place(x + h_input * interact_dist, y, obj_solid);
	}
	else if(place_meeting(x, y + v_input * interact_dist, obj_solid)){
		target_solid = instance_place(x, y + v_input * interact_dist, obj_solid);
	}
	else{
		target_solid = instance_nearest(x,y,obj_solid);
		if(distance_to_object(target_solid) > interact_dist){
			target_solid = noone;
		}
	}

	if (target_solid != noone && !instance_exists(obj_UIParent)){
		if (variable_instance_exists(target_solid,"puzzle_ID") && variable_instance_exists(target_solid, "save_key")) {
			
			target_puzzle = target_solid.puzzle_ID;
			target_save_string = target_solid.save_key;
			
			if (target_puzzle != noone){
				ui_instance = instance_create_depth(0,0,0, target_puzzle);
				
				ui_instance.my_puzzle_ID = target_save_string;
			}
		}
		
		
			
	}
	
	
}

//Exit door

if (keyboard_check_pressed(ord("E"))){

	check_dist = 4;
	door_target = noone;
	
	
	if (place_meeting(x,y -check_dist, obj_exitDoor)){
		door_target = instance_place(x, y-check_dist, obj_exitDoor);
	} else {
		door_target = instance_nearest(x, y, obj_exitDoor);
		if (distance_to_object(door_target) > check_dist){
			door_target = noone;
		}
	}
	
	if (door_target != noone and !instance_exists(obj_UIParent)){
		
		if (global.puzzle_states.pipe_game == true and
			global.puzzle_states.maze_game == true and
			global.puzzle_states.light_game == true){
		
			if (instance_exists(obj_gameController)){
				obj_gameController.timer_active = false;
			}
		
			if (room_exists(Win)){
				room_goto(Win);
			} else {
				show_debug_message("Room does not exist");
			}
		} else {
			show_debug_message("Objectives not complete!")
		}
	}
	
}
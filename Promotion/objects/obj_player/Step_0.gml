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
v_input = key_down - key_up;

h_speed = h_input * move_speed;
v_speed = v_input * move_speed;

//Clamping the player
half_width = sprite_width /2;
half_height = sprite_height/2;

x = clamp(x, half_width, room_width - half_width);
y = clamp(y, half_height, room_height - half_height);

//Collision

//Horizontal
if(place_meeting(x + h_speed, y, obj_solid)){
	while(!place_meeting(x + sign(h_speed), y, obj_solid)){
		x += sign(h_speed)
	}
	h_speed = 0;
}

x += h_speed;

//Vertical
if(place_meeting(x, y + v_speed, obj_solid)){
	while(!place_meeting(x, y + sign(v_speed), obj_solid)){
		y += sign(v_speed);
	}
	v_speed = 0;
}

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
		instance_create_depth(0,0,0,obj_pipeMazeUI);
	}
}
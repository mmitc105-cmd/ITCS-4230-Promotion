if(keyboard_check_pressed(vk_escape)){
	with(obj_player){
		move_speed = 4;
	}
	instance_destroy();
}
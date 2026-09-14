if(current_time_remaining > 0){
	current_time_remaining -= (1/time_per_second);
}
else{
	current_time_remaining = 0;
	//Play sound
}
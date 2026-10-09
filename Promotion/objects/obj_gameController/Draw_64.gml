if (timer_active or alarm[0] > 0) {

time_percentage = (current_time_remaining / max_time) * 100;

bar_width = 200;
bar_height = 20;
gui_width = display_get_gui_width();

x1 = gui_width - bar_width - 107; 
x2 = gui_width - 115;             
y1 = 150;                         
y2 = y1 + bar_height;            

draw_sprite(spr_timer, image_index, x1 + 75, y1 + 10);

draw_rectangle_color(x1, y1, x2, y2, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);

fill_x2 = x1 + (bar_width * (time_percentage / 100));

if (time_percentage > 0) {
    draw_rectangle_color(x1, y1, fill_x2, y2, c_orange, c_orange, c_yellow, c_yellow, false);
}

draw_rectangle_color(x1, y1, x2, y2, c_yellow, c_yellow, c_yellow, c_yellow, true);


}

if(timer_active){
	day_text = "DAY: " + string(day_count);
	draw_set_colour(c_black);
	draw_text(display_get_gui_width() -200, display_get_height()-200, day_text);
}
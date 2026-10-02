if (timer_active) {

time_percentage = (current_time_remaining / max_time) * 100;

bar_width = 200;
bar_height = 20;
gui_width = display_get_gui_width();

x1 = gui_width - bar_width - 107; 
x2 = gui_width - 115;             
y1 = 150;                         
y2 = y1 + bar_height;            

draw_sprite(spr_timer, 0, x1 -75, y1 - 150);

draw_rectangle_color(x1, y1, x2, y2, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);

fill_x2 = x1 + (bar_width * (time_percentage / 100));

if (time_percentage > 0) {
    draw_rectangle_color(x1, y1, fill_x2, y2, c_orange, c_orange, c_yellow, c_yellow, false);
}

draw_rectangle_color(x1, y1, x2, y2, c_yellow, c_yellow, c_yellow, c_yellow, true);


}
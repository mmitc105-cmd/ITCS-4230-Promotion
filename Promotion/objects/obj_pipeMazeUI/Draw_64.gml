// Inherit the parent event
event_inherited();

ui_x = display_get_gui_width()/2;
ui_y = display_get_gui_height()/2;

draw_set_color(c_ltgray);
draw_rectangle(ui_x-1000, ui_y-800, ui_x + 500, ui_y + 500, false);

for(r = 0; r < grid_height; r++){
	for(c = 0; c <grid_width; c++){
		cell = puzzle_grid[r][c];
		draw_x = start_x + (c*cell_size) + (cell_size/2);
		draw_y = start_y + (r*cell_size) + (cell_size/2);
		draw_sprite_ext(cell.sprite, 0, draw_x, draw_y, 1, 1, cell.angle, c_white, 1);
	}
}

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(ui_x, ui_y - 100, "PIPE MINIGAME");
draw_text(ui_x, ui_y, "Connect the flow...");
draw_text(ui_x, ui_y + 100, "Press 'Escape' to Exit");
draw_set_halign(fa_left);
		
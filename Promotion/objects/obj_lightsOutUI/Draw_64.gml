// Inherit the parent event
event_inherited();

for (r=0; r < grid_size; r++) {
	for (c=0; c < grid_size; c++) {
		
		bx1 = start_x + (c*cell_size);
		by1 = start_y + (r*cell_size);
		bx2 = bx1 + cell_size;
		by2 = by1 + cell_size;
		
		//Set button color
		if (lights_grid[r][c] == true) {
			draw_set_colour(c_yellow);
		} else {
			draw_set_colour(c_dkgray);
		}
		
		draw_rectangle(bx1 + 2, by1 + 2, bx2 - 2, by2 - 2, false);
		
		draw_set_colour(c_black);
		draw_rectangle(bx1, by1, bx2, by2, true);
	}
}

draw_set_halign(fa_center);
draw_set_colour(c_white);

if (!is_solved) {
	draw_text(ui_x, start_y - 40, "OVERRIDE CIRCUIT: SHUT OFF ALL TERMINALS");
} else {
	draw_set_colour(c_lime);
	draw_text(ui_x, start_y - 40, "CIRCUIT CLEARED - CORE SHUTDOWN COMPLETE")
}

draw_set_halign(fa_left);
draw_set_color(c_black);
    draw_set_alpha(0.7); // 70% opacity
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    
    // Reset alpha back to normal for text/images
    draw_set_alpha(1.0); 
    
    // Draw puzzle UI box
    var _ui_x = display_get_gui_width() / 2;
    var _ui_y = display_get_gui_height() / 2;
    
    draw_set_color(c_black);
    draw_rectangle(_ui_x-1000, _ui_y-800, _ui_x + 500, _ui_y + 500, false);
    
    // Draw text instructions for the puzzle
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(_ui_x, _ui_y - 100, "PUZZLE ACTIVE");
    draw_text(_ui_x, _ui_y, "Solve the riddle...");
    draw_text(_ui_x, _ui_y + 100, "Press 'Escape' to Exit");
    
    // Reset text alignment back to default
    draw_set_halign(fa_left);
if (global.puzzle_states[$ my_puzzle_ID] == true) {
    is_solved = true;
    
    // Position the cube securely at the end of the track
    cube_x = track_end_x + 10;
    cube_y = ui_y;
}
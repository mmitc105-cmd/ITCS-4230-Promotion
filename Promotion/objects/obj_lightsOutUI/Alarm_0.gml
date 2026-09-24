// Check if the puzzle was already solved previously
if (global.puzzle_states[$ my_puzzle_ID] == true) {
    is_solved = true;
    
    // Turn off every single light since the puzzle is cleared
    for (i = 0; i < grid_size; i++) {
        for (j = 0; j < grid_size; j++) {
            lights_grid[i][j] = false; 
        }
    }
}
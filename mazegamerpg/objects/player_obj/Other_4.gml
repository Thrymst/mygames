
    // Ensure the saved position variables are defined and valid before using them
    if (global.saved_px != -1 && global.saved_py != -1) {
        x = global.saved_px;
        y = global.saved_py;

        // Clear saved positions after applying them
        global.saved_px = -1;
        global.saved_py = -1;
    }



function restart_game(_target_rm) {
    // Initialize global variables for a new game
    global.saved_px = -1;
    global.saved_py = -1;
    global.enemyKillCount = 0;  // Reset kill count if necessary

    // Destroy any persistent instances that should not carry over to the new game
    if (instance_exists(player_obj)) {
        instance_destroy(player_obj);
    }
    // Add any other instances you want to destroy

    // Load the first level (e.g., RoomLevel1) for a new game
    with(instance_create_depth(0, 0, 0, loading_ani_obj)) {
        target_rm = _target_rm; // Set the target room to the first level
    }
}

//room Saving

   
function save_game(save_slot)
{
    var vroom = room;
	var filename = "savefile_" + string(save_slot) + ".ini";
    
    // Open the INI file for saving
    ini_open(filename);
    
    // Save current room
    ini_write_real("STATE", "current_room", vroom);
    
    // Save player position
    ini_write_real("PLAYER", "x", player_obj.x);
    ini_write_real("PLAYER", "y", player_obj.y);
    
    // Save total kill count
    ini_write_real("STATS", "total_kill_count", global.enemyKillCount);
    // Close the INI file
    ini_close();
}
function load_game(save_slot)
{
    // Open the INI file for loading
	 var filename = "savefile_" + string(save_slot) + ".ini";
    ini_open(filename);
    
    // Load the saved room or default to the first room
    var vroom = ini_read_real("STATE", "current_room", room_first);
    
    // Load player position
    global.saved_px = ini_read_real("PLAYER", "x", -1);
    global.saved_py = ini_read_real("PLAYER", "y", -1);
    
    // Load total kill count
    global.enemyKillCount = ini_read_real("STATS", "total_kill_count", 0);
    
    // Close the INI file
    ini_close();
    
    // Go to the saved room
    room_goto(vroom);
}






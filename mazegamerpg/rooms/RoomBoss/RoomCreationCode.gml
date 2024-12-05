if (!instance_exists(player_obj)) {
    instance_create_depth(x, y, 0, player_obj); // Create player only if it doesn't exist
}
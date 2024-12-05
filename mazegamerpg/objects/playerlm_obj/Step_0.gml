// Checking keyboard input
rightKey = keyboard_check(ord("D"));
leftKey = keyboard_check(ord("A"));
upKey = keyboard_check(ord("W"));
downKey = keyboard_check(ord("S"));

// Player movement
#region
    // Direction
    var _horizKey = rightKey - leftKey;
    var _vertKey = downKey - upKey;
    var moveDir = point_direction(0, 0, _horizKey, _vertKey);

    // Get x and y speed
    var _spd = 0;
    var _inputLevel = point_distance(0, 0, _horizKey, _vertKey);
    _inputLevel = clamp(_inputLevel, 0, 1);
    _spd = moveSpd * _inputLevel;

    xspd = lengthdir_x(_spd, moveDir);
    yspd = lengthdir_y(_spd, moveDir);

    // Collision
    if place_meeting(x + xspd, y, o_wall_obj) {
        xspd = 0;
    }

    if place_meeting(x, y + yspd, o_wall_obj) {
        yspd = 0;
    }

    x += xspd;
    y += yspd;

    // Player aim
    centerY = y + centerYOffset;

    // Aim direction based on mouse position
    aimDir = point_direction(x, centerY, mouse_x, mouse_y);

    // Set sprite/direction
    if _horizKey != 0 || _vertKey != 0 {
        // Use aim direction to determine facing
        face = round(aimDir / 90);
        if face == 4 { face = 0; }
        sprite_index = sprite[face];
    } else {
        // If there's no input, set to idle frame
        image_index = 0;
    }

    // Animation
    if xspd == 0 && yspd == 0 {
        image_index = 0;
    }

#endregion

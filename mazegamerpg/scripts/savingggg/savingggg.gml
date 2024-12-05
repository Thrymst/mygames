function saving_game(_slot) {
    // Store player position and HP
    global.saveData[_slot] = {
        playerX: player_obj.x,
        playerY: player_obj.y,
        enemyKillCount: global.enemyKillCount,
        room: room,
        createData: [],
        tntData: []
    };
    
    // Store create_obj instances
    var createNum = instance_number(create_obj);
    for (var i = 0; i < createNum; i++) {
        var _inst = instance_find(create_obj, i);
        global.saveData[_slot].createData[i] = {
            x: _inst.x,
            y: _inst.y
        };
    }
    
    // Store tnt_obj instances
    var tntNum = instance_number(tnt_obj);
    for (var i = 0; i < tntNum; i++) {
        var _inst = instance_find(tnt_obj, i);
        global.saveData[_slot].tntData[i] = {
            x: _inst.x,
            y: _inst.y
        };
    }
}
function loading_game(_slot) {
    var _data = global.saveData[_slot];
    if (_data == undefined) return;
    
    // Set room and player position
    room_goto(_data.room);
    player_obj.x = _data.playerX;
    player_obj.y = _data.playerY;
    //player_obj.hp = _data.playerHP;
    global.enemyKillCount = _data.enemyKillCount;

    // Destroy existing create_obj and tnt_obj instances
    instance_destroy(create_obj);
    instance_destroy(tnt_obj);

    // Recreate saved create_obj instances
    for (var i = 0; i < array_length(_data.createData); i++) {
        instance_create_depth(_data.createData[i].x, _data.createData[i].y, 0, create_obj);
    }

    // Recreate saved tnt_obj instances
    for (var i = 0; i < array_length(_data.tntData); i++) {
        instance_create_depth(_data.tntData[i].x, _data.tntData[i].y, 0, tnt_obj);
    }
}

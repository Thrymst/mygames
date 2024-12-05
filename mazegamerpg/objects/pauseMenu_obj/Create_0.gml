// In the Create event:
alpha = .6;
depth = -8000;
pos = 0;

// menu level 0
option [0,0] ="Back To Menu";
option [0,1] ="Save Game";
option [0,2] ="Load Game";
option [0,3] ="Quit Game";

// save game
option[1,0] = "Save file 01";
option[1,1] = "Save file 02";
option[1,2] = "Save file 03";
option[1,3] = "Save file 04";
option[1,4] = "-Back-";

// load game
option[2,0] = "Load Save file 01";
option[2,1] = "Load Save file 02";
option[2,2] = "Load Save file 03";
option[2,3] = "Load Save file 04";
option[2,4] = "-Back-";


op_length = array_length(option)
menu_level = 0;

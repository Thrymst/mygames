//get input

upKey = keyboard_check_pressed(vk_up) || mouse_wheel_up() || keyboard_check_pressed(ord("W"));
downKey = keyboard_check_pressed(vk_down) || mouse_wheel_down() || keyboard_check_pressed(ord("S"));
acceptKey = keyboard_check_pressed(vk_enter) || mouse_check_button_pressed(mb_left);

//save the current option menu
op_length = array_length(option[menu_level]);

//move trough the menu
pos += downKey - upKey;
if pos >= op_length{pos = 0};
if pos < 0 {pos = op_length-1};




//using the option

if acceptKey {
	
	var _sml = menu_level;
	
	switch(menu_level){
		//pasue menu
		case 0 :
			switch(pos)
			{
			//Menu
			case 0:

				with( instance_create_depth(0,0,0, loading_ani_obj))
				{
					target_rm = titleroom;
					instance_destroy(player_obj);
				}

			break;
	
			//save game
			case 1:
				menu_level = 1

				break;
			//Load game
			case 2:
			menu_level = 2;break;
			//exit
			case 3:
			game_end();break;		
				}
			break;
			
		//save file	
		case 1:
			switch(pos)
			{
			
			case 0:
			save_game(1);
			break;
			
			//savefile 2
			case 1:
			save_game(2);
			break;
			
			//savefile 3
			case 2:
						save_game(3);
			break;
			
			//savefile 4
			case 3:
						save_game(4);
			break;
			
			//back
			case 4:
			menu_level = 0;
			break;	
		}
		break;
		case 2:
			switch(pos)
			{
			// savefile 1
			case 0:
			load_game(1);
			break;
			
			//savefile 2
			case 1:
			load_game(2);

			break;
			
			//savefile 3
			case 2:
			load_game(4);
			break;
			
			//savefile 4
			case 3:
			load_game(4);
			break;
			
			//back
			case 4:
			menu_level = 0;
			break;	
		}
		break;

		
			}
		
	if _sml != menu_level {pos = 0};
	op_length = array_length(option[menu_level]);
}
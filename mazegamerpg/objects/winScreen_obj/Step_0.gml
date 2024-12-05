
if !instance_exists(player_obj)
{
	instance_destroy();
	exit;
}


//get input

upKey = keyboard_check_pressed(vk_up) || mouse_wheel_up();
downKey = keyboard_check_pressed(vk_down) || mouse_wheel_down();

acceptKey = keyboard_check_pressed(vk_enter) || mouse_check_button_pressed(mb_left);
//move trough the menu
pos += downKey - upKey;
if pos >= op_length{pos = 0};
if pos < 0 {pos = op_length-1};


//using the option
if acceptKey {
	switch(pos)
	{
	case 0:
	with( instance_create_depth(0,0,0, loading_ani_obj))
	{
		target_rm = titleroom;
		instance_destroy(player_obj);
	}

		break;
	case 1:
		game_end()
		break;
	
	
	}
}
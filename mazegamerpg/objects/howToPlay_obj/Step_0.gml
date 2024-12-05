

//get input

acceptKey = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_escape) || mouse_check_button_pressed(mb_left);

//back to menu
if acceptKey {
    instance_destroy();
	room_restart();
}
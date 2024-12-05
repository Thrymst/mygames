if !instance_exists(enemiesParent_obj)
{
	state = 1
}

if state == 0
{ mask_index = sprite_index}

if state == 1
{
	
	mask_index =  Sprite50;
	if place_meeting(x,y, player_obj)
	{ instance_destroy();}
}

image_index = state;
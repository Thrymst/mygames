// put the player in the cords

if room == target_rm 
{
	//new coords based on targetObj;
		player_obj.x = targetObj.x;
		player_obj.y = targetObj.y;

}

//destroy self when done

if image_speed == -1 && image_index < 1
{
	instance_destroy();
}
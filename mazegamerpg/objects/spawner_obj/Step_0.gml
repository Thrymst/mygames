
//pause self
if screenPause(){exit;};

//spawn enemy
timer++;

	//reset timer when eny limit reach
	if instance_number(enemiesParent_obj) >= global.activeEnemyMax || global.totalEnemySpawned >= global.enemyRoomMax
	{
		timer = 0;
	}

		//transition for spawning
		var _camLeft = camera_get_view_x( view_camera[0]);
		var _camRight = _camLeft + camera_get_view_width(view_camera[0]);
		var _camTop = camera_get_view_y(view_camera[0]);
		var _camBottom = _camTop + camera_get_view_height(view_camera[0]);
		
		//only add  if onscreen


if timer >= spawnTime && !place_meeting(x,y+16,enemiesType )
{
	//create enemy
	var _inst = instance_create_depth(x, y, depth-1, enemiesType)
	with(_inst)
	{
		//make the enemies invis
		image_alpha = 0;
		state = -1;
	}
	//reset the timer
	timer = 0;

	
	
}
if !instance_exists(warp_ani_obj) && place_meeting(x,y, player_obj)
	{
	with(instance_create_depth(0,0,0, warp_ani_obj))
	{
		target_rm = other.target_rm;
		targetObj = other.targetObj;
		global.enemyKillCount = 0;

	}
	}
	
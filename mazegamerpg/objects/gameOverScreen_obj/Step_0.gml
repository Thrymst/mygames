//get the shot key for restart

shootKey = global.shotKey;
menuKey = global.startKeyPressed;
//fade in
alpha += alphaSpd;
alpha = clamp( alpha, 0,1);

//restart

if shootKey && alpha >= 1
{
			with( instance_create_depth(0,0,0, loading_ani_obj))
			{
				restart_game(room);
				target_rm = room;
				instance_destroy(player_obj);
				global.enemyKillCount = 0;
				global.enemyRoomMax = 50;

			}}

//main menu 
if menuKey 
{
	with( instance_create_depth(0,0,0, loading_ani_obj))
	{
		target_rm = titleroom;
		instance_destroy(player_obj);
	}
}

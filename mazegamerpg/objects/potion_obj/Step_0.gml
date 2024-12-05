
//pause self
if screenPause(){exit;};
//float to place
floatDir += floatSpd;
y = ystart + dsin (floatDir)*2;



// get collected by player
if place_meeting(x,y, player_obj)
{
	//heal the player
	player_obj.hp += heal;
	
	//destroy self
	instance_destroy();
}
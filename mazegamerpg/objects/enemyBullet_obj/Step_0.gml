//pause self
if screenPause(){exit;};

//state machine

switch(state)
{
	//wait for enemy to shot state
	case 0 :
		//aim for the player
		if instance_exists(player_obj)
		{
			dir = point_direction(x, y, player_obj.x, player_obj.y);}
			
			//set depth to make more visible
			depth = -y - 50;
			

			break;
		//shoot / travel
		case 1:
			
			//movement
			xspd = lengthdir_x(spd, dir);
			yspd = lengthdir_y(spd, dir);
			x += xspd;
			y += yspd;
			
			//depth update
			depth = -y;
			
		break;
			
			
}



//clean up
	//out of room bound
	var _pad = 16;
	if bbox_right < -_pad || bbox_left > room_width + _pad || bbox_bottom < -_pad || bbox_top > room_height  +_pad {destroy = true;}
	if hitConfirm == true && playerDestroy == true {destroy = true;};


	//destroy
	if destroy == true { 
				
		//shoot burst
		created_animated_vfx(bullethit_spr, x,y, depth-200, .3);
		instance_destroy();}

	//wall colllision
	if place_meeting(x,y, wall_obj) {destroy = true;};
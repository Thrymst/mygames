
//pause self
if screenPause(){exit;};


//code commands
var _WallCollisions = true;
var _getDamage = true;
//state machine
switch(state)
{
	//spawn in from spawner object
		case -1:
		
		//fade in
		if image_alpha < 1
		{
			//dont walk while fading in
			spd = 0;
			image_alpha += fadeSpd;
		}
		
		//walkout
		
		_WallCollisions = false;
		_getDamage = false;
		if image_alpha >= 1
		{
			//set spde and direction
			
			spd = emergeSpd;
			dir = 270;
			
		}
		//switch to chasing state after out of spawner
		if !place_meeting(x,y, o_wall_obj) 
		{
			state = 0;
		}
		break;
		
		
	//chase state
	case 0:
		//chase the player
		//get player direction
		if instance_exists(player_obj)
		{
		dir = point_direction(x, y, player_obj.x, player_obj.y);
		}
	
		//set the correct speed
		spd = chaseSpd;

		//transition to shootingstate
		var _camLeft = camera_get_view_x( view_camera[0]);
		var _camRight = _camLeft + camera_get_view_width(view_camera[0]);
		var _camTop = camera_get_view_y(view_camera[0]);
		var _camBottom = _camTop + camera_get_view_height(view_camera[0]);
		
		//only add to timer if onscreen
		if bbox_right > _camLeft && bbox_left< _camRight && bbox_bottom >_camTop && bbox_top < _camBottom
		{
			shootTimer++;
		}
		if shootTimer > cooldownTime
		{
			//go to shoot state
			state = 1;
			//reset timer so the shooting can use it too
			shootTimer = 0;
		}
		
	break;
	
	//pause and shot state
	
	case 1:
	#region
		//get player direction
				if instance_exists(player_obj)
		{
		dir = point_direction(x, y, player_obj.x, player_obj.y);
		}
		
		//set the correct speed
		spd = 0;
		//stop animation /maually set the image index
		//stop animation /maually set the image index
		image_index = 0;
		
		
		//shoot a bullet
		shootTimer++;
		
		//create the bullet
		if shootTimer == 1
		{	
		bulletInst = instance_create_depth(x + bulletXoff*face ,y + bulletYoff, depth, enemyBullet_obj);
		}
		
		//keep the bullet in the vampire's hand
		if shootTimer <= windupTime && instance_exists( bulletInst)
		{
			bulletInst.x = x + bulletXoff*face;
			bulletInst.y = y + bulletYoff;
		}
		
		
		
		//shoot the bullet after the windup time is over
		if shootTimer == windupTime && instance_exists( bulletInst)
		{
			//set bulet state to the movement
			bulletInst.state = 1;
			
		}
		
		//recover and return to chasing the player 
		if shootTimer > windupTime + recoverTime
		{
			//go bact to chasing the player
			state = 0;
			
			//reset the timer so it can use it again
			shootTimer = 0;
		}
		#endregion
	break;
	
}




	
	//get the speed
	xspd = lengthdir_x( spd, dir);
	yspd = lengthdir_y(spd, dir);
	
	
	//get correct face
		if dir > 90 && dir < 270
		{
			face = -1;
		} else {
			face = 1;}
			
			
	//collision
		//wall collision
		if _WallCollisions == true
		{
			if place_meeting(x +xspd, y, o_wall_obj) { xspd = 0;}
			if place_meeting(x, y +yspd, o_wall_obj) { yspd = 0;}
		}
		//enemy collision

			if place_meeting(x +xspd, y, enemiesParent_obj) { xspd = 0;}
			if place_meeting(x, y +yspd, enemiesParent_obj) { yspd = 0;}	
	
	//moving	
	x += xspd
	y += yspd
	
	//set the deph
		depth = -y;
// Inherit the parent event
// getting damage, dying

if _getDamage == true
{
	event_inherited();
}


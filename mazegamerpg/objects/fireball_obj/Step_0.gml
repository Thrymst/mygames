
//pause self
if screenPause(){exit;};

//move 
xspd = lengthdir_x( spd, dir);
yspd = lengthdir_y( spd, dir);


x +=xspd;
y +=yspd;
//depth
 depth = -y;
//clean up

if hitConfirm == true && enemyDestroy == true {destroy = true;};
//bullet destroy
if destroy == true { 
	
	
	//shoot burst
	created_animated_vfx(bullethit_spr, x,y, depth-200, .2);
	
	//destroy
	instance_destroy();
	
	
	};
//collision
if place_meeting(x, y, wall_obj){ destroy = true;};

//bullet out of range
if point_distance(xstart, ystart, x, y)> maxDist { destroy = true;};


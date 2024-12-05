//pause self
if screenPause(){exit;};

//float to place
floatDir += floatSpd;
y = ystart + dsin (floatDir)*2;

var _size = array_length(global.PlayerWeapon);
for(var i = 0; i < _size; i++)
{
if weapon == global.PlayerWeapon[i]
{ instance_destroy();
	exit;
}}

//add weapon to the player list

if place_meeting(x,y , player_obj)
{
	array_push(global.PlayerWeapon, weapon)
	
	//set as player weapon
	player_obj.selectedWeapon = array_length( global.PlayerWeapon)-1;
	
	instance_destroy();
}

//set the correct sprite
sprite_index = weapon.pickupSprite;





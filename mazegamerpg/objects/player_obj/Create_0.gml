
//damage setup
 get_damage_create(25, true);
//variable for movement
moveDir = 0;
moveSpd = 2
xspd = 0;
yspd = 0;


//sprite control
#region
	centerYOffset = -4;
	centerY = y + centerYOffset;
	weaponOffsetDist = 4;
	aimDir = 0;
	
	face = 3;
	sprite[0] = player_spr_right
	sprite[1] = player_spr_up
	sprite[2] = player_spr_left
	sprite[3] = player_spr_down

	sprite_index = sprite[face]
#endregion


//weapon info
	shootTimer = 0;
	
	//add weapon to player weapon inv
	array_push( global.PlayerWeapon, global.WeaponList.firestaff);
	selectedWeapon = 0;
	weapon = global.PlayerWeapon[selectedWeapon];		
		



		
		
		
		
		
		
		
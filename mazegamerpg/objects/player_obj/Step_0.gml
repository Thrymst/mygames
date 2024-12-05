//input
rightKey = global.rightKey;
leftKey = global.leftKey;
upKey = global.upKey;
downKey = global.downKey;
shotKey = global.shotKey;
swapKeyPressed = global.swapKeyPressed;
startKeyPressed = global.startKeyPressed;

if (!instance_exists(player_obj)) {
    instance_create_depth(x, y, 0, player_obj); // Create player only if it doesn't exist
}
//pause menu

if startKeyPressed 
{
	if !instance_exists(pauseMenu_obj)
	{
		instance_create_depth(0,0,0, pauseMenu_obj)
	} else {
		instance_destroy(pauseMenu_obj);
	}
	
}

		
//make the player face the right direction after room trans
if instance_exists(warp_ani_obj)
			{
				sprite_index = sprite[face];
				aimDir = face*90;
				centerY = y + centerYOffset;
			}

//pause self
if screenPause(){exit;};


//player movement
#region

	//direction
	var _horizKey = rightKey - leftKey;
	var _vertKey = downKey -upKey;
	moveDir = point_direction( 0, 0 , _horizKey, _vertKey);
	//get x and y speed
	var _spd = 0;
	var _inputLevel = point_distance(0,0, _horizKey, _vertKey);
	_inputLevel = clamp(_inputLevel, 0,1);
	_spd = moveSpd * _inputLevel;
	
	xspd = lengthdir_x(_spd, moveDir);
	yspd = lengthdir_y(_spd, moveDir);

	//collision
	
	if place_meeting(x + xspd, y, o_wall_obj) {
    xspd = 0;
    }

    if place_meeting(x, y + yspd, o_wall_obj) {
    yspd = 0;
    }

	//move the player
	x +=xspd;
	y +=yspd;
	//depth
	depth = -bbox_bottom;


//player aiming
	centerY = y + centerYOffset;
//aim
aimDir = point_direction( x, centerY, mouse_x, mouse_y);
#endregion


//get damage
if get_damaged(damagePlayer_obj, true)
{
	
		//hit screen
		instance_create_depth(0,0,0, hitScreen_obj);
		//screen pause
		create_screen_pause(15);
		
		// shake the screen
		screen_shake(5);
	
}


//sprite control
#region
	//player face
	face = round( aimDir/90 );
	if face == 4 {face = 0;};
   
   // Animation
    if xspd == 0 && yspd == 0 {
        image_index = 0;
    }

	
	//set player sprite
	sprite_index = sprite[face];
#endregion


//weapon swap
#region
//weapon swapping
	var _playerWeapons = global.PlayerWeapon;
	
	//cyle trough weapon
	if swapKeyPressed
	{
		//change the selection and wrap around
		selectedWeapon++;
		if selectedWeapon >= array_length(_playerWeapons) {selectedWeapon = 0;};

	}
			//set the new weapon
		weapon = _playerWeapons[selectedWeapon];
#endregion
//shot weapon
if shootTimer > 0 { shootTimer--; };
if shotKey && shootTimer <= 0{
	
	//reset timer
	shootTimer = weapon.cooldown;
	
	//screen shake 
		screen_shake(1);
//Shoting
	//create bullet
	var _xOffset = lengthdir_x( weapon.length + weaponOffsetDist, aimDir);
	var _yOffset = lengthdir_y( weapon.length + weaponOffsetDist, aimDir);
	var _spread = weapon.spread;
	var _spreadDiv = _spread / max(weapon.bulletNum-1, 1 );
	
	var _weaponTipX = x + _xOffset;
	var _weaponTipY = centerY + _yOffset;
	
	//create weapon flash
	created_animated_vfx(shootFlash_spr, _weaponTipX, _weaponTipY, depth-10, 0.3, aimDir);
	
	// create number of bullet
	for (var i = 0; i < weapon.bulletNum; i++){
		var _bulletInst = instance_create_depth(_weaponTipX , _weaponTipY , depth-100, weapon.bulletObj);
	
		//change bullet direction
		with( _bulletInst)
		{

			dir = other.aimDir - _spread/2 + _spreadDiv*i;
			// turn the bullet direction
			if dirFix == true {	image_angle = dir;}
			}
			}

	}
	
	
	
//death / game ovwr

if hp <= 0
{
	//create the game over
	instance_create_depth(0,0, -10000, gameOverScreen_obj)
	
	//smoke
	created_animated_vfx(smoke_spr, x,y,depth);
	
	//destroy
	instance_destroy();}
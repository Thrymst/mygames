//drawing the player wapon

function draw_my_weapon()
{	//jarak antara weapon dan player
	var _xOffset = lengthdir_x(weaponOffsetDist, aimDir);
	var _yOffset = lengthdir_y(weaponOffsetDist, aimDir);
	

	//flip the weapon
	var _weaponYscl = 1;
	if aimDir > 90 && aimDir < 270
	{
		_weaponYscl = -1;};
	draw_sprite_ext(weapon.sprite, 0, x + _xOffset, centerY + _yOffset, 1, _weaponYscl, aimDir, c_white, image_alpha);
}

//vpx
	function screenPause()
	{
		//pause self
	if instance_exists(screenPause_obj)
	{
		image_speed = 0;
		return true;
	}else {
		image_speed = 1 ;
		
		return false;
	}
	
	
	
	}

	function create_screen_pause(_time = 3)
	{
		with (instance_create_depth(0,0,0, screenPauseTime))
		{
		timer = _time;	
		}
		
	}
	
	function screen_shake(_amount = 4)
	{
		_amount *= .8;
		
		with(camera_Obj)
		{
			xShakeAmount = _amount;
			yShakerAmount = _amount;
			
		}
	}
	
	function created_animated_vfx(_sprite, _x, _y, _depth, _scale= .5, _rot = 0)
	{
		with(instance_create_depth(_x, _y, _depth, aniVfx_obj))
		{
			sprite_index = _sprite;
			image_xscale = _scale;
			image_yscale = _scale;
			image_angle = _rot;

		}
	}

//damage calculation
	//damage create event
	function get_damage_create(_hp = 10,_iframes = false)
	{
		maxHp = _hp;
		hp = _hp;
		
		//get iframes
		if _iframes == true
		{
			iframeTimer = 0;
			iframeNumber = 90;
			
		}
		//create the damage list
		if _iframes == false 
		{
			damageList = ds_list_create();
		}
		}
	
	//damage clean up event
	function get_damage_cleanup()
	{
		//delete damage list data structure to free memory
		ds_list_destroy(damageList);
	}
	//damage step event
	function get_damaged(_damageObj, _iframes = false)
	{
		
		//special exit for iframe timer
		if _iframes == true && iframeTimer > 0
		{
			iframeTimer--;
			
			if iframeTimer mod 5 == 0
			{
				if image_alpha == 1
				{
					image_alpha = 0;
				} else {
					image_alpha = 1;
				}
			}
			
			//clamp hp
			hp = clamp(hp, 0, maxHp);
			
			//exit by returning the fucn as false
			return false;
		}
		
		//make sure iframe blinking stop
		if _iframes == true
		{image_alpha = 1;}
		
		
		//recieve damage
		var _hitConfirm = false;
		if place_meeting(x, y,_damageObj) || (_damageObj != damageParent_obj && place_meeting(x,y, damageAll_obj))
		{
			
		//getting a list of the damage instances
			//create ds list and copy instance to it
				var _instList = ds_list_create();
				instance_place_list(x,y, _damageObj, _instList, false);
				if _damageObj != damageParent_obj
				{
				instance_place_list(x,y, damageAll_obj, _instList, false );
				}
				
				
			//get the size of list
			//hitcondstidiny
				var _listSize = ds_list_size( _instList );
			//loop trought the lsit

				for(var i= 0; i< _listSize; i++) 
				{
					//get damage object instance from the list
					var _inst = ds_list_find_value( _instList, i);
				
					//check if this instance is already in the damage list
					if _iframes == true || ds_list_find_index( damageList, _inst) == -1
					{
						//add the new damage instance to the damage list
						if _iframes== false 
					{
						ds_list_add( damageList, _inst);
					}
						//take damage from specific instance
						hp -= _inst.damage;
						_hitConfirm = true;;
						//tell the damage instnce it has impacted
						_inst.hitConfirm = true;
							
						//shoot burst
						if _inst.hitVfx == true 
						{
						created_animated_vfx(bullethit_spr, _inst.x,_inst.y, _inst.depth-200, .2);
						}
				
				}

		}
		//set iframe if got hit
		
		if _iframes == true && _hitConfirm
		{
			iframeTimer = iframeNumber;
		}
		
	
			// free memeory by destroying th ds list
				ds_list_destroy( _instList);	
		}
  

		//clear the damage list of object that dont exsist anymor or arent touching anymor
		if _iframes == false 
		{
		var _damageListSize = ds_list_size(damageList);
		for(var i = 0; i< _damageListSize; i++){
			//if not touching the damage instance anymor, remove it from the list and set the loop back 1 position
			var _inst = ds_list_find_value( damageList, i);
		if !instance_exists(_inst) || !place_meeting(x,y, _inst)
		{
			ds_list_delete( damageList,i);
			i--; 
			_damageListSize--;  
		}
	}
		}
		
		//clamp hp
		hp = clamp(hp, 0, maxHp);
		
		//turn hitconfirm variable value
		
		return _hitConfirm;
	}
		
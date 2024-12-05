//constructore template for weapon

function create_weapon( _sprite=firestaff_spr, _weaponlength =0 , _bulletObj= fireball_obj, _cooldown= 9, _bulletNum =1 , _spread =0, _pickupSprite = icestaff_spr_1 ) constructor
{
	sprite = _sprite;
	length = _weaponlength;
	bulletObj = _bulletObj;
	cooldown = _cooldown;
	bulletNum = _bulletNum;
	spread = _spread;
	pickupSprite = _pickupSprite;
	
	
	
}
//player weapon inventory
global.PlayerWeapon = array_create(0);



///the weapon
global.WeaponList = {
firestaff : new create_weapon(
	firestaff_spr,
	sprite_get_bbox_right(firestaff_spr)-sprite_get_xoffset(firestaff_spr),
	fireball_obj,
	10,
	1,
	0,
	firestaff_spr
	),
icestaff : new create_weapon(
	icestaff_spr,
	sprite_get_bbox_right(icestaff_spr)-sprite_get_xoffset(icestaff_spr),
	icelance_obj,
	13,
	1,
	0,
	pickicestaff_spr
	),
purplestaff : new create_weapon(
	purplestaff_spr,
	sprite_get_bbox_right(purplestaff_spr)-sprite_get_xoffset(purplestaff_spr),
	purpleball_obj,
	30,
	7,
	80,
	pickpurplestaff_spr
	),
}


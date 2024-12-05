get_damaged( damageParent_obj)

//show damage
var _healthPercent = 1-(hp/maxHp);
image_index = _healthPercent * image_number;

if hp <= 0
{	
	//create exploion
	var _explotionInst = instance_create_depth( x+ 8, y+8, -1000, explotion_obj)
	with(_explotionInst)
	{
		image_xscale = 2;
		image_yscale = 2;
	}
	//screen pause
	create_screen_pause();
	
	//sreen shake
	screen_shake(7);
	//destroy
	instance_destroy();
}
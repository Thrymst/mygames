get_damaged(damageParent_obj);


//show damage
var _healthPercent = 1-(hp/maxHp);
image_index = _healthPercent * image_number;


if hp <= 0
{
	//create smoke
	created_animated_vfx(smoke_spr, x + 8 ,y + 16 ,depth);
	instance_destroy();
}
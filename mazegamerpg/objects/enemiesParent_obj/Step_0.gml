//recieve damage
get_damaged(damageEnemies_obj)
//death
if hp <=0
{
	//add total enemy killed
	global.enemyKillCount++;
	
	//drop item if death
	var _chance = irandom(100)
	
	//chance to drop item
	if _chance < 25
	{
		//create the item
		instance_create_depth(x,y, depth, potion_obj)
	}
	
	//boom vfs
	created_animated_vfx(smoke_spr, x,y,depth);
	//destroy self
	instance_destroy();
}
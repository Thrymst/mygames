//pause self
if screenPause(){exit;};


//create damage object

if createdDamageObject == false
{
	//create object to damage enemies
	
	damageInst = instance_create_depth(x,y, 0, damageAll_obj);
	with(damageInst)
	{ 
		damage = other.damage;
		mask_index = other.sprite_index;
		image_xscale = other.image_xscale;
		image_yscale = other.image_yscale;
		
	}

	// set created variable so not make many
	createdDamageObject = true;
	

}
	
	
	
	//det rid of damage object after explod

if floor(image_index) >3
{
	//destroy
	if instance_exists(damageInst)
	{
		instance_destroy(damageInst)
	}
	

}
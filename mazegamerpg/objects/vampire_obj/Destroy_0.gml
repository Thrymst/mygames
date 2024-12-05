//get rid of bullet if havent shoot it yet
if instance_exists( bulletInst) && bulletInst.state == 0
{
	bulletInst.destroy = true;	
}
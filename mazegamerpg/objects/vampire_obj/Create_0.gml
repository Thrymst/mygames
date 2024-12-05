
// Inherit the parent event
event_inherited();
get_damage_create(10);
spd = 0.5;
chaseSpd = .5;
dir = 0;
xspd = 0;
yspd = 0;

face = 1;

//state machine
state = 0;
	
	
	//spawn from spawner
	fadeSpd = 1/15;
	emergeSpd = .26;

//shoting
	cooldownTime = 4*60;
	shootTimer = irandom( cooldownTime);
	windupTime = 60;
	recoverTime = 45;
	bulletInst = noone;
	
	
	bulletXoff = 5;
	bulletYoff = -8;
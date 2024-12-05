// get the player hp info
if instance_exists(player_obj)
{
	player_Hp = player_obj.hp;
	playerMaxHp = player_obj.maxHp;
} else {
	player_Hp = 0};
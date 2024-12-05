//get cam cordinates
var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

//central Hud cords
var _border = 8;
var _hudX = _camX + _border;
var _hudY = _camY + _border;
//draw the player hp
if instance_exists(player_obj)
{

	draw_sprite(playerHp_spr, 0, _hudX, _hudY)

	for ( var i = 0; i < playerMaxHp;i++)
	{	
	
		//show current hp
		var _img = 1;
		if i+1 <= player_Hp {_img = 2;};
		var _sep = 5
		draw_sprite(playerHp_spr, _img, _hudX + _sep*i, _hudY )
	
	}
}


//draw the enemy kill count
var _ecountOffset = 45;
var _ecountX = _hudX ;
var _ecountY = _hudY + _ecountOffset;

//draw the background/box
draw_sprite(enemyKillCoutn_spr,0 , _ecountX, _ecountY)


	//draw text
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_font(fontBit);

	//totalkill
	draw_text(_ecountX + 24 , _ecountY - 8, string(global.enemyKillCount));
	
	//totalenemy
	draw_text(_ecountX + 46 , _ecountY - 8, + "/" + string(global.enemyRoomMax));




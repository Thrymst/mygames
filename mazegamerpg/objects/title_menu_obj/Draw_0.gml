//draw the menu background
var _camX = camera_get_view_x(view_camera[0]);
var _camW = camera_get_view_width(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);
var _camH = camera_get_view_height(view_camera[0]);
//draw the option
draw_set_font(fontBit);

	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
draw_sprite(Sprite47,0,_camX + _camW/2, _camY+ _camH/2)

var _gameOffset = -50;

if menu_level == 0 {	
	draw_text_transformed(_camX + _camW/2 , _camY+ _camH/2 + _gameOffset -30, "Welcome To", 2,2,0);
	draw_text_transformed(_camX + _camW/2 , _camY+ _camH/2 + _gameOffset + 10, "Mythical Dungeon Diver", 3,3,0);
}
if menu_level == 1 {draw_text_transformed(_camX + _camW/2 , _camY+ _camH/2 + _gameOffset + 20, "Load Game", 3,3,0);};	

//draw_sprite_ext(sprite_index, image_index, x,y, width/sprite_width, height/sprite_height,0,c_white,1);

	var _restartOffset = 30;
	//draw_text_transformed(_camX + _camW/2, _camY+ _camH/2 + , "- Press Shoot To Restart -", );

	for (var i = 0; i< op_length; i ++)
{
	var _c = c_white;
	if pos == i { _c = c_yellow};
	draw_text_transformed_color(_camX + _camW/2, _camY+ _camH/2+ 20 +_restartOffset*i, option[menu_level,i],2,2,0, _c, _c,_c, _c, 1);
}

draw_set_valign(fa_top);
draw_set_halign(fa_left);
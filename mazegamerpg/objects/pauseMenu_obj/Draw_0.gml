
var _camX = camera_get_view_x(view_camera[0]);
var _camW = camera_get_view_width(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);
var _camH = camera_get_view_height(view_camera[0]);
//draw a black rectangle over the screen
draw_set_alpha(alpha);
draw_rectangle_color(_camX, _camY, _camX + _camW, _camY + _camH, c_black , c_black, c_black, c_black,false);

draw_set_alpha(1); 

//draw the text
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_alpha(1);
	draw_set_font(fontBit);
	
	
	//"pause

	var _restartOffset = 30;
	//draw_text_transformed(_camX + _camW/2, _camY+ _camH/2 + , "- Press Shoot To Restart -", );

	for (var i = 0; i< op_length; i ++)
{
	var _c = c_white;
	if pos == i { _c = c_yellow};
	draw_text_transformed_color(_camX + _camW/2, _camY+ _camH/2-30 +_restartOffset*i, option[menu_level,i],2,2,0, _c, _c,_c, _c, 1);
}

	var _gameOffset = -40;
	
	if menu_level == 0 {draw_text_transformed(_camX + _camW/2 , _camY+ _camH/2 + _gameOffset -30, "PAUSE", 3,3,0);};
	if menu_level == 1 {draw_text_transformed(_camX + _camW/2 , _camY+ _camH/2 + _gameOffset -30, "SAVE GAME", 3,3,0);};
	if menu_level == 2 {draw_text_transformed(_camX + _camW/2 , _camY+ _camH/2 + _gameOffset -30, "LOAD GAME", 3,3,0);};
	
	
	//reset draw setting
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);

	
	
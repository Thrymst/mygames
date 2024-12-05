
var _camX = camera_get_view_x(view_camera[0]);
var _camW = camera_get_view_width(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);
var _camH = camera_get_view_height(view_camera[0]);
//draw a black rectangle over the screen
draw_sprite(Sprite47,0,_camX + _camW/2, _camY+ _camH/2) 


//draw the text
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_alpha(1);
	draw_set_font(fontBit);
	
	
	//"pause
	
	for (var i = 0; i< op_length; i ++)
{
	var _c = c_white;
	if pos == i { _c = c_yellow};
	draw_text_color(_camX + _camW/2, _camY+ _camH/2 + 80 + 16*i, option[i], _c, _c,_c, _c, 1);
}
	draw_text_transformed(_camX + _camW/2, _camY+ _camH/2 -40  , "CONGRATULATION", 3,3,0);
	draw_text_transformed(_camX + _camW/2, _camY+ _camH/2 + 20 , "YOU WIN!", 3,3,0);
	

	
	//reset draw setting
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);

	
	
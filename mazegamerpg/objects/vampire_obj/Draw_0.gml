
//draw self flipped
draw_sprite_ext( sprite_index, image_index, x, y, face, image_yscale, image_angle, image_blend, image_alpha);


//draw hp
var _heathPercent = hp / maxHp;
var _hpImage =_heathPercent * (sprite_get_number(enemiesHP_spr)-1);
draw_sprite_ext(enemiesHP_spr, _hpImage, x, y- sprite_height - 1 , image_xscale, image_yscale, image_angle,  image_blend, image_alpha );




depth = -y;

//floating
floatDir = 0;
floatSpd = 6;


//set the weapon based on image index

if image_index == 0 {weapon = global.WeaponList.icestaff}
if image_index == 1 {weapon = global.WeaponList.purplestaff}


var _size = array_length(global.PlayerWeapon);
for(var i = 0; i < _size; i++)
{
if weapon == global.PlayerWeapon[i]
{ instance_destroy();
}}
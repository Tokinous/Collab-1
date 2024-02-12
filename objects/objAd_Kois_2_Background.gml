#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
Arg_XPos = rand(448);
Arg_YPos = rand(330);
if (surface_exists(surface3)){
    surface_free(surface3);
}
surface3 = surface_create(1100, 1100);
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
Arg_XPos += Return_x_Dtheta(Arg_Hspeed, Arg_Vspeed, -Arg_Angle);
Arg_YPos += Return_y_Dtheta(Arg_Hspeed, Arg_Vspeed, -Arg_Angle);
Arg_Angle += Arg_Anglespeed;
surface_set_target(surface3);
for(i = -1; i < 3; i += 1){
    for(j = -1; j < 4; j += 1){
        draw_sprite(Kois_Ad_2_SprBackground, 0, _Mod(Arg_XPos + (j - _Div(Arg_YPos, 330))*12, 448) + i*448, _Mod(Arg_YPos, 330) + j*330);
    }
}
surface_reset_target();
draw_surface_ext(surface3, 400 + Return_x_Dtheta(-550, -550, Arg_Angle), 304 + Return_y_Dtheta(-550, -550, Arg_Angle), 1, 1, Arg_Angle, c_white, 1)

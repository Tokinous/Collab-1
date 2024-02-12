#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
switch(form){
    case 1:{
        if !Vint{
            Vint=1
            surface_set_target(surface3)
            Draw_Clc(1,c_white)
            xd=random(800)
            yd=random(608)
            draw_sprite_ext(Kois_Ad_1_SprMaskEffect,0,-800+xd,-608+yd,1,1,0,c_white,0.2)
            draw_sprite_ext(Kois_Ad_1_SprMaskEffect,0,xd,-608+yd,1,1,0,c_white,0.2)
            draw_sprite_ext(Kois_Ad_1_SprMaskEffect,0,-800+xd,yd,1,1,0,c_white,0.2)
            draw_sprite_ext(Kois_Ad_1_SprMaskEffect,0,xd,yd,1,1,0,c_white,0.2)
            repeat(10){
                ArgScale=sqrt(random_range(1,9))
                draw_sprite_ext(Kois_Ad_1_SprMaskLight,0,random(800),random(608),ArgScale,ArgScale,0,0,random_range(0.05,0.3))
            }
            repeat(100){
                ArgScale=sqrt(random_range(0.01,1))
                draw_sprite_ext(Kois_Ad_1_SprMaskLight,0,random(800),random(608),ArgScale,ArgScale,0,0,random_range(0.1,0.4))
            }
        }
        surface_set_target(surface4)
        draw_clear_alpha(0,0)
        draw_surface(surface3,0,0)
        T+=T<TimeAll
        draw_set_blend_mode(bm_add)
        Draw_Clc(1-T/TimeAll,c_white)
        draw_set_blend_mode_ext(bm_inv_dest_color,bm_inv_src_color)
        Draw_Clc(1,c_white)
        draw_set_blend_mode(bm_add)
        repeat(10){
            draw_surface(surface4,0,0)
        }
        surface_reset_target()
        draw_surface(surface4,0,0)
        draw_set_blend_mode(bm_normal)
    }break
}

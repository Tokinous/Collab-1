//creating bow
if !instance_exists(bow){
    var a;
    a = instance_create(x,y,bow);
    a.image_xscale = image_xscale;
    a.image_yscale = image_yscale;
}
//debug mode functions (F6)
if(debug_mode){
    //mouse warp (left buttom)
    if(mouse_check_button(mb_left)){
        player.x = mouse_x;
        player.y = mouse_y;
    }
}

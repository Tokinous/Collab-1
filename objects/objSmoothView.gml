#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// this object can smooth the view changing
//  in the room view settings, set the object following to this object
//  and the Hbor should be 400, Vbor should be 304.
//
// DO NOT PUT 'camera' IN THE ROOM
//

view_object = id;
view_hborder[0] = 400;
view_vborder[0] = 304;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(instance_exists(player)){
    if !Vint{
        x=player.x;
        y=player.y;
        Vint=1
    }
    //set this object as the view object
    view_object[0]=id;
    //follow player smoothly
    xp=player.x
    yp=player.y
    if xp<400 xp=400
    if xp>room_width-400 xp=room_width-400
    if yp<304 yp=304
    if yp>room_height-304 yp=room_height-304
}
//else{
//    vspeed=0;
//    hspeed=0;
//}
x+=(xp-x)/16;
y+=(yp-y)/12;

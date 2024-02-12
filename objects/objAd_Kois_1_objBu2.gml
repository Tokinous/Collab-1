#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
switch(form){
    case -400:{
        if x<-50 or y<-50 or x>850 or y>658 instance_destroy()
    }break
    case -300:{
        __Time+=1
        if __Time>DeTime{
            instance_destroy()
        }
    }break
    case -200:{
        image_xscale-=scD
        image_yscale=image_xscale
        if image_xscale<=0 instance_destroy()
    }break
    case -100:{
        image_alpha-=alpD
        if image_alpha<=0 instance_destroy()
    }break
    case 1:{
        dir+=(dirto-dir)/4
        x=lengthdir_x(len,dir)+400
        y=lengthdir_y(len,dir)+304
    }break
    case 2:{
        x+=(xto-x)/4
        y+=(yto-y)/3
    }break
    case 3:{
        y+=(yto-y)/3
    }break
    case 4:{
        x+=(xto-x)/3
        y+=(yto-y)/3
    }break
}

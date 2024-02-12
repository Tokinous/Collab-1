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
        if !Vint && irandom(4)=0{
            Vint=1
            lr=choose(-1,1)
            repeat(5){
                x+=lr*5
                inst=Scr_Kois_Ad_1_Inst_Form(x,y,objAd_Kois_1_objBu1,0.7,-300)
                inst.DeTime=1
            }
            vspeed=0
        }
    }break
    case 2:{
        Tnow+=1
        dist=(y-player.y)
        x+=dist*Ease_expoN_out(Tnow/10,100)
        if x<0 x+=800
        if x>800 x-=800
        if irandom(20)=0 instance_destroy()
    }break
    case 3:{
        x+=(xto-x)/4
        y+=(yto-y)/4
    }break
    case 4:{
        dir+=(dirto-dir)/4
        x=400+lengthdir_x(len*(1+sc*4/10),dir)
        y=304+lengthdir_y(len*(1+sc*4/10),dir)
        if ext=1{
            sc+=(1-sc)/10
        }
    }break
    case 5:{
        x+=(xto-x)/4
    }break
}

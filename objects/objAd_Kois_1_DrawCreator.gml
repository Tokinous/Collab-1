#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if icp!=0{
    if instance_exists(icp) instance_destroy_id(icp)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
switch(form){
    case 1:case 2:{
        if !Vint{
            Vint=1
            xp=random(800/6)
            if form=1{
                ydd=184
            }
            else{
                ydd=288
            }
        }
        T+=1
        if shoot=0{
            Num=0
            for(i=-800/6+xp+T*50/TimeAll;Num<7;i+=800/6){
                Num+=1
                if T mod 3=1{
                    inst=Scr_Kois_Ad_1_Inst_Form(i,304-ydd,objAd_Kois_1_objBu1,0.7,0)
                    inst.Mark=1
                    inst=Scr_Kois_Ad_1_Inst_Form(i,304+ydd,objAd_Kois_1_objBu1,0.7,0)
                    inst.Mark=1
                    if T=1 xL=inst.bbox_left
                    xR=inst.bbox_right
                }
            }
        }
        if shoot>=1{
            for(j=0;j<7;j+=1){
                draw_rectangle_alpcol(xL-j*800/6,304-ydd,xR-j*800/6,304-A,1,c_white)
                if collision_rectangle(xL-j*800/6,304-ydd,xR-j*800/6,304-A,player,1,1)>0{
                    with(player)event_user(0)
                }
                draw_rectangle_alpcol(xL-j*800/6,304+ydd,xR-j*800/6,304+A,1,c_white)
                if collision_rectangle(xL-j*800/6,304+ydd,xR-j*800/6,304+A,player,1,1)>0{
                    with(player)event_user(0)
                }
            }
        }
        if shoot=1{
            shoot=2
            with(objAd_Kois_1_objBu1){
                if Mark=1{
                    DeTime=1
                    form=-300
                }
            }
            C=5
            for(j=0;j<7;j+=1){
                for(i=0;i<TimeAll;i+=1){
                    if i mod 3=1{
                        inst=Scr_Kois_Ad_1_Inst_Form(-800/6+xp+j*800/6+i*50/TimeAll,304-A,objAd_Kois_1_objBu1,0.7,-300)
                        inst.DeTime=1
                        inst=Scr_Kois_Ad_1_Inst_Form(-800/6+xp+j*800/6+i*50/TimeAll,304+A,objAd_Kois_1_objBu1,0.7,-300)
                        inst.DeTime=1
                    }
                }
            }
        }
        else if shoot=2{
            instance_destroy()
        }
    }break
}

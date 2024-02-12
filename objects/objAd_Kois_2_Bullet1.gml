#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
Bu1 = objAd_Kois_2_Bullet1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
switch(Form){
    case 1:
        if (x < -100){
            x += 1000;
        }
    break;
    case 2:
        if (Float){
            vspeed -= 0.2;
            Inst = Inc(x, y, Bu1);
            Inst.Form = -14;
            Inst.depth = depth + 5;
            SSca(Inst, scale());
            SSEca(0.7, 0.05);
        }
        if (y > 708 || y < -100){
            Dest();
        }
        if (x < -100){
            x += 1000;
        }
    break;
    case 3:{
        if (x < -100){
            x += 1000;
        }
        if (x > 900){
            x -= 1000;
        }
        if (Stop == 0){
            Dphi += pi/25;
            y = ystart + sin(phi + Dphi)*100;
        }
    }break;
    case 4:{
        if (Rot){
            dir += 1;
            Mrt(400, 304, len, dir);
            Inst = Inc(x, y, Bu1);
            Inst.Form = -14;
            Inst.depth = depth + 5;
            SSEca(1.25, 0.05);
            SSca(Inst, scale());
        }
        if (x > 1000){
            Dest();
        }
    }break;
    case 5:{
        if (Rot){
            dir += 0.75;
            Mrt(400, 304, len, dir);
            SSEca(1.25, 0.05);
            SSca(Inst, scale());
        }
        else{
            Inst = Inc(x, y, Bu1);
            Inst.Form = -14;
            Inst.depth = depth + 5;
        }
        if (x > 900 || x < -100 || y < -100 || y > 708){
            Dest();
        }
    }break;
}

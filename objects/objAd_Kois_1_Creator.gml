#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
MusicBPM = 177;
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if icp!=0{
    if instance_exists(icp) instance_destroy_id(icp)
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
switch(form){
    case 1:{
        T+=1
        if Num*Return_duration(0,20)/25<=T{
            sc=(Num+0.5)/25
            xds=Ease_expoN_in(sc,10000)
            xp=1-xds
            repeat(4){
                lr=choose(-1,1)
                xd=power(random(1),xds)*xds
                inst=Scr_Kois_Ad_1_Inst_Form(400+lr*(xp+xd)*400,sc*304,objAd_Kois_1_objBu1,0.7,1)
                //inst.vspeed=-1
                inst=Scr_Kois_Ad_1_Inst_Form(400+lr*(xp+xd)*400,608-sc*304,objAd_Kois_1_objBu1,0.7,1)
                //inst.vspeed=1
            }
            Num+=1
            if Num=26 instance_destroy()
        }
    }break
    case 2:{
        if !Vint{
            with(objAd_Kois_1_objBu1){
                if y>104 && y<504{
                    instance_destroy()
                }
            }
            xs=player.x
            phi=3*pi/2-xs/200
            Vint=1
            A=200
            xp=random(800)
            T=xp/A+phi
            for(i=0;i<20;i+=1){
                rem[i]=Scr_Kois_Ad_1_Inst_Form(0,0,objAd_Kois_1_objBuEmpty,0.8,0)
                rem2[i]=Scr_Kois_Ad_1_Inst_Form(0,0,objAd_Kois_1_objBuEmpty,0.8,0)
            }
        }
        A-=0.62
        //phi+=shake/A
        phi=T-xp/A
        xd=random(20)-20
        if irandom(100)<90{
            phid=0
        }
        else{
            phid=choose(pi,pi/2,3*pi/2)
            if collision_circle(player.x,304-A*sin(player.x/A+phi+phid),20,player,1,1)>0{
                phid=0
            }
        }
        for(X=xd;X<820;X+=20){
            func=304-A*sin(X/A+phi+phid)
            inst=Scr_Kois_Ad_1_Inst_Form(X,func,objAd_Kois_1_objBuEmpty,0.5,-300)
            inst.DeTime=1
        }
        Time+=1
        for(i=0;i<20;i+=1){
            rem[i].x=(i+0.5)*40+sin(Time/30+i/20)*sin((i+0.5)*pi/20)*200
            rem[i].y=304-A
            rem2[i].x=(i+0.5)*40-sin(Time/30+i/20)*sin((i+0.5)*pi/20)*200
            rem2[i].y=304+A
        }
    }break
    case 3:{
        if !Vint{
            Vint=1
            Aout=400
            Ain=300
            udS=Aout*(Aout-Ain)
            cS=Ain*(Aout-Ain)
            for(i=0;i<200;i+=1){
                inst[i]=Scr_Kois_Ad_1_Inst_Form(-100,-100,objAd_Kois_1_objBuEmpty,1,0)
            }
            for(i=0;i<200;i+=1){
                X[i]=random(1)
                if X[i]<cS/(cS+udS){
                    yp[i]=random(Ain)-Ain/2
                    xp[i]=choose(-1,1)*(Ain/2+random(Aout-Ain)/2)
                    cud[i]=1
                }
                else{
                    yp[i]=choose(-1,1)*(Ain/2+random(Aout-Ain)/2)
                    xp[i]=random(Aout)-Aout/2
                    cud[i]=0
                }
            }
            ym=random_range(-200,150)
            ym2=random_range(-200,150)
            ym3=random_range(-200,150)
            ym4=random_range(-200,150)
            dird=0.1
        }
        //ym=-20000
        if irandom(4)=0{
            ym=random_range(-200,150)
            xd=random_range(40,80)
        }
        if irandom(4)=0{
            ym2=random_range(-200,150)
            xd2=-random_range(40,80)
        }
        if irandom(4)=0{
            ym3=random_range(-200,170)
            xd3=random_range(-30,30)
        }
        if irandom(4)=0{
            ym4=random_range(-200,170)
            xd4=random_range(-30,30)
        }
        dird=dird*1.4
        for(i=0;i<200;i+=1){
            if cud[i]=1{
                xp[i]+=8
                if xp[i]>-Ain/2 && xp[i]<Ain/2 xp[i]+=Ain
                if xp[i]>Aout/2 xp[i]-=Aout
            }
            else{
                xp[i]+=8
                if xp[i]>Aout/2{
                    xp[i]-=Aout
                }
            }
            xp2=Return_x_Dtheta(xp[i],yp[i],dird)
            yp2=Return_y_Dtheta(xp[i],yp[i],dird)
            xdd=0
            if yp2>ym && yp2<ym+50{
                xdd=xd
            }
            xdd2=0
            if yp2>ym2 && yp2<ym2+50{
                xdd2=xd2
            }
            xdd3=0
            if yp2>ym3 && yp2<ym3+30{
                xdd3=xd3
            }
            xdd4=0
            if yp2>ym4 && yp2<ym4+30{
                xdd4=xd4
            }
            inst[i].x=400+xp2+xdd+xdd2+xdd3+xdd4
            inst[i].y=304+yp2
        }
        if de=1{
            instance_destroy()
            for(i=0;i<200;i+=1){
                instance_destroy_id(inst[i])
            }
        }
    }break
    case 4:{
        if !Vint{
            Vint=1
            for(i=0;i<800;i+=1){
                inst[i]=Scr_Kois_Ad_1_Inst_Form(-100,-100,objAd_Kois_1_objBuEmpty,1,0)
                inst[i].nde=1
            }
        }
        T+=1
        xp=Ease_expoN_outin(T/TimeAll,100000)*850
        d1=xp
        d2=850-xp
        d=d1*d2/10
        a=-d
        if a<-25 a=-25
        b=d
        if b>825 b=825
        for(i=0;i<800;i+=1){
            inst[i].x=xp+random_range(a,b)-25
            inst[i].y=304+random_range(-60,60)
        }
        if T=TimeAll{
            instance_destroy()
            for(i=0;i<800;i+=1){
                instance_destroy_id(inst[i])
            }
        }
    }break
    case 5:{
        T+=1
        if T mod 15=0{
            for(i=0;i<15;i+=1){
                Scr_Kois_Ad_1_Inst_Form(75-(i-7)*9,T*608/TimeAll,objAd_Kois_1_objBuEmpty,1,0)
                Scr_Kois_Ad_1_Inst_Form(725-(i-7)*9,T*608/TimeAll,objAd_Kois_1_objBuEmpty,1,0)
            }
        }
        if T mod 3=0{
            repeat(10){
                len=sqrt(random_range(0.01,1))*500
                dir=random(360)
                inst=Scr_Kois_Ad_1_Inst_Form(player.x+lengthdir_x(len,dir),player.y+lengthdir_y(len,dir),objAd_Kois_1_objBuEmpty,random_range(0.4,0.8),-300)
                inst.DeTime=3
            }
        }
        if T mod 2=0{
            xcenT=((Numxt mod 10)-4.5)*45+400
            ycenT=(Numxt div 10)*45+22.5
            for(i=0;i<5;i+=1){
                Scr_Kois_Ad_1_Inst_Form(xcenT+(i-3.5)*7,ycenT+(i-3.5)*10,objAd_Kois_1_objBuEmpty,0.5,0)
            }
            Numxt+=1
        }
        if On_1=0 && On_2=0 && T3=0{
            T2+=1
            if T2 mod 5=1{
                NumX[0]=irandom_range(3,8)
                NumX[1]=irandom_range(3,8)
                dirX[0]=random(360)
                dirX[1]=random(360)
                dirN+=6
                xc=400+lengthdir_x(175,dirN+180)
                yc=304+lengthdir_y(175,dirN+180)
                inst=Scr_Kois_Ad_1_Inst_Form(xc,yc,objAd_Kois_1_objBuEmpty,1,-400)
                inst.gravity_direction=random(360)
                inst.gravity=0.05
                xc=400+lengthdir_x(175,dirN)
                yc=304+lengthdir_y(175,dirN)
                inst=Scr_Kois_Ad_1_Inst_Form(xc,yc,objAd_Kois_1_objBuEmpty,1,-400)
                inst.gravity_direction=random(360)
                inst.gravity=0.05
            }
            for(i=0;i<2;i+=1){
                l=sqrt(2*10000/(NumX[i]*sin(2*pi/NumX[i])))
                xc=400+lengthdir_x(175,dirN+i*180)
                yc=304+lengthdir_y(175,dirN+i*180)
                for(j=0;j<NumX[i];j+=1){
                    xp1=lengthdir_x(l,dirX[i]+360*j/NumX[i])
                    yp1=lengthdir_y(l,dirX[i]+360*j/NumX[i])
                    xp2=lengthdir_x(l,dirX[i]+360*(j+1)/NumX[i])
                    yp2=lengthdir_y(l,dirX[i]+360*(j+1)/NumX[i])
                    for(k=0;k<8;k+=1){
                        inst=Scr_Kois_Ad_1_Inst_Form(xc+lerp(xp1,xp2,k/8),yc+lerp(yp1,yp2,k/8),objAd_Kois_1_objBuEmpty,0.8,-300)
                        inst.DeTime=1
                        inst=Scr_Kois_Ad_1_Inst_Form(xc+lerp(xp1,xp2,k/8)/2,yc+lerp(yp1,yp2,k/8)/2,objAd_Kois_1_objBuEmpty,0.8,-300)
                        inst.DeTime=1
                    }
                }
            }
        }
        else{
            if On_1=1{
                T3=4
                On_1=0
                lenC=point_distance(400,304,player.x,player.y)+50
                for(i=0;i<100;i+=1){
                    inst=Scr_Kois_Ad_1_Inst_Form(400+lengthdir_x(lenC,i*3.6),304+lengthdir_y(lenC,i*3.6),objAd_Kois_1_objBuEmpty,0.7,-300)
                    inst.DeTime=4
                }
                for(i=0;i<300;i+=1){
                    lenc=power(random(0.99)+0.01,-1)*lenC
                    dirc=random(360)
                    inst=Scr_Kois_Ad_1_Inst_Form(400+lengthdir_x(lenc,dirc),304+lengthdir_y(lenc,dirc),objAd_Kois_1_objBuEmpty,0.7,-300)
                    inst.DeTime=4
                }
            }
            if On_2=1{
                T3=4
                On_2=0
                dirC=random(360)
                disjd=point_distance(400,304,player.x,player.y)
                lenn=disjd-50
                for(i=0;i<4;i+=1){
                    xp1=lengthdir_x(lenn,i*90+dirC)
                    yp1=lengthdir_y(lenn,i*90+dirC)
                    xp2=lengthdir_x(lenn,(i+1)*90+dirC)
                    yp2=lengthdir_y(lenn,(i+1)*90+dirC)
                    for(j=0;j<20;j+=1){
                        inst=Scr_Kois_Ad_1_Inst_Form(400+lerp(xp1,xp2,j/20),304+lerp(yp1,yp2,j/20),objAd_Kois_1_objBuEmpty,0.7,-300)
                        inst.DeTime=4
                    }
                }
                for(i=0;i<200;i+=1){
                    dirc=random(360)
                    lenc=sqrt(random(1))*Return_Polygonal_Theta_to_R(dirc,dirC,4)*lenn
                    inst=Scr_Kois_Ad_1_Inst_Form(400+lengthdir_x(lenc,dirc),304+lengthdir_y(lenc,dirc),objAd_Kois_1_objBuEmpty,0.7,-300)
                    inst.DeTime=4
                }
            }
            T3-=1
        }
    }break
    case 6:{
        if Part>=0{
            if !Vint[0]{
                Vint[0]=1
                for(i=0;i<100;i+=1){
                    inst[i,0]=Scr_Kois_Ad_1_Inst_Form(-100,-100,objAd_Kois_1_objBuEmpty,0.8,0)
                }
                for(i=0;i<100;i+=1){
                    inst[i,8]=Scr_Kois_Ad_1_Inst_Form(400+lengthdir_x(288,i*3.6),304+lengthdir_y(288,i*3.6),objAd_Kois_1_objBuEmpty,0.6,0)
                }
                for(i=0;i<300;i+=1){
                    inst[i,1]=Scr_Kois_Ad_1_Inst_Form(-100,-100,objAd_Kois_1_objBuEmpty,0.5,0)
                }
                for(i=0;i<10;i+=1){
                    inst[i,2]=Scr_Kois_Ad_1_Inst_Form(-100,-100,objAd_Kois_1_objBuEmpty,1,0)
                }
                ArgX[1]=-32;ArgY[1]=0;ArgX[2]=-16;ArgY[2]=-16;ArgX[3]=0;ArgY[3]=-32;ArgX[4]=16;ArgY[4]=-48;ArgX[5]=-16;ArgY[5]=16;ArgX[6]=0;ArgY[6]=32;ArgX[7]=16;ArgY[7]=48;
            }
            if extent{
                scx3+=(1-scx3)/10
                for(i=0;i<100;i+=1){
                    inst[i,8].x=400+lengthdir_x(288+scx3*100,i*3.6)
                    inst[i,8].y=304+lengthdir_y(288+scx3*100,i*3.6)
                }
                repeat(2){
                    Tx1+=1
                    if Tx1<=20{
                        dirxx=(Tx1-1)*360/20+90+3
                        for(i=0;i<7;i+=1){
                            Scr_Kois_Ad_1_Inst_Form(400+lengthdir_x(190,dirxx)+Return_x_Dtheta(ArgX[i+1],ArgY[i+1],dirxx-90)*0.5,
                                      304+lengthdir_y(190,dirxx)+Return_y_Dtheta(ArgX[i+1],ArgY[i+1],dirxx-90)*0.5,
                                      objAd_Kois_1_objBuEmpty,0.7,0)
                        }
                    }
                }
            }
            for(i=0;i<100;i+=1){
                dir=random(360)
                inst[i,0].x=400+lengthdir_x(150,dir)
                inst[i,0].y=304+lengthdir_y(150,dir)
            }
            for(i=0;i<300;i+=1){
                if irandom(9-extent*9)=0{
                    dir=random(360)
                    len=power(random_range(0.1,1),-0.2)*(288+scx3*100)
                    inst[i,1].x=400+lengthdir_x(len,dir)
                    inst[i,1].y=304+lengthdir_y(len,dir)
                }
            }
            Dird[2]+=(Part*50-Dird[2])/3
            for(i=0;i<10;i+=1){
                inst[i,2].x=400+lengthdir_x(272-Part*5,i*36+Dird[2])
                inst[i,2].y=304+lengthdir_y(272-Part*5,i*36+Dird[2])
                inst[i,2].image_xscale=1+Part*0.4
                inst[i,2].image_yscale=1+Part*0.4
            }
            for(i=0;i<=Part;i+=1){
                if !Vint[i+1]{
                    for(j=0;j<20;j+=1){
                        inst[j,i+3]=Scr_Kois_Ad_1_Inst_Form(-100,-100,objAd_Kois_1_objBuEmpty,0.5,0)
                    }
                    Vint[i+1]=1
                }
                xp1=lengthdir_x(125,18-144+i*144)
                yp1=lengthdir_y(125,18-144+i*144)
                xp2=lengthdir_x(125,18+i*144)
                yp2=lengthdir_y(125,18+i*144)
                xpA=lengthdir_x(125,18-108+i*144)
                ypA=lengthdir_y(125,18-108+i*144)
                xpB=lengthdir_x(125,18-36+i*144)
                ypB=lengthdir_y(125,18-36+i*144)
                ArgScale[i]+=(1-ArgScale[i])/3
                if extent{
                    scx+=(1-scx)/10
                    scx2+=(1-scx2)/50
                    t=sin(pi/5)+sin(pi*2/5)*2
                    for(j=0;j<20;j+=1){
                        if j+0.5<20*sin(pi*2/5)/t{
                            scT=(j+0.5)*t/20/sin(pi*2/5)
                            inst[j,i+3].x=400+lerp(lerp(xp1,xp2,ArgScale[i]*(j+0.5)/20),lerp(xp1,xpA,scT),scx)
                            inst[j,i+3].y=304+lerp(lerp(yp1,yp2,ArgScale[i]*(j+0.5)/20),lerp(yp1,ypA,scT),scx)
                        }
                        else if j+0.5<20*(sin(pi*2/5)+sin(pi/5))/t{
                            scT=((j+0.5)/20*t-sin(pi*2/5))/sin(pi/5)
                            inst[j,i+3].x=400+lerp(lerp(xp1,xp2,ArgScale[i]*(j+0.5)/20),lerp(xpA,xpB,scT),scx)
                            inst[j,i+3].y=304+lerp(lerp(yp1,yp2,ArgScale[i]*(j+0.5)/20),lerp(ypA,ypB,scT),scx)
                        }
                        else{
                            scT=((j+0.5)/20*t-sin(pi*2/5)-sin(pi/5))/sin(pi*2/5)
                            inst[j,i+3].x=400+lerp(lerp(xp1,xp2,ArgScale[i]*(j+0.5)/20),lerp(xpB,xp2,scT),scx)
                            inst[j,i+3].y=304+lerp(lerp(yp1,yp2,ArgScale[i]*(j+0.5)/20),lerp(ypB,yp2,scT),scx)
                        }
                        dirjud=point_direction(400,304,inst[j,i+3].x,inst[j,i+3].y)
                        if abs(Directionapproach(dirjud,scx2*360+90,1))<Shake_Power2(scx2)*30
                        or abs(Directionapproach(dirjud,scx2*360+90+72,1))<Shake_Power2(scx2)*30
                        or abs(Directionapproach(dirjud,scx2*360+90+72*2,1))<Shake_Power2(scx2)*30
                        or abs(Directionapproach(dirjud,scx2*360+90+72*3,1))<Shake_Power2(scx2)*30
                        or abs(Directionapproach(dirjud,scx2*360+90+72*4,1))<Shake_Power2(scx2)*30{
                            inst[j,i+3].visible=0
                        }
                        else{
                            inst[j,i+3].visible=1
                        }
                    }
                }
                else{
                    for(j=0;j<20;j+=1){
                        inst[j,i+3].x=400+lerp(xp1,xp2,ArgScale[i]*(j+0.5)/20)
                        inst[j,i+3].y=304+lerp(yp1,yp2,ArgScale[i]*(j+0.5)/20)
                    }
                }
            }
        }
    }break
    case 7:{
        if Set=0{
            if !Vint{
                Vint=1
                for(j=0;j<15;j+=1){
                    xpA[j]=50
                    ypA[j]=(j+0.5)*50/15
                    xpB[j]=(j+0.5)*50/15
                    ypB[j]=50
                }
                for(i=0;i<4;i+=1){
                    for(j=0;j<15;j+=1){
                        xpA[i,j]=50
                        ypA[i,j]=(j+0.5)*50/15
                        xpB[i,j]=(j+0.5)*50/15
                        ypB[i,j]=50
                        instA[i,j]=Scr_Kois_Ad_1_Inst_Form(-100,-100,objAd_Kois_1_objBuEmpty,0.7,0)
                        instB[i,j]=Scr_Kois_Ad_1_Inst_Form(-100,-100,objAd_Kois_1_objBuEmpty,0.7,0)
                    }
                }
                xp1=-175
                yp1=175/2
                xp2=175/2
                yp2=0
            }
            T+=(T<TimeAll)
            sc1=Ease_expoN_outin(T/TimeAll,30)/3+Part/6
            for(i=0;i<4;i+=1){
                for(j=0;j<15;j+=1){
                    instA[i,j].x=400+Return_x_Dtheta(xpA[j],ypA[j],i*90+sc1*90)*(1+sc1*2.5)+lengthdir_x(sc1*175/2,i*90+180)
                    instA[i,j].y=304+Return_y_Dtheta(xpA[j],ypA[j],i*90+sc1*90)*(1+sc1*2.5)+lengthdir_y(sc1*175/2,i*90+180)
                    instB[i,j].x=400+Return_x_Dtheta(xpB[j],ypB[j],i*90+sc1*90)*(1+sc1*2.5)+lengthdir_x(sc1*175/2,i*90+180)
                    instB[i,j].y=304+Return_y_Dtheta(xpB[j],ypB[j],i*90+sc1*90)*(1+sc1*2.5)+lengthdir_y(sc1*175/2,i*90+180)
                }
            }
            if T<TimeAll && irandom(5)=0{
                for(i=0;i<5;i+=1){
                    yc[i]=random_range(104,504)
                    xd[i]=random_range(40,80)*choose(-1,1)
                }
            }
            if T<TimeAll{
                with(objAd_Kois_1_objBuEmpty){
                    for(i=0;i<5;i+=1){
                        if y>other.yc[i] && y<other.yc[i]+40{
                            x+=other.xd[i]
                        }
                    }
                }
            }
            if Shoot>0{
                if !VintS[Shoot]{
                    VintS[Shoot]=1
                    xpd=lengthdir_x(175,-90)//+Shoot*30)
                    ypd=lengthdir_y(175,-90)//+Shoot*30)
                    xpd2=lengthdir_x(175,-90)//+Shoot*40)
                    ypd2=lengthdir_y(175,-90)//+Shoot*40)
                    for(i=0;i<4;i+=1){
                        for(j=0.5;j<15;j+=1){
                            inst=Scr_Kois_Ad_1_Inst_Form(400+Return_x_Dtheta(xp1,yp1,i*90),304+Return_y_Dtheta(xp1,yp1,i*90),objAd_Kois_1_objBu1,0.5,3)
                            inst.xto=400+Return_x_Dtheta(xp1+xpd*j/15,yp1+ypd*j/15,i*90)
                            inst.yto=304+Return_y_Dtheta(xp1+xpd*j/15,yp1+ypd*j/15,i*90)
                            inst=Scr_Kois_Ad_1_Inst_Form(400+Return_x_Dtheta(xp1,yp1,i*90),304+Return_y_Dtheta(xp1,yp1,i*90),objAd_Kois_1_objBu1,0.5,3)
                            inst.xto=400+Return_x_Dtheta(xp1,yp1,i*90)+Return_x_Dtheta(xpd*j/15,ypd*j/15,i*90-135)*0.5
                            inst.yto=304+Return_y_Dtheta(xp1,yp1,i*90)+Return_y_Dtheta(xpd*j/15,ypd*j/15,i*90-135)*0.5
                            inst=Scr_Kois_Ad_1_Inst_Form(400+Return_x_Dtheta(xp1,yp1,i*90),304+Return_y_Dtheta(xp1,yp1,i*90),objAd_Kois_1_objBu1,0.5,3)
                            inst.xto=400+Return_x_Dtheta(xp1,yp1,i*90)+Return_x_Dtheta(xpd*j/15,ypd*j/15,i*90+135)*0.5
                            inst.yto=304+Return_y_Dtheta(xp1,yp1,i*90)+Return_y_Dtheta(xpd*j/15,ypd*j/15,i*90+135)*0.5
                            inst=Scr_Kois_Ad_1_Inst_Form(400+Return_x_Dtheta(xp2,yp2,i*90),304+Return_y_Dtheta(xp2,yp2,i*90),objAd_Kois_1_objBu1,0.5,3)
                            inst.xto=400+Return_x_Dtheta(xp2+xpd2*j/15,yp2+ypd2*j/15,i*90)
                            inst.yto=304+Return_y_Dtheta(xp2+xpd2*j/15,yp2+ypd2*j/15,i*90)
                            inst=Scr_Kois_Ad_1_Inst_Form(400+Return_x_Dtheta(xp2,yp2,i*90),304+Return_y_Dtheta(xp2,yp2,i*90),objAd_Kois_1_objBu1,0.5,3)
                            inst.xto=400+Return_x_Dtheta(xp2,yp2,i*90)+Return_x_Dtheta(xpd2*j/15,ypd2*j/15,i*90-135)*0.5
                            inst.yto=304+Return_y_Dtheta(xp2,yp2,i*90)+Return_y_Dtheta(xpd2*j/15,ypd2*j/15,i*90-135)*0.5
                            inst=Scr_Kois_Ad_1_Inst_Form(400+Return_x_Dtheta(xp2,yp2,i*90),304+Return_y_Dtheta(xp2,yp2,i*90),objAd_Kois_1_objBu1,0.5,3)
                            inst.xto=400+Return_x_Dtheta(xp2,yp2,i*90)+Return_x_Dtheta(xpd2*j/15,ypd2*j/15,i*90+135)*0.5
                            inst.yto=304+Return_y_Dtheta(xp2,yp2,i*90)+Return_y_Dtheta(xpd2*j/15,ypd2*j/15,i*90+135)*0.5
                        }
                    }
                    xp1=xp1+xpd
                    yp1=yp1+ypd
                    xp2=xp2+xpd2
                    yp2=yp2+ypd2
                }
            }
        }
        if Shoot>0{
            TSh+=1
            if TSh mod 4=0{
                repeat(100){
                    len=sqrt(random_range(0.01,1))*800
                    dir=random(360)
                    inst=Scr_Kois_Ad_1_Inst_Form(player.x+lengthdir_x(len,dir),player.y+lengthdir_y(len,dir),objAd_Kois_1_objBu1,random_range(0.5,0.8),-300)
                    inst.DeTime=4
                }
            }
        }
        if Set=1{
            sc+=(1-sc)/10
            with(objAd_Kois_1_objBuEmpty){
                if form!=-300{
                    if y-2*x<-496{
                        x-=(1-other.sc)*(10-sin(abs(y-2*x+496)/100)*4)/2
                        y-=(1-other.sc)*(10-sin(abs(y-2*x+496)/100)*4)
                    }
                    else{
                        x+=(1-other.sc)*(10-sin(abs(y-2*x+496)/100)*4)/2
                        y+=(1-other.sc)*(10-sin(abs(y-2*x+496)/100)*4)
                    }
                }
            }
        }
    }break
    case 8:{
        T+=1
        if T mod 2=0{
            for(i=0;i<4;i+=1){
                Scr_Kois_Ad_1_Inst_Form(xc+Num*35+i*6,yc,objAd_Kois_1_objBuEmpty,0.4,0)
            }
            Num+=1
            if ud=1{
                with(objAd_Kois_1_objBuEmpty){
                    if nde=0{
                        if ((bbox_left-50)div 100 + (bbox_top-54)div 100)<other.Num{
                            instance_destroy()
                        }
                    }
                }
            }
            else{
                with(objAd_Kois_1_objBuEmpty){
                    if nde=0{
                        if ((bbox_left-50)div 100 + (554-bbox_bottom)div 100)<other.Num{
                            instance_destroy()
                        }
                    }
                }
            }
        }
        if T=22{
            instance_destroy()
        }
    }break
    case 9:{
        T+=1
        for(i=5;i<800;i+=10){
            xp=i+random_range(-5,5)*T/20
            yp=(T-0.5)*608/20+random_range(-5,5)*T/20
            s=0
            if ((sqr((xp-100)/600)+sqr((yp-554)/450))<1){
                if (sqrt(sqr((xp-700)/600)+sqr((yp-54)/450))<1){
                    s=1
                }
            }
            if !s Scr_Kois_Ad_1_Inst_Form(xp,yp,objAd_Kois_1_objBuEmptyPlus,0.4,0)
        }
        for(i=9;i<604;i+=10){
            xp=(T-0.5)*800/20+random_range(-5,5)*T/20
            yp=i+random_range(-5,5)*T/20
            s=0
            if (sqrt(sqr((xp-100)/600)+sqr((yp-554)/450))<1){
                if (sqrt(sqr((xp-700)/600)+sqr((yp-54)/450))<1){
                    s=1
                }
            }
            if !s Scr_Kois_Ad_1_Inst_Form(xp,yp,objAd_Kois_1_objBuEmptyPlus,0.4,0)
        }
        if T=20{
            instance_destroy()
        }
    }break
    case 10:{
        if T mod 2=0{
            repeat(300){
                len=power(random_range(0.02,1),-0.3)*(100+Ease_expoN_outin(T/30,100)*440)
                dir=random(360)
                inst=Scr_Kois_Ad_1_Inst_Form(400+lengthdir_x(len,dir),304+lengthdir_y(len,dir),objAd_Kois_1_objBuEmpty,random_range(0.5,1),-300)
                inst.DeTime=irandom(3)
            }
        }
        T+=1
        if T=30 instance_destroy()
    }break
    case 11:{
        if Mark=1{
            if TM<20{
                xpM1=(TM-10)*40+400
                ypM1=(125+(TM mod 2)*50)
                xpM2=(TM-9)*40+400
                ypM2=(175-(TM mod 2)*50)
                for(i=0.5;i<8;i+=1){
                    Scr_Kois_Ad_1_Inst_Form(lerp(xpM1,xpM2,i/8),lerp(ypM1,ypM2,i/8),objAd_Kois_1_objBuEmptyPlus,0.5,0)
                    Scr_Kois_Ad_1_Inst_Form(lerp(xpM1,xpM2,i/8),lerp(ypM1,ypM2,i/8)+30,objAd_Kois_1_objBuEmptyPlus,0.5,0)
                }
            }
            TM+=1
        }
        else{
            if TM<20{
                xpM1=(TM-10)*40+400
                ypM1=(483-(TM mod 2)*50)
                xpM2=(TM-9)*40+400
                ypM2=(433+(TM mod 2)*50)
                for(i=0.5;i<8;i+=1){
                    Scr_Kois_Ad_1_Inst_Form(lerp(xpM1,xpM2,i/8),lerp(ypM1,ypM2,i/8),objAd_Kois_1_objBuEmptyPlus,0.5,0)
                    Scr_Kois_Ad_1_Inst_Form(lerp(xpM1,xpM2,i/8),lerp(ypM1,ypM2,i/8)-30,objAd_Kois_1_objBuEmptyPlus,0.5,0)
                }
            }
            TM+=1
        }
        if !Vint{
            G=0.95
            theta=55
            theta2=135
            Ydg1=Count_Arithmetical_List(1,1,TimeAll1)*G

            dir2=theta*2-90
            Xd2=lengthdir_x(G*TimeAll1*TimeAll2,dir2)
            Yd2=lengthdir_y(G*TimeAll1*TimeAll2,dir2)

            Ydg2=Count_Arithmetical_List(1,1,TimeAll2)*G
            dirNow=point_direction(0,0,lengthdir_x(TimeAll1*G,dir2),lengthdir_y(TimeAll1*G,dir2)+TimeAll2*G)
            speNow=point_distance(0,0,lengthdir_x(TimeAll1*G,dir2),lengthdir_y(TimeAll1*G,dir2)+TimeAll2*G)
            dir3=(theta2+90)*2-dirNow
            for(i=0;i<40;i+=1){
                instd[i,1]=Scr_Kois_Ad_1_Inst_Form(-100,-100,objAd_Kois_1_objBuEmpty,0.75,0)
            }
            Vint=1
        }
        xcp=xc
        ycp=yc
        if drop=1{
            T+=1
            if T<TimeAll1{
                sc=T/TimeAll1
                xc=0
                yc=Ease_power2_out(sc)*Ydg1
            }
            else if T<=TimeAll1+TimeAll2{
                sc=(T-TimeAll1)/TimeAll2
                xc=sc*Xd2
                yc=Ydg1+sc*Yd2+Ease_power2_out(sc)*Ydg2
                if !Vint2{
                    if Mark=1{
                        for(i=0;i<30;i+=1){
                            inst=Scr_Kois_Ad_1_Inst_Form(140+xc+lengthdir_x(50,i*12),50+yc+lengthdir_y(50,i*12),objAd_Kois_1_objBuEmptyPlus,0.75,0)
                            inst.ndep=1
                        }
                        for(i=0;i<30;i+=1){
                            inst=Scr_Kois_Ad_1_Inst_Form(140+xc+lengthdir_x(100,i*12),50+yc+lengthdir_y(100,i*12),objAd_Kois_1_objBuEmptyPlus,0.75,0)
                            inst.ndep=1
                        }
                        inst=Scr_Kois_Ad_1_Inst_Form(140+xc,50+yc,objAd_Kois_1_objBuEmptyPlus,2,0)
                        inst.ndep=1
                        with(playerKiller){
                            if ndep=0{
                                if point_distance(140+other.xc,50+other.yc,x,y)<100 instance_destroy()
                            }
                        }
                    }
                    else{
                        for(i=0;i<30;i+=1){
                            inst=Scr_Kois_Ad_1_Inst_Form(660-xc+lengthdir_x(50,i*12),50+yc+lengthdir_y(50,i*12),objAd_Kois_1_objBuEmptyPlus,0.75,0)
                            inst.ndep=1
                        }
                        for(i=0;i<30;i+=1){
                            inst=Scr_Kois_Ad_1_Inst_Form(660-xc+lengthdir_x(100,i*12),50+yc+lengthdir_y(100,i*12),objAd_Kois_1_objBuEmptyPlus,0.75,0)
                            inst.ndep=1
                        }
                        inst=Scr_Kois_Ad_1_Inst_Form(660-xc,50+yc,objAd_Kois_1_objBuEmptyPlus,2,0)
                        inst.ndep=1
                        with(playerKiller){
                            if ndep=0{
                                if point_distance(660-other.xc,50+other.yc,x,y)<100 instance_destroy()
                            }
                        }
                    }
                    Vint2=1
                }
            }
            else{
                drop=2
                x=xc
                y=yc
                hs=lengthdir_x(speNow,dir3)
                vs=lengthdir_y(speNow,dir3)
                if !Vint3{
                    if Mark=1{
                        for(i=0;i<30;i+=1){
                            inst=Scr_Kois_Ad_1_Inst_Form(140+xc+lengthdir_x(50,i*12),50+yc+lengthdir_y(50,i*12),objAd_Kois_1_objBuEmptyPlus,0.75,0)
                            inst.ndep=1
                        }
                        for(i=0;i<30;i+=1){
                            inst=Scr_Kois_Ad_1_Inst_Form(140+xc+lengthdir_x(100,i*12),50+yc+lengthdir_y(100,i*12),objAd_Kois_1_objBuEmptyPlus,0.75,0)
                            inst.ndep=1
                        }
                        inst=Scr_Kois_Ad_1_Inst_Form(140+xc,50+yc,objAd_Kois_1_objBuEmptyPlus,2,0)
                        inst.ndep=1
                        with(playerKiller){
                            if ndep=0{
                                if point_distance(140+other.xc,50+other.yc,x,y)<100 instance_destroy()
                            }
                        }
                    }
                    else{
                        for(i=0;i<30;i+=1){
                            inst=Scr_Kois_Ad_1_Inst_Form(660-xc+lengthdir_x(50,i*12),50+yc+lengthdir_y(50,i*12),objAd_Kois_1_objBuEmptyPlus,0.75,0)
                            inst.ndep=1
                        }
                        for(i=0;i<30;i+=1){
                            inst=Scr_Kois_Ad_1_Inst_Form(660-xc+lengthdir_x(100,i*12),50+yc+lengthdir_y(100,i*12),objAd_Kois_1_objBuEmptyPlus,0.75,0)
                            inst.ndep=1
                        }
                        inst=Scr_Kois_Ad_1_Inst_Form(660-xc,50+yc,objAd_Kois_1_objBuEmptyPlus,2,0)
                        inst.ndep=1
                        with(playerKiller){
                            if ndep=0{
                                if point_distance(660-other.xc,50+other.yc,x,y)<100 instance_destroy()
                            }
                        }
                    }
                    Vint3=1
                }
            }
        }
        if drop=2{
            x+=hs
            y+=vs
            vs+=1
            xc=x
            yc=y
            if y>658{
                instance_destroy()
                for(i=0;i<40;i+=1){
                    instance_destroy_id(inst[i,1])
                }
            }
        }
        if drop>0{
            if Mark=1{
                for(i=0;i<40;i+=1){
                    instd[i,1].x=140+xc+lengthdir_x(50,i*9)
                    instd[i,1].y=50+yc+lengthdir_y(50,i*9)
                }
                dir=point_direction(xcp,ycp,xc,yc)
                inst=Scr_Kois_Ad_1_Inst_Form(140+xcp+lengthdir_x(50,dir+90),50+ycp+lengthdir_y(50,dir+90),objAd_Kois_1_objBuEmptyPlus,0.75,0)
                inst.ndep=1
                inst=Scr_Kois_Ad_1_Inst_Form(140+xcp+lengthdir_x(50,dir-90),50+ycp+lengthdir_y(50,dir-90),objAd_Kois_1_objBuEmptyPlus,0.75,0)
                inst.ndep=1
                with(playerKiller){
                    if ndep=0{
                        if point_distance(140+other.xc,50+other.yc,x,y)<50 instance_destroy()
                    }
                }
            }
            else{
                for(i=0;i<40;i+=1){
                    instd[i,1].x=660-xc-lengthdir_x(50,i*9)
                    instd[i,1].y=50+yc+lengthdir_y(50,i*9)
                }
                dir=point_direction(xcp,ycp,xc,yc)
                inst=Scr_Kois_Ad_1_Inst_Form(660-xcp-lengthdir_x(50,dir+90),50+ycp+lengthdir_y(50,dir+90),objAd_Kois_1_objBuEmptyPlus,0.75,0)
                inst.ndep=1
                inst=Scr_Kois_Ad_1_Inst_Form(660-xcp-lengthdir_x(50,dir-90),50+ycp+lengthdir_y(50,dir-90),objAd_Kois_1_objBuEmptyPlus,0.75,0)
                inst.ndep=1
                with(playerKiller){
                    if ndep=0{
                        if point_distance(660-other.xc,50+other.yc,x,y)<50 instance_destroy()
                    }
                }
            }
        }
    }break
    case 12:{
        if !Vint{
            with(playerKiller){
                if bbox_left<200 && bbox_top<320 instance_destroy()
            }
            for(i=0;i<100;i+=1){
                yp[i]=random(288)
                xp[i]=lerp(random(200),100+sin(yp[i]/50),random_range(0.1,1))
                inst=Scr_Kois_Ad_1_Inst_Form(xp[i],yp[i]-random_range(20,100),objAd_Kois_1_objBu2,1,3)
                inst.yto=yp[i]
            }
            Vint=1
        }
        if on=1{
            T+=1
            with(playerKiller){
                if bbox_left>other.T*60 && bbox_left<200+other.T*60 && bbox_top<320 instance_destroy()
            }
            for(i=0;i<100;i+=1){
                inst=Scr_Kois_Ad_1_Inst_Form(xp[i]+T*60,yp[i],objAd_Kois_1_objBuEmptyPlus,1,0)
            }
            if T=10 instance_destroy()
        }
    }break
    case 13:{
        if !Vint{
            for(i=0;i<50;i+=1){
                inst[i,0]=Scr_Kois_Ad_1_Inst_Form(-100,-100,objAd_Kois_1_objBuEmptyPlus,0.75,0)
                inst[i,0].ndex=1
                inst[i,1]=Scr_Kois_Ad_1_Inst_Form(-100,-100,objAd_Kois_1_objBuEmptyPlus,0.75,0)
                inst[i,1].ndex=1
            }
            Num=10*6+14*7
            for(i=0;i<Num;i+=1){
                inst[i,2]=Scr_Kois_Ad_1_Inst_Form(-100,-100,objAd_Kois_1_objBuEmptyPlus,0.75,0)
                inst[i,2].ndex=1
            }
            Vint=1
            xd=-random(800/6)
        }
        sc+=(1-sc)/8
        for(i=0;i<50;i+=1){
            inst[i,0].x=(i+0.5)*800/50
            inst[i,0].y=464-sc*128
            inst[i,1].x=(i+0.5)*800/50
            inst[i,1].y=464+sc*128
        }
        with(playerKiller){
            if y>464-other.sc*128 && y<464+other.sc*128 && ndex=0{
                instance_destroy()
            }
        }
        if cha=0{
            Tsin+=1
            for(i=0;i<Num;i+=1){
                inst[i,2].x=(i+0.5)*800/Num
                inst[i,2].y=464+sin(i*12*pi/Num+Tsin/5)*sc*100
            }
        }
        if cha=1{
            for(i=0;i<Num;i+=1){
                j=i mod 24
                if j<14{
                    xp1=xd+(i div 24)*800/6
                    xp2=xd+(i div 24+1)*800/6
                    yp1=364
                    yp2=564
                    k=j+0.5
                    s=14
                }
                else{
                    xp1=xd+(i div 24+1)*800/6
                    xp2=xd+(i div 24+1)*800/6
                    yp1=564
                    yp2=364
                    k=j-14+0.5
                    s=10
                }
                inst[i,2].x+=(lerp(xp1,xp2,k/s)-inst[i,2].x)/4
                inst[i,2].y+=(lerp(yp1,yp2,k/s)-inst[i,2].y)/4
            }
        }
        if NTi>=1{
            if !Vint[NTi]{
                Vint[NTi]=1
                for(i=0;i<=50;i+=1){
                    instx=Scr_Kois_Ad_1_Inst_Form(xd+NTi*800/6,i*608/50,objAd_Kois_1_objBuEmpty,0.75,0)
                    instx.ndex=1
                }
            }
            with(playerKiller){
                if x<other.xd+other.NTi*800/6-1{
                    instance_destroy()
                }
            }
        }
    }break
}

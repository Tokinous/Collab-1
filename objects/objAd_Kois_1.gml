#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///耐久相关配置

//这是用来进行耐久时间轴的obj



//读取BGM-----------------------------------
if instance_exists(objAd_Kois_1_Enter){
    bgmBoss = FMODSoundAdd(global.music_directory + '天使沙拉.mp3'    ,0,0);
}




//关于音乐信息-----------------------------------------------
//如果你要用跟我一样的方式在step里写耐久

KoisRealtimeCountModeOn = true;
STARTSTEP = 10///歌曲开始的秒数*50
MusicBPM = 177///歌曲BPM
start_pos = 0;//Return_realtime(XXX)//开始时的拍数，测试用


/*否则启用时间轴
{
KoisRealtimeCountModeOn = false;
MusicBPM = XXX///歌曲BPM
UseTimeLine = XXX//使用时间轴
start_pos = XXX//时间轴开始的步数，测试用
}
*/




//进耐久房间相关的obj------------------------------------
ObjEnterRoom = objAd_Sample_Enter;



//提前定义obj变量----------------------------
/*
Bu1 = ObjBulletXXXXX;
Bu2 = ObjBulletXXXXX;
etc.
*/



if (surface_exists(surface3)){
    surface_free(surface3);
}
surface3 = surface_create(800, 608);
if (surface_exists(surface4)){
    surface_free(surface4);
}
surface4 = surface_create(800, 608);
with(block){
    visible = 0;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
FMODSoundSetMaxVolume(bgmBoss,0.3)
global.BGMHandler = FMODSoundPlay(bgmBoss);
FMODInstanceSetVolume(global.BGMHandler,1);

if (KoisRealtimeCountModeOn == false){
    bgm_length = FMODSoundGetLength(bgmBoss);
    beat = 4;
    globalvar SPB;
    SPB = 3000 / MusicBPM;

    timeline_index = UseTimeLine;
    timeline_speed = (beat * MusicBPM) / 3000;

    timeline_running = 1;
    timeline_position = start_pos;

    start_pos = start_pos / timeline_speed;

}




bgm_length = FMODSoundGetLength(bgmBoss);
realtime=start_pos
m_time = start_pos / 50 * 1000;
_st = start_pos / 50;
FMODInstanceSetPosition(global.BGMHandler,_st/bgm_length);
FMODInstanceSetPaused(global.BGMHandler,0);

if FMODInstanceIsPlaying(global.BGMHandler)
    m_time += 1000 / room_speed;

if abs(FMODInstanceGetPosition(global.BGMHandler)*bgm_length-m_time)>75
    FMODInstanceSetPosition(global.BGMHandler,m_time/bgm_length);

FMODUpdate();
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

realtime+=1
if(instance_exists(player) == 0){
    timeline_running=0
}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///系统式时间轴
player.infJump = 1;
NBeat=Return_beat(realtime)
if instance_exists(player){
switch(realtime){
    case Return_realtime(0):
        Scr_Kois_Ad_1_Inst_Creator(1)
    break
    case Return_realtime(20):
        Scr_Kois_Ad_1_Inst_Creator(2)
    break
    case Return_realtime(23):
        for(i=0;i<20;i+=1){
            xp[i]=random(800/9)
            yp[i]=random(104)
        }
        Num=0
    case Return_realtime(24):
    case Return_realtime(25):
    case Return_realtime(26):
    case Return_realtime(27):
    case Return_realtime(28):
    case Return_realtime(29):
    case Return_realtime(30):
    case Return_realtime(31):
        with(objAd_Kois_1_objBu1){
            if form=1{
                if y>304 && ((x>800*other.Num/9 && x<800*(other.Num+1)/9) or x<=0 or x>=800){
                    instance_destroy()
                }
                if y<304 && ((x>800-800*(other.Num+1)/9 && x<800-800*other.Num/9) or x<=0 or x>=800){
                    instance_destroy()
                }
            }
        }
        for(i=0;i<20;i+=1){
            inst=Scr_Kois_Ad_1_Inst_Form(800*Num/9+xp[i],504+yp[i],objAd_Kois_1_objBuEmpty,1,0)
            inst.Mark=2
            inst=Scr_Kois_Ad_1_Inst_Form(800-800*(Num+1)/9+xp[i],yp[i],objAd_Kois_1_objBuEmpty,1,0)
            inst.Mark=2
        }
        Num+=1
    break
    case Return_realtime(32):
        with(objAd_Kois_1_Creator){
            if form=3 de=1
        }
    case Return_realtime(48):
    case Return_realtime(64):
        inst=Scr_Kois_Ad_1_Inst_Drawcreator(1)
        inst.TimeAll=Return_duration(NBeat,NBeat+8)
    break
    case Return_realtime(80):
        inst=Scr_Kois_Ad_1_Inst_Drawcreator(2)
        inst.TimeAll=Return_duration(NBeat,NBeat+8)
    break

    case Return_realtime(40):
    case Return_realtime(56):
    case Return_realtime(72):
    case Return_realtime(88):
        with(objAd_Kois_1_Creator){
            if form=2{
                other.sav=A
            }
        }
        with(objAd_Kois_1_DrawCreator){
            if form=1 or form=2{
                shoot=1
                A=other.sav
            }
        }
    break
    case Return_realtime(93):
        inst=Scr_Kois_Ad_1_Inst_Creator(4)
        inst.TimeAll=Return_duration(93,97)
    break
    case Return_realtime(95):
        with(objAd_Kois_1_Creator){
            if form!=4 instance_destroy()
        }
        with(objAd_Kois_1_objBuEmpty){
            if nde=0 instance_destroy()
        }
    break
    case Return_realtime(96):
        inst=Scr_Kois_Ad_1_Inst_Creator(5)
        inst.TimeAll=Return_duration(96,155)
        for(i=0;i<40;i+=1){
            Scr_Kois_Ad_1_Inst_Form(400+lengthdir_x(50,i*9),304+lengthdir_y(50,i*9),objAd_Kois_1_objBuEmpty,1,0)
        }
    break
    case Return_realtime(140):
        inst=instance_create(0,0,objAd_Kois_1_Effect)
        inst.form=1
        inst.TimeAll=Return_duration(140,155)
        player.GodMode=1
    break
    case Return_realtime(157):
        with(objAd_Kois_1_Creator)instance_destroy()
        with(objAd_Kois_1_Effect)instance_destroy()
        with(objAd_Kois_1_objBuEmpty)instance_destroy()
        //with(objAd_Kois_1_objBuEmpty)instance_destroy()
        inst=instance_create(400,304,objAd_Kois_1_None)
        inst.sprite_index=Kois_Ad_1_SprWord
        player.x=400
        player.y=544+23
        player.vspeed=0
        player.GodMode=0
    break
    case Return_realtime(160):
        instance_destroy_id(objAd_Kois_1_None)
        inst=Scr_Kois_Ad_1_Inst_Creator(6)
    break
    case Return_realtime(163):
        inst.Part+=1
    break
    case Return_realtime(166):
        inst.Part+=1
    break
    case Return_realtime(168):
        inst.Part+=1
    break
    case Return_realtime(171):
        inst.Part+=1
    break
    case Return_realtime(173):
        inst.extent=1
    break


    case Return_realtime(176):
        with(objAd_Kois_1_objBuEmpty){
            instance_destroy()
        }
        with(objAd_Kois_1_Creator){
            instance_destroy()
        }
        inst=Scr_Kois_Ad_1_Inst_Creator(7)
        inst.TimeAll=Return_duration(176,182)
    break
    case Return_realtime(178):
    case Return_realtime(179):
    case Return_realtime(180):
    case Return_realtime(181):
        inst.Part+=1
    break
    case Return_realtime(186):
        inst.Set=1
        with(objAd_Kois_1_objBu1){
            if form!=-300{
                instance_destroy()
                Scr_Kois_Ad_1_Inst_Form(x,y,objAd_Kois_1_objBuEmpty,image_xscale,0)
            }
        }
    case Return_realtime(182):
    case Return_realtime(182+4/3):
    case Return_realtime(182+8/3):
        inst.Shoot+=1
    break
    case Return_realtime(190):
        with(objAd_Kois_1_objBuEmpty)instance_destroy()
        with(objAd_Kois_1_Creator)instance_destroy()
        with(objAd_Kois_1_objBu1)instance_destroy()
        for(i=0;i<360;i+=1){
            inst=Scr_Kois_Ad_1_Inst_Form(400+lengthdir_x(80,i),304+lengthdir_y(120,i),objAd_Kois_1_objBuEmpty,0.4,0)
            inst.direction=i*9
            inst.speed=1
        }
        for(i=0;i<360;i+=1){
            inst=Scr_Kois_Ad_1_Inst_Form(400+lengthdir_x(120,i),304+lengthdir_y(80,i),objAd_Kois_1_objBuEmpty,0.4,0)
            inst.direction=i*9
            inst.speed=1
        }
    break
    case Return_realtime(192):
        with(objAd_Kois_1_objBuEmpty)instance_destroy()
        for(i=0;i<200;i+=1){
            dir=random(360)
            Scr_Kois_Ad_1_Inst_Form(400+lengthdir_x(400,dir),304+lengthdir_y(400,dir),objAd_Kois_1_objBuEmpty,0.8,0)
        }
    break
    case Return_realtime(192+4/3):
        with(objAd_Kois_1_objBuEmpty)instance_destroy()
        for(i=0;i<200;i+=1){
            dir=random(360)
            Scr_Kois_Ad_1_Inst_Form(400+lengthdir_x(360,dir),304+lengthdir_y(360,dir),objAd_Kois_1_objBuEmpty,0.8,0)
        }
    break
    case Return_realtime(192+8/3):
        with(objAd_Kois_1_objBuEmpty)instance_destroy()
        for(i=0;i<100;i+=1){
            Scr_Kois_Ad_1_Inst_Form(400+lengthdir_x(350,i*3.6),304+lengthdir_y(350,i*3.6),objAd_Kois_1_objBuEmpty,1,0)
            Scr_Kois_Ad_1_Inst_Form(400+lengthdir_x(375,i*3.6),304+lengthdir_y(375,i*3.6),objAd_Kois_1_objBuEmpty,0.4,0)
        }
        for(i=0;i<36;i+=1){
            Scr_Kois_Ad_1_Inst_Form(400+lengthdir_x(450,i*10),304+lengthdir_y(450,i*10),objAd_Kois_1_objBuEmpty,5,0)
        }
    break
    case Return_realtime(196):
        Size=irandom(3)
        SC=4/8
        ArgX[1]=0;ArgY[1]=0;ArgX[2]=0;ArgY[2]=-16;ArgX[3]=0;ArgY[3]=-32;ArgX[4]=0;ArgY[4]=16;ArgX[5]=0;ArgY[5]=32;ArgX[6]=20;ArgY[6]=24;ArgX[7]=40;ArgY[7]=16;ArgX[8]=60;ArgY[8]=8;ArgX[9]=20;ArgY[9]=-24;ArgX[10]=40;ArgY[10]=-16;ArgX[11]=60;ArgY[11]=-8;ArgX[12]=80;ArgY[12]=0;
        NumL=0
        for(i=0;i<20;i+=1){
            Num[i]=0
        }
    case Return_realtime(197):
    case Return_realtime(198):
    case Return_realtime(199):
        for(i=0;i<20;i+=1){
            dir=i*18
            xc=400+lengthdir_x(340-NumL*80*SC,dir)
            yc=304+lengthdir_y(340-NumL*80*SC,dir)
            Num[i]+=1
            if Num[i]<=((Size+i)mod 4)+1{
                for(j=1;j<=12;j+=1){
                    Scr_Kois_Ad_1_Inst_Form(xc+Return_x_Dtheta(ArgX[j]*SC,ArgY[j]*SC,dir+180),yc+Return_y_Dtheta(ArgX[j]*SC,ArgY[j]*SC,dir+180),objAd_Kois_1_objBuEmpty,0.4,0)
                }
            }
        }
        NumL+=1
    break
    case Return_realtime(200):
        for(i=0;i<4;i+=1){
            xp1=lengthdir_x(80,i*90+37)
            yp1=lengthdir_y(80,i*90+37)
            xp2=lengthdir_x(80,i*90+127)
            yp2=lengthdir_y(80,i*90+127)
            for(j=0;j<20;j+=1){
                xd=lerp(xp1,xp2,j/20)
                yd=lerp(yp1,yp2,j/20)
                len=point_distance(0,0,xd,yd)
                dir=point_direction(0,0,xd,yd)
                inst=Scr_Kois_Ad_1_Inst_Form(-100,-100,objAd_Kois_1_objBu1,0.9,4)
                inst.len=len
                inst.dir=dir
                inst.dirto=dir+53
            }
        }
    break
    case Return_realtime(202):
        with(objAd_Kois_1_objBu1){
            if form=4{
                dirto-=70
            }
        }
    break
    case Return_realtime(203):
        with(objAd_Kois_1_objBu1){
            if form=4{
                instance_destroy()
            }
        }
    break
    case Return_realtime(203)+4:
        for(i=0;i<40;i+=1){
            inst=Scr_Kois_Ad_1_Inst_Form(-100,-100,objAd_Kois_1_objBu1,0.9,4)
            inst.len=100
            inst.dir=i*9-10
            inst.dirto=i*9-90
            inst.ext=1
        }
        for(i=0;i<14;i+=1){
            inst=Scr_Kois_Ad_1_Inst_Form(-100,-100,objAd_Kois_1_objBu1,0.9,4)
            inst.len=(i-6.5)*20*10/14
            inst.dir=-10
            inst.dirto=-90
            inst.ext=1
            inst=Scr_Kois_Ad_1_Inst_Form(-100,-100,objAd_Kois_1_objBu1,0.9,4)
            inst.len=(i-6.5)*20*10/14
            inst.dir=80
            inst.dirto=0
            inst.ext=1
        }
    break
    case Return_realtime(206):
        with(objAd_Kois_1_objBuEmpty){
            if bbox_left<50 or bbox_right>750 or bbox_top<54 or bbox_bottom>554{
                instance_destroy()
            }
        }
        for(i=50;i<=750;i+=12.5){
            inst=Scr_Kois_Ad_1_Inst_Form(i,54,objAd_Kois_1_objBuEmpty,0.6,0)
            inst.nde=1
            inst=Scr_Kois_Ad_1_Inst_Form(i,554,objAd_Kois_1_objBuEmpty,0.6,0)
            inst.nde=1
        }
        for(i=79-12.5;i<=529+12.5;i+=12.5){
            inst=Scr_Kois_Ad_1_Inst_Form(50,i,objAd_Kois_1_objBuEmpty,0.6,0)
            inst.nde=1
            inst=Scr_Kois_Ad_1_Inst_Form(750,i,objAd_Kois_1_objBuEmpty,0.6,0)
            inst.nde=1
        }
    break
    case Return_realtime(208):
        ArgX[1]=-315;ArgY[1]=-50;ArgSc[1]=0.62;ArgX[2]=-305;ArgY[2]=-50;ArgSc[2]=0.62;ArgX[3]=-295;ArgY[3]=-50;ArgSc[3]=0.62;ArgX[4]=-325;ArgY[4]=-45;ArgSc[4]=0.62;ArgX[5]=-330;ArgY[5]=-35;ArgSc[5]=0.62;ArgX[6]=-330;ArgY[6]=-25;ArgSc[6]=0.62;ArgX[7]=-330;ArgY[7]=-15;ArgSc[7]=0.62;ArgX[8]=-330;ArgY[8]=-5;ArgSc[8]=0.62;ArgX[9]=-325;ArgY[9]=5;ArgSc[9]=0.62;ArgX[10]=-315;ArgY[10]=10;ArgSc[10]=0.62;ArgX[11]=-305;ArgY[11]=10;ArgSc[11]=0.62;ArgX[12]=-295;ArgY[12]=10;ArgSc[12]=0.62;ArgX[13]=-295;ArgY[13]=0;ArgSc[13]=0.62;ArgX[14]=-295;ArgY[14]=-10;ArgSc[14]=0.62;ArgX[15]=-295;ArgY[15]=-20;ArgSc[15]=0.62;ArgX[16]=-305;ArgY[16]=-20;ArgSc[16]=0.62;ArgX[17]=-275;ArgY[17]=10;ArgSc[17]=0.62;ArgX[18]=-275;ArgY[18]=0;ArgSc[18]=0.62;ArgX[19]=-275;ArgY[19]=-10;ArgSc[19]=0.62;ArgX[20]=-275;ArgY[20]=-20;ArgSc[20]=0.62;ArgX[21]=-275;ArgY[21]=-30;ArgSc[21]=0.62;ArgX[22]=-260;ArgY[22]=-50;ArgSc[22]=0.62;ArgX[23]=-250;ArgY[23]=-50;ArgSc[23]=0.62;ArgX[24]=-270;ArgY[24]=-40;ArgSc[24]=0.62;ArgX[25]=-240;ArgY[25]=-40;ArgSc[25]=0.62;ArgX[26]=-235;ArgY[26]=-30;ArgSc[26]=0.62;ArgX[27]=-235;ArgY[27]=-20;ArgSc[27]=0.62;ArgX[28]=-235;ArgY[28]=-10;ArgSc[28]=0.62;ArgX[29]=-235;ArgY[29]=0;ArgSc[29]=0.62;ArgX[30]=-235;ArgY[30]=10;ArgSc[30]=0.62;ArgX[31]=-265;ArgY[31]=-20;ArgSc[31]=0.62;ArgX[32]=-245;ArgY[32]=-20;ArgSc[32]=0.62;ArgX[33]=-255;ArgY[33]=-20;ArgSc[33]=0.62;ArgX[34]=-215;ArgY[34]=10;ArgSc[34]=0.62;ArgX[35]=-215;ArgY[35]=0;ArgSc[35]=0.62;ArgX[36]=-215;ArgY[36]=-10;ArgSc[36]=0.62;ArgX[37]=-215;ArgY[37]=-20;ArgSc[37]=0.62;ArgX[38]=-215;ArgY[38]=-30;ArgSc[38]=0.62;ArgX[39]=-215;ArgY[39]=-40;ArgSc[39]=0.62;ArgX[40]=-215;ArgY[40]=-50;ArgSc[40]=0.62;ArgX[41]=-205;ArgY[41]=-40;ArgSc[41]=0.62;ArgX[42]=-195;ArgY[42]=-30;ArgSc[42]=0.62;ArgX[43]=-185;ArgY[43]=-40;ArgSc[43]=0.62;ArgX[44]=-175;ArgY[44]=-50;ArgSc[44]=0.62;ArgX[45]=-175;ArgY[45]=-40;ArgSc[45]=0.62;ArgX[46]=-175;ArgY[46]=-30;ArgSc[46]=0.62;ArgX[47]=-175;ArgY[47]=-20;ArgSc[47]=0.62;ArgX[48]=-175;ArgY[48]=-10;ArgSc[48]=0.62;ArgX[49]=-175;ArgY[49]=0;ArgSc[49]=0.62;ArgX[50]=-175;ArgY[50]=10;ArgSc[50]=0.62;ArgX[51]=-155;ArgY[51]=-50;ArgSc[51]=0.62;ArgX[52]=-155;ArgY[52]=-40;ArgSc[52]=0.62;ArgX[53]=-155;ArgY[53]=-30;ArgSc[53]=0.62;ArgX[54]=-155;ArgY[54]=-20;ArgSc[54]=0.62;ArgX[55]=-155;ArgY[55]=-10;ArgSc[55]=0.62;ArgX[56]=-155;ArgY[56]=0;ArgSc[56]=0.62;ArgX[57]=-155;ArgY[57]=10;ArgSc[57]=0.62;ArgX[58]=-145;ArgY[58]=10;ArgSc[58]=0.62;ArgX[59]=-135;ArgY[59]=10;ArgSc[59]=0.62;ArgX[60]=-125;ArgY[60]=10;ArgSc[60]=0.62;ArgX[61]=-115;ArgY[61]=10;ArgSc[61]=0.62;ArgX[62]=-145;ArgY[62]=-50;ArgSc[62]=0.62;ArgX[63]=-135;ArgY[63]=-50;ArgSc[63]=0.62;ArgX[64]=-125;ArgY[64]=-50;ArgSc[64]=0.62;ArgX[65]=-115;ArgY[65]=-50;ArgSc[65]=0.62;ArgX[66]=-145;ArgY[66]=-20;ArgSc[66]=0.62;ArgX[67]=-135;ArgY[67]=-20;ArgSc[67]=0.62;ArgX[68]=-125;ArgY[68]=-20;ArgSc[68]=0.62;ArgX[69]=-115;ArgY[69]=-20;ArgSc[69]=0.62;ArgX[70]=-70;ArgY[70]=-50;ArgSc[70]=0.62;ArgX[71]=-70;ArgY[71]=-40;ArgSc[71]=0.62;ArgX[72]=-60;ArgY[72]=-50;ArgSc[72]=0.62;ArgX[73]=-70;ArgY[73]=-30;ArgSc[73]=0.62;ArgX[74]=-70;ArgY[74]=-20;ArgSc[74]=0.62;ArgX[75]=-70;ArgY[75]=-10;ArgSc[75]=0.62;ArgX[76]=-70;ArgY[76]=0;ArgSc[76]=0.62;ArgX[77]=-70;ArgY[77]=10;ArgSc[77]=0.62;ArgX[78]=-60;ArgY[78]=10;ArgSc[78]=0.62;ArgX[79]=-50;ArgY[79]=10;ArgSc[79]=0.62;ArgX[80]=-40;ArgY[80]=10;ArgSc[80]=0.62;ArgX[81]=-30;ArgY[81]=10;ArgSc[81]=0.62;ArgX[82]=-60;ArgY[82]=-20;ArgSc[82]=0.62;ArgX[83]=-50;ArgY[83]=-20;ArgSc[83]=0.62;ArgX[84]=-40;ArgY[84]=-20;ArgSc[84]=0.62;ArgX[85]=-30;ArgY[85]=-20;ArgSc[85]=0.62;ArgX[86]=-50;ArgY[86]=-50;ArgSc[86]=0.62;ArgX[87]=-40;ArgY[87]=-50;ArgSc[87]=0.62;ArgX[88]=-30;ArgY[88]=-50;ArgSc[88]=0.62;ArgX[89]=-10;ArgY[89]=-50;ArgSc[89]=0.62;ArgX[90]=-10;ArgY[90]=-40;ArgSc[90]=0.62;ArgX[91]=-10;ArgY[91]=-30;ArgSc[91]=0.62;ArgX[92]=-10;ArgY[92]=-20;ArgSc[92]=0.62;ArgX[93]=-10;ArgY[93]=-10;ArgSc[93]=0.62;ArgX[94]=-10;ArgY[94]=0;ArgSc[94]=0.62;ArgX[95]=-10;ArgY[95]=10;ArgSc[95]=0.62;ArgX[96]=0;ArgY[96]=-50;ArgSc[96]=0.62;ArgX[97]=10;ArgY[97]=-50;ArgSc[97]=0.62;ArgX[98]=20;ArgY[98]=-50;ArgSc[98]=0.62;ArgX[99]=30;ArgY[99]=-40;ArgSc[99]=0.62;ArgX[100]=30;ArgY[100]=-30;ArgSc[100]=0.62;ArgX[101]=20;ArgY[101]=-20;ArgSc[101]=0.62;ArgX[102]=10;ArgY[102]=-20;ArgSc[102]=0.62;ArgX[103]=0;ArgY[103]=-20;ArgSc[103]=0.62;ArgX[104]=10;ArgY[104]=-10;ArgSc[104]=0.62;ArgX[105]=20;ArgY[105]=0;ArgSc[105]=0.62;ArgX[106]=30;ArgY[106]=10;ArgSc[106]=0.62;ArgX[107]=50;ArgY[107]=-50;ArgSc[107]=0.62;ArgX[108]=50;ArgY[108]=-40;ArgSc[108]=0.62;ArgX[109]=50;ArgY[109]=-30;ArgSc[109]=0.62;ArgX[110]=50;ArgY[110]=-20;ArgSc[110]=0.62;ArgX[111]=50;ArgY[111]=-10;ArgSc[111]=0.62;ArgX[112]=50;ArgY[112]=0;ArgSc[112]=0.62;ArgX[113]=50;ArgY[113]=10;ArgSc[113]=0.62;ArgX[114]=60;ArgY[114]=-50;ArgSc[114]=0.62;ArgX[115]=70;ArgY[115]=-50;ArgSc[115]=0.62;ArgX[116]=80;ArgY[116]=-50;ArgSc[116]=0.62;ArgX[117]=90;ArgY[117]=-40;ArgSc[117]=0.62;ArgX[118]=90;ArgY[118]=-30;ArgSc[118]=0.62;ArgX[119]=80;ArgY[119]=-20;ArgSc[119]=0.62;ArgX[120]=70;ArgY[120]=-20;ArgSc[120]=0.62;ArgX[121]=60;ArgY[121]=-20;ArgSc[121]=0.62;ArgX[122]=70;ArgY[122]=-10;ArgSc[122]=0.62;ArgX[123]=80;ArgY[123]=0;ArgSc[123]=0.62;ArgX[124]=90;ArgY[124]=10;ArgSc[124]=0.62;ArgX[125]=115;ArgY[125]=-45;ArgSc[125]=0.62;ArgX[126]=110;ArgY[126]=-35;ArgSc[126]=0.62;ArgX[127]=110;ArgY[127]=-25;ArgSc[127]=0.62;ArgX[128]=110;ArgY[128]=-15;ArgSc[128]=0.62;ArgX[129]=110;ArgY[129]=-5;ArgSc[129]=0.62;ArgX[130]=125;ArgY[130]=10;ArgSc[130]=0.62;ArgX[131]=125;ArgY[131]=-50;ArgSc[131]=0.62;ArgX[132]=135;ArgY[132]=-50;ArgSc[132]=0.62;ArgX[133]=115;ArgY[133]=5;ArgSc[133]=0.62;ArgX[134]=135;ArgY[134]=10;ArgSc[134]=0.62;ArgX[135]=145;ArgY[135]=-45;ArgSc[135]=0.62;ArgX[136]=150;ArgY[136]=-35;ArgSc[136]=0.62;ArgX[137]=150;ArgY[137]=-25;ArgSc[137]=0.62;ArgX[138]=150;ArgY[138]=-15;ArgSc[138]=0.62;ArgX[139]=150;ArgY[139]=-5;ArgSc[139]=0.62;ArgX[140]=145;ArgY[140]=5;ArgSc[140]=0.62;ArgX[141]=170;ArgY[141]=-50;ArgSc[141]=0.62;ArgX[142]=170;ArgY[142]=-40;ArgSc[142]=0.62;ArgX[143]=170;ArgY[143]=-30;ArgSc[143]=0.62;ArgX[144]=170;ArgY[144]=-20;ArgSc[144]=0.62;ArgX[145]=170;ArgY[145]=-10;ArgSc[145]=0.62;ArgX[146]=170;ArgY[146]=0;ArgSc[146]=0.62;ArgX[147]=170;ArgY[147]=10;ArgSc[147]=0.62;ArgX[148]=180;ArgY[148]=-50;ArgSc[148]=0.62;ArgX[149]=190;ArgY[149]=-50;ArgSc[149]=0.62;ArgX[150]=200;ArgY[150]=-50;ArgSc[150]=0.62;ArgX[151]=210;ArgY[151]=-40;ArgSc[151]=0.62;ArgX[152]=210;ArgY[152]=-30;ArgSc[152]=0.62;ArgX[153]=200;ArgY[153]=-20;ArgSc[153]=0.62;ArgX[154]=190;ArgY[154]=-20;ArgSc[154]=0.62;ArgX[155]=180;ArgY[155]=-20;ArgSc[155]=0.62;ArgX[156]=190;ArgY[156]=-10;ArgSc[156]=0.62;ArgX[157]=200;ArgY[157]=0;ArgSc[157]=0.62;ArgX[158]=210;ArgY[158]=10;ArgSc[158]=0.62;ArgX[159]=-333;ArgY[159]=29;ArgSc[159]=0.29;ArgX[160]=-328;ArgY[160]=29;ArgSc[160]=0.29;ArgX[161]=-333;ArgY[161]=34;ArgSc[161]=0.29;ArgX[162]=-333;ArgY[162]=39;ArgSc[162]=0.29;ArgX[163]=-333;ArgY[163]=44;ArgSc[163]=0.29;ArgX[164]=-333;ArgY[164]=49;ArgSc[164]=0.29;ArgX[165]=-333;ArgY[165]=54;ArgSc[165]=0.29;ArgX[166]=-323;ArgY[166]=29;ArgSc[166]=0.29;ArgX[167]=-318;ArgY[167]=29;ArgSc[167]=0.29;ArgX[168]=-328;ArgY[168]=44;ArgSc[168]=0.29;ArgX[169]=-323;ArgY[169]=44;ArgSc[169]=0.29;ArgX[170]=-318;ArgY[170]=44;ArgSc[170]=0.29;ArgX[171]=-314;ArgY[171]=32;ArgSc[171]=0.29;ArgX[172]=-314;ArgY[172]=42;ArgSc[172]=0.29;ArgX[173]=-312;ArgY[173]=37;ArgSc[173]=0.29;ArgX[174]=-324;ArgY[174]=47;ArgSc[174]=0.29;ArgX[175]=-320;ArgY[175]=51;ArgSc[175]=0.29;ArgX[176]=-316;ArgY[176]=55;ArgSc[176]=0.29;ArgX[177]=-312;ArgY[177]=59;ArgSc[177]=0.29;ArgX[178]=-303;ArgY[178]=29;ArgSc[178]=0.29;ArgX[179]=-303;ArgY[179]=34;ArgSc[179]=0.29;ArgX[180]=-298;ArgY[180]=29;ArgSc[180]=0.29;ArgX[181]=-293;ArgY[181]=29;ArgSc[181]=0.29;ArgX[182]=-288;ArgY[182]=29;ArgSc[182]=0.29;ArgX[183]=-283;ArgY[183]=29;ArgSc[183]=0.29;ArgX[184]=-303;ArgY[184]=39;ArgSc[184]=0.29;ArgX[185]=-303;ArgY[185]=44;ArgSc[185]=0.29;ArgX[186]=-303;ArgY[186]=49;ArgSc[186]=0.29;ArgX[187]=-303;ArgY[187]=54;ArgSc[187]=0.29;ArgX[188]=-303;ArgY[188]=59;ArgSc[188]=0.29;ArgX[189]=-298;ArgY[189]=44;ArgSc[189]=0.29;ArgX[190]=-293;ArgY[190]=44;ArgSc[190]=0.29;ArgX[191]=-288;ArgY[191]=44;ArgSc[191]=0.29;ArgX[192]=-283;ArgY[192]=44;ArgSc[192]=0.29;ArgX[193]=-298;ArgY[193]=59;ArgSc[193]=0.29;ArgX[194]=-293;ArgY[194]=59;ArgSc[194]=0.29;ArgX[195]=-288;ArgY[195]=59;ArgSc[195]=0.29;ArgX[196]=-283;ArgY[196]=59;ArgSc[196]=0.29;ArgX[197]=-274;ArgY[197]=29;ArgSc[197]=0.29;ArgX[198]=-274;ArgY[198]=34;ArgSc[198]=0.29;ArgX[199]=-274;ArgY[199]=39;ArgSc[199]=0.29;ArgX[200]=-274;ArgY[200]=44;ArgSc[200]=0.29;ArgX[201]=-274;ArgY[201]=49;ArgSc[201]=0.29;ArgX[202]=-274;ArgY[202]=54;ArgSc[202]=0.29;ArgX[203]=-274;ArgY[203]=59;ArgSc[203]=0.29;ArgX[204]=-269;ArgY[204]=29;ArgSc[204]=0.29;ArgX[205]=-264;ArgY[205]=29;ArgSc[205]=0.29;ArgX[206]=-259;ArgY[206]=29;ArgSc[206]=0.29;ArgX[207]=-253;ArgY[207]=37;ArgSc[207]=0.29;ArgX[208]=-186;ArgY[208]=39;ArgSc[208]=0.29;ArgX[209]=-255;ArgY[209]=42;ArgSc[209]=0.29;ArgX[210]=-269;ArgY[210]=44;ArgSc[210]=0.29;ArgX[211]=-264;ArgY[211]=44;ArgSc[211]=0.29;ArgX[212]=-259;ArgY[212]=44;ArgSc[212]=0.29;ArgX[213]=-255;ArgY[213]=32;ArgSc[213]=0.29;ArgX[214]=-244;ArgY[214]=59;ArgSc[214]=0.29;ArgX[215]=-244;ArgY[215]=44;ArgSc[215]=0.29;ArgX[216]=-244;ArgY[216]=39;ArgSc[216]=0.29;ArgX[217]=-244;ArgY[217]=49;ArgSc[217]=0.29;ArgX[218]=-244;ArgY[218]=54;ArgSc[218]=0.29;ArgX[219]=-242;ArgY[219]=34;ArgSc[219]=0.29;ArgX[220]=-239;ArgY[220]=31;ArgSc[220]=0.29;ArgX[221]=-234;ArgY[221]=29;ArgSc[221]=0.29;ArgX[222]=-229;ArgY[222]=31;ArgSc[222]=0.29;ArgX[223]=-226;ArgY[223]=34;ArgSc[223]=0.29;ArgX[224]=-224;ArgY[224]=39;ArgSc[224]=0.29;ArgX[225]=-224;ArgY[225]=44;ArgSc[225]=0.29;ArgX[226]=-224;ArgY[226]=59;ArgSc[226]=0.29;ArgX[227]=-224;ArgY[227]=54;ArgSc[227]=0.29;ArgX[228]=-224;ArgY[228]=49;ArgSc[228]=0.29;ArgX[229]=-239;ArgY[229]=44;ArgSc[229]=0.29;ArgX[230]=-234;ArgY[230]=44;ArgSc[230]=0.29;ArgX[231]=-229;ArgY[231]=44;ArgSc[231]=0.29;ArgX[232]=-215;ArgY[232]=29;ArgSc[232]=0.29;ArgX[233]=-210;ArgY[233]=29;ArgSc[233]=0.29;ArgX[234]=-205;ArgY[234]=29;ArgSc[234]=0.29;ArgX[235]=-200;ArgY[235]=29;ArgSc[235]=0.29;ArgX[236]=-195;ArgY[236]=29;ArgSc[236]=0.29;ArgX[237]=-205;ArgY[237]=34;ArgSc[237]=0.29;ArgX[238]=-205;ArgY[238]=39;ArgSc[238]=0.29;ArgX[239]=-205;ArgY[239]=44;ArgSc[239]=0.29;ArgX[240]=-205;ArgY[240]=49;ArgSc[240]=0.29;ArgX[241]=-205;ArgY[241]=54;ArgSc[241]=0.29;ArgX[242]=-205;ArgY[242]=59;ArgSc[242]=0.29;ArgX[243]=-210;ArgY[243]=59;ArgSc[243]=0.29;ArgX[244]=-215;ArgY[244]=59;ArgSc[244]=0.29;ArgX[245]=-200;ArgY[245]=59;ArgSc[245]=0.29;ArgX[246]=-195;ArgY[246]=59;ArgSc[246]=0.29;ArgX[247]=-186;ArgY[247]=29;ArgSc[247]=0.29;ArgX[248]=-186;ArgY[248]=34;ArgSc[248]=0.29;ArgX[249]=-333;ArgY[249]=59;ArgSc[249]=0.29;ArgX[250]=-186;ArgY[250]=44;ArgSc[250]=0.29;ArgX[251]=-186;ArgY[251]=49;ArgSc[251]=0.29;ArgX[252]=-186;ArgY[252]=54;ArgSc[252]=0.29;ArgX[253]=-186;ArgY[253]=59;ArgSc[253]=0.29;ArgX[254]=-181;ArgY[254]=29;ArgSc[254]=0.29;ArgX[255]=-176;ArgY[255]=29;ArgSc[255]=0.29;ArgX[256]=-171;ArgY[256]=29;ArgSc[256]=0.29;ArgX[257]=-167;ArgY[257]=32;ArgSc[257]=0.29;ArgX[258]=-165;ArgY[258]=37;ArgSc[258]=0.29;ArgX[259]=-181;ArgY[259]=44;ArgSc[259]=0.29;ArgX[260]=-176;ArgY[260]=44;ArgSc[260]=0.29;ArgX[261]=-171;ArgY[261]=44;ArgSc[261]=0.29;ArgX[262]=-167;ArgY[262]=42;ArgSc[262]=0.29;ArgX[263]=-177;ArgY[263]=47;ArgSc[263]=0.29;ArgX[264]=-173;ArgY[264]=51;ArgSc[264]=0.29;ArgX[265]=-169;ArgY[265]=55;ArgSc[265]=0.29;ArgX[266]=-165;ArgY[266]=59;ArgSc[266]=0.29;ArgX[267]=-156;ArgY[267]=29;ArgSc[267]=0.29;ArgX[268]=-151;ArgY[268]=29;ArgSc[268]=0.29;ArgX[269]=-146;ArgY[269]=29;ArgSc[269]=0.29;ArgX[270]=-141;ArgY[270]=29;ArgSc[270]=0.29;ArgX[271]=-136;ArgY[271]=29;ArgSc[271]=0.29;ArgX[272]=-146;ArgY[272]=34;ArgSc[272]=0.29;ArgX[273]=-146;ArgY[273]=39;ArgSc[273]=0.29;ArgX[274]=-146;ArgY[274]=44;ArgSc[274]=0.29;ArgX[275]=-146;ArgY[275]=49;ArgSc[275]=0.29;ArgX[276]=-146;ArgY[276]=54;ArgSc[276]=0.29;ArgX[277]=-146;ArgY[277]=59;ArgSc[277]=0.29;ArgX[278]=-151;ArgY[278]=59;ArgSc[278]=0.29;ArgX[279]=-156;ArgY[279]=59;ArgSc[279]=0.29;ArgX[280]=-141;ArgY[280]=59;ArgSc[280]=0.29;ArgX[281]=-136;ArgY[281]=59;ArgSc[281]=0.29;ArgX[282]=-127;ArgY[282]=29;ArgSc[282]=0.29;ArgX[283]=-127;ArgY[283]=34;ArgSc[283]=0.29;ArgX[284]=-127;ArgY[284]=39;ArgSc[284]=0.29;ArgX[285]=-127;ArgY[285]=44;ArgSc[285]=0.29;ArgX[286]=-127;ArgY[286]=49;ArgSc[286]=0.29;ArgX[287]=-127;ArgY[287]=54;ArgSc[287]=0.29;ArgX[288]=-127;ArgY[288]=59;ArgSc[288]=0.29;ArgX[289]=-123;ArgY[289]=34;ArgSc[289]=0.29;ArgX[290]=-117;ArgY[290]=44;ArgSc[290]=0.29;ArgX[291]=-120;ArgY[291]=39;ArgSc[291]=0.29;ArgX[292]=-107;ArgY[292]=29;ArgSc[292]=0.29;ArgX[293]=-107;ArgY[293]=34;ArgSc[293]=0.29;ArgX[294]=-107;ArgY[294]=39;ArgSc[294]=0.29;ArgX[295]=-107;ArgY[295]=44;ArgSc[295]=0.29;ArgX[296]=-107;ArgY[296]=49;ArgSc[296]=0.29;ArgX[297]=-107;ArgY[297]=54;ArgSc[297]=0.29;ArgX[298]=-107;ArgY[298]=59;ArgSc[298]=0.29;ArgX[299]=-114;ArgY[299]=49;ArgSc[299]=0.29;ArgX[300]=-112;ArgY[300]=54;ArgSc[300]=0.29;ArgX[301]=-96;ArgY[301]=34;ArgSc[301]=0.29;ArgX[302]=-98;ArgY[302]=39;ArgSc[302]=0.29;ArgX[303]=-98;ArgY[303]=44;ArgSc[303]=0.29;ArgX[304]=-98;ArgY[304]=49;ArgSc[304]=0.29;ArgX[305]=-96;ArgY[305]=54;ArgSc[305]=0.29;ArgX[306]=-93;ArgY[306]=31;ArgSc[306]=0.29;ArgX[307]=-89;ArgY[307]=29;ArgSc[307]=0.29;ArgX[308]=-84;ArgY[308]=29;ArgSc[308]=0.29;ArgX[309]=-79;ArgY[309]=29;ArgSc[309]=0.29;ArgX[310]=-93;ArgY[310]=57;ArgSc[310]=0.29;ArgX[311]=-89;ArgY[311]=59;ArgSc[311]=0.29;ArgX[312]=-84;ArgY[312]=59;ArgSc[312]=0.29;ArgX[313]=-79;ArgY[313]=59;ArgSc[313]=0.29;ArgX[314]=-79;ArgY[314]=54;ArgSc[314]=0.29;ArgX[315]=-79;ArgY[315]=49;ArgSc[315]=0.29;ArgX[316]=-79;ArgY[316]=44;ArgSc[316]=0.29;ArgX[317]=-84;ArgY[317]=44;ArgSc[317]=0.29;
        //317
        with(objAd_Kois_1_Creator)instance_destroy()
        with(objAd_Kois_1_objBu1){
            instance_destroy()
            Scr_Kois_Ad_1_Inst_Form(x,y,objAd_Kois_1_objBuEmpty,image_xscale,0)
        }
        if player.y<304{
            ud=1
            with(objAd_Kois_1_objBuEmpty){
                if bbox_bottom>404 && nde=0 instance_destroy()
            }
            for(i=50;i<=750;i+=12.5){
                inst=Scr_Kois_Ad_1_Inst_Form(i,404,objAd_Kois_1_objBuEmpty,0.6,0)
                //inst.nde=1
            }
            for(i=1;i<=317;i+=1){
                Scr_Kois_Ad_1_Inst_Form(400+ArgX[i],554-75+ArgY[i],objAd_Kois_1_objBuEmpty,ArgSc[i],0)
            }
        }
        else{
            ud=-1
            with(objAd_Kois_1_objBuEmpty){
                if bbox_top<204 && nde=0 instance_destroy()
            }
            for(i=50;i<=750;i+=12.5){
                inst=Scr_Kois_Ad_1_Inst_Form(i,204,objAd_Kois_1_objBuEmpty,0.6,0)
                //inst.nde=1
            }
            for(i=1;i<=317;i+=1){
                Scr_Kois_Ad_1_Inst_Form(400+ArgX[i],54+75+ArgY[i],objAd_Kois_1_objBuEmpty,ArgSc[i],0)
            }
        }
    break
    case Return_realtime(210):
        inst=Scr_Kois_Ad_1_Inst_Creator(8)
        if ud=1{
            inst.yc=404+75+44
            inst.xc=400-32
        }
        else{
            inst.yc=54+75+44
            inst.xc=400-32
        }
        inst.ud=ud
    break
    case Return_realtime(214):
        for(i=0;i<40;i+=1){
            dir=(i+0.5)*90/40
            xp=100+lengthdir_x(600,dir)
            yp=554+lengthdir_y(450,dir)
            inst=Scr_Kois_Ad_1_Inst_Form(xp+random_range(30,100),yp,objAd_Kois_1_objBu1,1,5)
            inst.sprite_index=Kois_Ad_1_SprCherryUp
            inst.xto=xp
            inst=Scr_Kois_Ad_1_Inst_Form(xp+random_range(30,100),yp,objAd_Kois_1_objBu1,1,5)
            inst.sprite_index=Kois_Ad_1_SprCherryDown
            inst.xto=xp
        }
    break
    case Return_realtime(215):
        for(i=0;i<40;i+=1){
            dir=(i+0.5)*90/40
            xp=700+lengthdir_x(600,dir+180)
            yp=54+lengthdir_y(450,dir+180)
            inst=Scr_Kois_Ad_1_Inst_Form(xp-random_range(30,100),yp,objAd_Kois_1_objBu1,1,5)
            inst.sprite_index=Kois_Ad_1_SprCherryUp
            inst.xto=xp
            inst=Scr_Kois_Ad_1_Inst_Form(xp-random_range(30,100),yp,objAd_Kois_1_objBu1,1,5)
            inst.sprite_index=Kois_Ad_1_SprCherryDown
            inst.xto=xp
        }
    break
    case Return_realtime(216):
        inst=Scr_Kois_Ad_1_Inst_Creator(9)
        inst.TimeAll=Return_duration(216,219)
    break
    case Return_realtime(220):
        for(i=0;i<60;i+=1){
            Scr_Kois_Ad_1_Inst_Form(233+lengthdir_x(85,i*6),204+lengthdir_y(85,i*6),objAd_Kois_1_objBuEmpty,0.6,0)
            Scr_Kois_Ad_1_Inst_Form(567+lengthdir_x(85,i*6),404+lengthdir_y(85,i*6),objAd_Kois_1_objBuEmpty,0.6,0)
        }
    break
    case Return_realtime(220+4/3):
        with(objAd_Kois_1_objBuEmpty){
            if !nde{
                instance_destroy()
            }
        }
        xp[0]=239
        yp[0]=119
        xp[1]=199
        yp[1]=296
        len=point_distance(199,296,239,119)
        dir=point_direction(199,296,239,119)
        xp[2]=199+lengthdir_x(len,dir-60)
        yp[2]=296+lengthdir_y(len,dir-60)
        for(i=0;i<3;i+=1){
            for(j=0;j<20;j+=1){
                Scr_Kois_Ad_1_Inst_Form(lerp(xp[i mod 3],xp[(i+1) mod 3],j/20),lerp(yp[i mod 3],yp[(i+1) mod 3],j/20),objAd_Kois_1_objBuEmpty,0.6,0)
                Scr_Kois_Ad_1_Inst_Form(800-lerp(xp[i mod 3],xp[(i+1) mod 3],j/20),608-lerp(yp[i mod 3],yp[(i+1) mod 3],j/20),objAd_Kois_1_objBuEmpty,0.6,0)
            }
        }
    break
    case Return_realtime(220+8/3):
        with(objAd_Kois_1_objBuEmpty){
            if !nde{
                instance_destroy()
            }
        }
        len=120
        for(i=0;i<4;i+=1){
            xp1=lengthdir_x(len,i*90)
            yp1=lengthdir_y(len,i*90)
            xp2=lengthdir_x(len,i*90+90)
            yp2=lengthdir_y(len,i*90+90)
            for(j=0;j<20;j+=1){
                xp=lerp(xp1,xp2,j/20)
                yp=lerp(yp1,yp2,j/20)
                inst=Scr_Kois_Ad_1_Inst_Form(-100,-100,objAd_Kois_1_objBu2,0.6,1)
                inst.len=point_distance(0,0,xp,yp)
                inst.dir=point_direction(0,0,xp,yp)
                inst.dirto=inst.dir+45
                inst=Scr_Kois_Ad_1_Inst_Form(-100,-100,objAd_Kois_1_objBu2,0.6,1)
                inst.len=point_distance(0,0,xp,yp)
                inst.dir=point_direction(0,0,xp,yp)
                inst.dirto=inst.dir-45
            }
        }
    break
    case Return_realtime(224):
        with(objAd_Kois_1_objBuEmptyPlus){
            if x-y/2>100 && x-y/2<396 instance_destroy()
            hspeed=(304-y)/10
            friction=1
        }
        with(objAd_Kois_1_objBu2)instance_destroy()
        with(objAd_Kois_1_objBu1){
            if x-y/2>100 && x-y/2<396 instance_destroy()
            hspeed=(304-y)/10
            friction=1
        }
        for(i=0.5;i<50;i+=1){
            inst=Scr_Kois_Ad_1_Inst_Form(lerp(100,404,i/50),608*i/50,objAd_Kois_1_objBuEmpty,0.6,0)
            inst.hspeed=(304-inst.y)/10
            inst.friction=1
            inst=Scr_Kois_Ad_1_Inst_Form(lerp(396,700,i/50),608*i/50,objAd_Kois_1_objBuEmpty,0.6,0)
            inst.hspeed=(304-inst.y)/10
            inst.friction=1
        }
        Scr_Kois_Ad_1_Inst_Creator(10)
    break
    case Return_realtime(228):
        with(objAd_Kois_1_objBuEmptyPlus){
            if x<0 or x>800 instance_destroy()
        }
    break
    case Return_realtime(230):
        dir=90
        for(i=0;i<=40;i+=1){
            xp=400+lengthdir_x((i-20)*25,dir)
            yp=304+lengthdir_y((i-20)*25,dir)
            inst=Scr_Kois_Ad_1_Inst_Form(xp-random_range(20,40),yp,objAd_Kois_1_objBu1,1,5)
            inst.sprite_index=Kois_Ad_1_SprCherryUp
            inst.xto=xp
            inst.Mark=1
            inst.dir=dir
            inst.len=(i-20)*25
            if abs(i-20)<=8 inst.rotate=1
            inst=Scr_Kois_Ad_1_Inst_Form(xp+random_range(20,40),yp,objAd_Kois_1_objBu1,1,5)
            inst.sprite_index=Kois_Ad_1_SprCherryDown
            inst.xto=xp
            inst.Mark=2
        }
    break
    case Return_realtime(230+2/3):
        dir=150
        for(i=0;i<=40;i+=1){
            xp=400+lengthdir_x((i-20)*25,dir)
            yp=304+lengthdir_y((i-20)*25,dir)
            inst=Scr_Kois_Ad_1_Inst_Form(xp-random_range(20,40),yp,objAd_Kois_1_objBu1,1,5)
            inst.sprite_index=Kois_Ad_1_SprCherryUp
            inst.xto=xp
            inst.Mark=1
            inst.dir=dir
            inst.len=(i-20)*25
            if abs(i-20)<=8 inst.rotate=1
            inst=Scr_Kois_Ad_1_Inst_Form(xp+random_range(20,40),yp,objAd_Kois_1_objBu1,1,5)
            inst.sprite_index=Kois_Ad_1_SprCherryDown
            inst.xto=xp
            inst.Mark=2
        }
    break
    case Return_realtime(230+4/3):
        dir=210
        for(i=0;i<=40;i+=1){
            xp=400+lengthdir_x((i-20)*25,dir)
            yp=304+lengthdir_y((i-20)*25,dir)
            inst=Scr_Kois_Ad_1_Inst_Form(xp-random_range(20,40),yp,objAd_Kois_1_objBu1,1,5)
            inst.sprite_index=Kois_Ad_1_SprCherryUp
            inst.xto=xp
            inst.Mark=1
            inst.dir=dir
            inst.len=(i-20)*25
            if abs(i-20)<=8 inst.rotate=1
            inst=Scr_Kois_Ad_1_Inst_Form(xp+random_range(20,40),yp,objAd_Kois_1_objBu1,1,5)
            inst.sprite_index=Kois_Ad_1_SprCherryDown
            inst.xto=xp
            inst.Mark=2
        }
    break
    case Return_realtime(232):
        Num=0
        with(objAd_Kois_1_objBuEmptyPlus){
            if x<0 or x>800 instance_destroy()
        }
    case Return_realtime(232+4/3):
    case Return_realtime(232+8/3):
        xp1=lengthdir_x(275,90+Num*60)
        yp1=lengthdir_y(275,90+Num*60)
        xp2=lengthdir_x(275,90+Num*60+60)
        yp2=lengthdir_y(275,90+Num*60+60)
        for(i=0;i<20;i+=1){
            inst=Scr_Kois_Ad_1_Inst_Form(400+xp1,304+yp1,objAd_Kois_1_objBu2,0.85,2)
            inst.xto=400+lerp(xp1,xp2,i/20)
            inst.yto=304+lerp(yp1,yp2,i/20)
            inst=Scr_Kois_Ad_1_Inst_Form(400-xp1,304-yp1,objAd_Kois_1_objBu2,0.85,2)
            inst.xto=400-lerp(xp1,xp2,i/20)
            inst.yto=304-lerp(yp1,yp2,i/20)
        }
        Num+=1
    break
    case Return_realtime(236):
        with(objAd_Kois_1_objBuEmptyPlus){
            dir=point_direction(400,304,x,y)
            if point_distance(400,304,x,y)<Return_Polygonal_Theta_to_R(dir,30,6)*275{
                instance_destroy()
            }
            vspeed=exp(-sqr(x-75)/2500)*50-exp(-sqr(x-725)/2500)*50
        }
        with(objAd_Kois_1_objBuEmpty){
            dir=point_direction(400,304,x,y)
            if point_distance(400,304,x,y)<Return_Polygonal_Theta_to_R(dir,30,6)*275{
                instance_destroy()
            }
        }
        with(objAd_Kois_1_objBu1){
            if Mark=0{
                dir=point_direction(400,304,x,y)
                if point_distance(400,304,x,y)<Return_Polygonal_Theta_to_R(dir,30,6)*275{
                    instance_destroy()
                }
            }
            if Mark=1{
                sprite_index=Kois_Ad_1_SprCherryPureWhite
            }
            if Mark=2{
                instance_destroy()
            }
        }
        for(i=0;i<100;i+=1){
            Scr_Kois_Ad_1_Inst_Form(400+lengthdir_x(210,i*3.6),304+lengthdir_y(210,i*3.6),objAd_Kois_1_objBuEmpty,1.1,0)
        }
    break
    case Return_realtime(238):
    case Return_realtime(239):
    case Return_realtime(240):
    case Return_realtime(241):
    case Return_realtime(242):
    case Return_realtime(243):
        with(objAd_Kois_1_objBu1){
            if rotate=1{
                dir+=10
                x=lerp(400+lengthdir_x(len,dir),xto,0.5)
                y=304+lengthdir_y(len,dir)
            }
        }
    break
    case Return_realtime(246):
        with(objAd_Kois_1_objBu1){
            if rotate=1{
                form=-400
                direction=point_direction(player.x,player.y,x,y)
                speed=3
            }
        }
        inst=Scr_Kois_Ad_1_Inst_Creator(11)
        inst.Mark=1
        inst.TimeAll1=Return_duration(252,256)
        inst.TimeAll2=Return_duration(256,264)
    break
    case Return_realtime(247):
        with(objAd_Kois_1_objBu1){
            if rotate=1{
                speed=random_range(30,50)
            }
        }
        inst=Scr_Kois_Ad_1_Inst_Creator(11)
        inst.Mark=2
        inst.TimeAll1=Return_duration(252,256)
        inst.TimeAll2=Return_duration(256,264)
        //inst.TimeAll1=Return_duration(255,259)
        //inst.TimeAll2=Return_duration(259,267)
    break
    case Return_realtime(248):
        with(objAd_Kois_1_objBuEmptyPlus){
            if y<0 or y>608 instance_destroy()
        }
        with(objAd_Kois_1_Creator){
            if Mark=1 Part+=1
        }
    break
    case Return_realtime(248+4/3):
        with(objAd_Kois_1_Creator){
            if Mark=2 Part+=1
        }
    break
    case Return_realtime(248+8/3):
        with(objAd_Kois_1_Creator){
            if Mark=1 Part+=1
        }
    break
    case Return_realtime(252):
        with(objAd_Kois_1_Creator){
            if Mark=2 Part+=1
            if Mark=1 drop=1
        }
    break
    case Return_realtime(255):
        with(objAd_Kois_1_Creator){
            if Mark=2 drop=1
        }
    break
    case Return_realtime(264):
        Scr_Kois_Ad_1_Inst_Creator(12)
    break
    case Return_realtime(267):
        with(objAd_Kois_1_Creator){
            if form=12 on=1
        }
    break
    case Return_realtime(272):
        with(objAd_Kois_1_Creator)instance_destroy()
        with(objAd_Kois_1_objBuEmptyPlus){
            if y<320{
                instance_destroy()
                Scr_Kois_Ad_1_Inst_Form(x,y,objAd_Kois_1_objBu2,image_xscale,0)
            }
        }
        with(objAd_Kois_1_objBu2){
            if y<320{
                xto=x+exp(-power(y-300,2)/10000)*1600
                yto=y+random_range(-50,0)
                form=4
            }
        }
        Scr_Kois_Ad_1_Inst_Creator(13)
    break
    case Return_realtime(275):
        with(objAd_Kois_1_Creator){
            if form=13{
                cha=1
            }
        }
    break
    case Return_realtime(280):
    case Return_realtime(280+4/3):
    case Return_realtime(280+8/3):
    case Return_realtime(284):
    case Return_realtime(284+4/3):
    case Return_realtime(284+8/3):
        with(objAd_Kois_1_Creator){
            if form=13{
                NTi+=1
            }
        }
    break
    case Return_realtime(288):
        with(objAd_Kois_1_Creator)instance_destroy()
        with(playerKiller)instance_destroy()
    break
    case Return_realtime(300):
        instance_create(0,0,objAd_Kois_1_End);
    break
}








    switch(realtime){
        case Return_realtime(28):
            Scr_Kois_Ad_1_Inst_Creator(3)
        break
        case Return_realtime(69.5):
            with(objAd_Kois_1_objBuEmpty){
                if Mark=2{
                    form=2
                }
            }
            repeat(500){
                dir=random(360)
                len=sqrt(random_range(0.01,1))*700
                inst=Scr_Kois_Ad_1_Inst_Form(player.x+lengthdir_x(len,dir),player.y+lengthdir_y(len,dir),objAd_Kois_1_objBu1,1,2)
                inst.Mark=2
            }
        break
        case Return_realtime(72):
            with(objAd_Kois_1_objBuEmpty){
                if Mark=2 instance_destroy()
            }
            with(objAd_Kois_1_objBu1){
                if Mark=2 instance_destroy()
            }
        break
        case Return_realtime(112):
        case Return_realtime(115):
        case Return_realtime(128):
        case Return_realtime(134):
        case Return_realtime(140):
            with(objAd_Kois_1_Creator){
                if form=5 On_1=1
            }
        break
        case Return_realtime(104):
        case Return_realtime(120):
        case Return_realtime(130):
        case Return_realtime(136):
        case Return_realtime(142):
            with(objAd_Kois_1_Creator){
                if form=5 On_2=1
            }
        break
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///BGM校准
if(FMODInstanceIsPlaying(global.BGMHandler)){
    m_time += 1000/room_speed;
}

if(abs(FMODInstanceGetPosition(global.BGMHandler)*bgm_length-m_time)>75){
    FMODInstanceSetPosition(global.BGMHandler,m_time/bgm_length);
}

m_fps = round(ffps);

if abs(room_speed - m_fps) > 1 && m_fps != 0
{
    FMODInstanceSetPitch(global.BGMHandler,1 / (room_speed / m_fps));
}
else
{
    FMODInstanceSetPitch(global.BGMHandler,1);
    FMODEffectSetParamValue(effect,0,1);
    if !instance_exists(objDeathSound)
        FMODInstanceSetVolume(global.BGMHandler,100/100);
}

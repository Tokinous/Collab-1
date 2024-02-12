#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///耐久相关配置

//这是用来进行耐久时间轴的obj





//读取BGM-----------------------------------
if instance_exists(objAd_Kois_2_Enter){
    bgmBoss = FMODSoundAdd(global.music_directory + '来春打马.mp3'    ,0,0);
}




//关于音乐信息-----------------------------------------------
//如果你要用跟我一样的方式在step里写耐久

KoisRealtimeCountModeOn = true;
STARTSTEP = 45///歌曲开始的秒数*50
MusicBPM = 110;///歌曲BPM
start_pos = 0;//开始时的拍数，测试用


/*否则启用时间轴
{
KoisRealtimeCountModeOn = false;
MusicBPM = XXX///歌曲BPM
UseTimeLine = XXX//使用时间轴
start_pos = XXX//时间轴开始的步数，测试用
}
*/






//提前定义obj变量----------------------------

Bu1 = objAd_Kois_2_Bullet1;
Bac = objAd_Kois_2_Background;
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
NBeat = Return_beat(realtime);
if instance_exists(player){
    switch (realtime){
        case Return_realtime(0):
            var Temp;
            Temp = rand(100);
            for(i = 0; i < 10; i += 1){
                Inst = Inc(i*100 + Temp - 100, 50, Bu1);
                SSca(Inst, 3);
                Inst.Form = 1;
                Inst.depth = 10;
            }
        case Return_realtime(8):
        case Return_realtime(16):
        case Return_realtime(24):
        case Return_realtime(32):
        case Return_realtime(40):
        case Return_realtime(48):
        case Return_realtime(56):
            Bac.Arg_Hspeed = -3;
            with(Bu1){
                if (Form == -14){
                    Dest();
                }
                if (Form == 2){
                    Float = 0;
                }
                hspeed = -3;
                vspeed = 0;
            }
        break
        case Return_realtime(4):
        case Return_realtime(12):
        case Return_realtime(20):
        case Return_realtime(28):
        case Return_realtime(36):
        case Return_realtime(44):
        case Return_realtime(52):
        case Return_realtime(60):
            Bac.Arg_Hspeed = 0;
            with(Bu1){
                hspeed = 0;
                if (Form == 1){
                    Inst = Inc(x, y, Bu1)
                    SSca(Inst, 3);
                    Inst.Form = 2;
                }
            }
            with(Bu1){
                if (Form == 2){
                    Float = 1;
                    direction = rand(255, 285);
                    speed = rand(5, 9);
                }
            }
        break
        case Return_realtime(64):
            with(Bu1){
                Dest();
            }
        case Return_realtime(72):
        case Return_realtime(80):
        case Return_realtime(88):
        case Return_realtime(96):
        case Return_realtime(104):
        case Return_realtime(112):
        case Return_realtime(120):
            Bac.Arg_Vspeed = 6;
            for(i = 0; i < 8; i += 1){
                Inst = Inc(rand(i*100, i*100 + 160), rand(-200, -30), Bu1);
            }
            with(Bu1){
                vspeed = 6;
            }
        break
        case Return_realtime(68):
        case Return_realtime(76):
        case Return_realtime(84):
        case Return_realtime(92):
        case Return_realtime(100):
        case Return_realtime(108):
        case Return_realtime(116):
        case Return_realtime(124):
            Bac.Arg_Vspeed = 0;
            with(Bu1){
                y += (bbox_bottom - bbox_top)*0.75;
                image_xscale += 0.75;
                image_yscale += 1.25;
                vspeed = 0;
            }
        break
        case Return_realtime(128):
            with(Bu1){
                Dest();
            }
            var Temp;
            Temp = rand(2*pi);
            for(i = 0; i < 10; i += 1){
                Inst = Inc(i*1000/10 + Temp - 100, 304, Bu1);
                SSca(Inst, 2);
                Inst.Form = 3;
                Inst.phi = Temp + i*6*pi/10;
                Inst.depth = 10;
            }
        case Return_realtime(136):
        case Return_realtime(144):
        case Return_realtime(152):
        case Return_realtime(160):
        case Return_realtime(168):
        case Return_realtime(176):
        case Return_realtime(184):
            Bac.Arg_Anglespeed = 0;
            Bac.Arg_Hspeed = 3;
            with(Bu1){
                hspeed = 3;
                if (Form == -14){
                    Dest();
                }
                if (Form == 4){
                    Rot = 0;
                }
                if (Form == 3){
                    Stop = 0;
                }
            }
        break
        case Return_realtime(132):
        case Return_realtime(140):
        case Return_realtime(148):
        case Return_realtime(156):
        case Return_realtime(164):
        case Return_realtime(172):
        case Return_realtime(180):
        case Return_realtime(188):
            Bac.Arg_Anglespeed = 1;
            Bac.Arg_Hspeed = 0;
            with(Bu1){
                hspeed = 0;
                if (Form == 3){
                    Inst = Inc(x, y, Bu1);
                    SSca(Inst, 2);
                    Inst.Form = 4;
                    Stop = 1;
                }
            }
            with(Bu1){
                if (Form == 4){
                    dir = point_direction(400, 304, x, y);
                    len = point_distance(400, 304, x, y);
                    Rot = 1;
                }
            }
        break
        case Return_realtime(192):
            with(Bu1){
                Dest();
            }
        case Return_realtime(200):
        case Return_realtime(208):
        case Return_realtime(216):
        case Return_realtime(224):
        case Return_realtime(232):
        case Return_realtime(240):
        case Return_realtime(248):
            Bac.Arg_Anglespeed = 0;
            repeat(10){
                Inst = Inc(400, 304, Bu1);
                Inst.Form = 5;
                Inst.direction = rand(360);
            }
            with(Bu1){
                if (Form == -14){
                    Dest();
                }
                if (Form == 5){
                    Rot = 0;
                    speed = 5;
                }
            }
        break
        case Return_realtime(196):
        case Return_realtime(204):
        case Return_realtime(212):
        case Return_realtime(220):
        case Return_realtime(228):
        case Return_realtime(236):
        case Return_realtime(244):
        case Return_realtime(252):
            Bac.Arg_Anglespeed = 0.75;
            with(Bu1){
                if (Form == 5){
                    dir = point_direction(400, 304, x, y);
                    len = point_distance(400, 304, x, y);
                    Rot = 1;
                    speed = 0;
                }
            }
        break
        case Return_realtime(256):
            Bac.Arg_Anglespeed = 0;
            with(Bu1){
                Dest();
            }
        break
        case Return_realtime(272):
            Inc(0, 0, objAd_Kois_2_End);
        break
    }



    if (NBeat mod 4 == 0 && NBeat >= 0 && NBeat < 128){
        if (realtime == Return_realtime(NBeat)){
            ArgTA = Return_duration(NBeat, NBeat + 4);
            with (objAd_Kois_2_Bouncer){
                image_speed = 8/other.ArgTA;
                image_index = 0;
            }
        }
    }

    if (NBeat mod 4 == 0 && NBeat >= 128){
        if (realtime == Return_realtime(NBeat)){
            ArgTA = Return_duration(NBeat, NBeat + 4);
            if ((NBeat div 4) mod 2 == 0){
                with (objAd_Kois_2_Bouncer){
                    if (x < 400){
                        image_speed = 8/other.ArgTA;
                        image_index = 0;
                    }
                }
            }
            else{
                with (objAd_Kois_2_Bouncer){
                    if (x > 400){
                        image_speed = 8/other.ArgTA;
                        image_index = 0;
                    }
                }
            }
        }
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

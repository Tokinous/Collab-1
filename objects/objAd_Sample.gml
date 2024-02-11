#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///耐久相关配置

//这是用来进行耐久时间轴的obj



//读取BGM-----------------------------------
if instance_exists(ObjEnterRoom){
    bgmBoss = FMODSoundAdd(global.music_directory + 'SongXXXX.mp3',0,0);
}




//关于音乐信息-----------------------------------------------
//如果你要用跟我一样的方式在step里写耐久
/*{
KoisRealtimeCountModeOn = true;
STARTSTEP = XXX///歌曲开始的秒数*50
MusicBPM = XXX///歌曲BPM
start_pos = Return_realtime(XXX)//开始时的拍数，测试用
}*/

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
/*
NBeat=Return_beat(realtime);
if instance_exists(player){
    switch(realtime){
        case Return_realtime(Num):
        {
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

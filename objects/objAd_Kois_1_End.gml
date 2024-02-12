#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//相关配置

//这是一个用来放在耐久结尾的obj

RoomBackTo = RChooseAvoidance;//耐久结束后回到的房间id
RecordSaveName = 'Record_sdgjNFOooPSODnciDJIWndoaskcOFJosnwd';//耐久结束后生成这个名字的一个文件，通过检测是否生成这一文件来判定耐久是否通过
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
T += 1;
if (T < 100){
    alp += (1 - alp)/20;
    draw_set_alpha(alp);
    Draw_Clc(alp, c_black);
}
if (T == 100){
    Draw_Clc(alp, c_black);
    FMODAllStop();
    if (bgmBoss != 0){
        FMODSoundFree(bgmBoss);
        bgmBoss = 0;
    }
    with(player)instance_destroy();
    room_goto(RoomBackTo);
    f = file_text_open_write(working_directory+'\Data\Records\' + RecordSaveName);
    file_text_close(f);
}
if (T == 101){
    saveGame();
}
if (T > 100){
    alp -= alp/10;
    Draw_Clc(alp, c_black);
    if (alp < 0.01){
        instance_destroy();
    }
}

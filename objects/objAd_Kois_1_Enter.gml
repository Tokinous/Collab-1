#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///耐久设定

//用来进入耐久的obj

///进入本耐久的区域坐标
x_Left = 64;
x_Right = 160;
y_Top = 480;
y_Bottom = 576;

///耐久信息:
NameAvoidance = '拉使天'   ;//三汉字名
NameSong = "Angel's Salad - katagiri";//歌曲名
NameMaker = '可爱元气小泡菜'       ;//作者名
Difficulty = "我不知道"    ;//预期难度
Length = '大概24秒吧'    ;//耐久长度

///房间信息
RoomAvoidance = R_AVOIDANCE_Kois_1;//耐久房间
RoomNow = RChooseAvoidance;//现处房间
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
for(i = 0; i < 16; i+= 1){
    T1[i] = irandom(20);
    T2[i] = irandom(20);
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if on=0{
    if (player.x >= x_Left && player.x <= x_Right && player.y >= y_Top && player.y <= y_Bottom){
        alp += (1-alp)/10;
        if keyboard_check_pressed(vk_enter){
            depth=-9999999;
            surface_set_target(surface1);
            draw_clear(c_black);
            screen_redraw();

            event_user(0);

            global.frozen=1;
            on=1;
        }
    }
    else{
        alp-=alp/10;
    }
}
if (room != RoomNow && room != RoomAvoidance) instance_destroy();
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///如果要让这玩意绘制点什么的话
sf_draw_set_color(c_black);
sf_draw_set_halign(1);
sf_draw_set_valign(1);
sf_draw_set_alpha(alp);
sf_draw_text(player.x, player.y - 30, "Press Enter to Start");
sf_draw_set_alpha(1);
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if on>0{
    if (on != 2){
        event_user(0);
    }


    if !surface_exists(surface2){
        surface2 = surface_create(800, 608);
    }
    surface_set_target(surface2);
    draw_clear(c_white);

    sf_draw_set_color(c_black);
    sf_draw_set_halign(1);
    sf_draw_set_valign(1);
    sf_draw_text_transformed(400, 304, NameAvoidance, 2, 2, 0);
    sf_draw_set_color(make_color_rgb(127, 127, 127));
    sf_draw_text(400, 350, "Song : " + NameSong +"     Avoidance Creator : " + NameMaker);
    sf_draw_text(400, 375, "Expected difficulty : " + Difficulty);
    sf_draw_text(400, 400, "Length : " + Length);
}
if (on == 0){
    event_user(0);
}
else if (on == 1){
    surface_reset_target();
    Time += 1;
    for(i = 0; i < 16; i += 1){
        if (Time > T1[i]){
            Sc[i] += Sc[i]<30
            draw_surface_part(surface2, i*50, 0, 50, 608*(1 - Ease_sinwave_in(1 - Sc[i]/30)), i*50, 0);
        }
    }
    surface_set_target(surface2)
    if (Time == 100){
        on = 2;
        global.frozen = 0;
        with(player)instance_destroy();
        room_goto(RoomAvoidance);
    }
}
else{
    surface_reset_target();
    Time2 += 1;
    for(i = 0; i < 16; i += 1){
        if (Time2 > T2[i]){
            Sc2[i] += Sc2[i] < 30;
        }
        draw_surface_part(surface2, i*50, 608*Ease_sinwave_in(Sc2[i]/30), 50, 608*(1 - Ease_sinwave_in(Sc2[i]/30)), i*50, 608*Ease_sinwave_in(Sc2[i]/30));
    }
    if (Time2 == 60){
        instance_destroy();
    }
}

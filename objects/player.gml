#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Initializing
//global variables:
//
//  global.frozen       set to true to make player uncontrollable
//  global.frozen2      set to true to make player unmovable
//  global.reverse      0: normal kid ; 1: reverse kid
//
//whether can infinite jump or not
infJump = false;
//first jump speed
jump[1] = 8.5;
//second jump speed
jump[2] = 7;
//maximum jump times
//you should have variables such as jump[3] if you need 3 jumps or more
maxJumps = 2;
//current jump times
curJumps = 1;
//horizontal speed
maxSpeed = 3;
//gravity
grav = 0.4;
//maximum speed when falling
maxVspeed = 9;
//reverse gravity
if(global.reverse == 0){
    yflag = 1;
}
if(global.reverse == 1){
    yflag = -1;
    y -= 4;
    curJumps = 1;
}
image_yscale = yflag;
image_speed = 0.2;
//save game when playing for the 1st time
if(room != rSelectStage && room != rOptions){
    if(file_exists(global.saving_directory+"SaveData"+string(global.savenum)) == false){
      global.death = 0;
      global.timestep = 0;
      saveGame();
    }
}
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(!keyboard_check(global.jumpbutton) && yflag*vspeed < 0){
    vspeed *= 0.45;
    alarm[0] = 0;
}
else{
    alarm[0] = 1;
}
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
TestModeDied=0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
room_speed=50
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vsp+=grav
if place_meeting(x+hsp,y+vsp,block){
if(place_free(x+hsp,y) == false){
    if(hsp <= 0){
        move_contact_solid(180,abs(hsp));
    }
    if(hsp > 0){
        move_contact_solid(0,abs(hsp));
    }
    hsp = 0;
}

//+ceil(vsp)
if(place_free(x,y+ceil(vsp)) == false) or (place_free(x,y+floor(vsp)) == false){
    if !place_meeting(x,y-1,block) y=floor(y)
    else y=floor(y)+1
    if(vsp <= 0){
        move_contact_solid(90,abs(vsp));
    }
    if(vsp > 0){
        move_contact_solid(270,abs(vsp));
        curJumps=1;
    }
    vsp = 0;
    grav=0
}

if (place_free(x+hsp,y+vsp) == false){
    hsp=0;
}

}
if place_meeting(x,y,playerKiller)event_user(0)

x += hsp
y += vsp
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Player movements
if(global.frozen2 == 0){
    playerMove();
    playerWallJump();
    playerMisc();
}
else{
    grav = 0;
    image_speed = 0;
    speed = 0;
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Checking for Slopes
playerSlope();
#define Collision_platform
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///collision with platforms
if(global.reverse == 0){
    if(y-vsp/2 <= other.y){
        if(other.vsp >= 0){
            y = other.y-9;
            vsp = other.y-other.yprevious;
            curJumps=1;
        }
        onPlatform = 1;
        curJumps=1;
    }
}
else{
    if(y-vsp/2 >= other.y+15){
        if(other.vsp >= 0){
            y = other.y+24;
            vsp = other.y-other.yprevious;
            curJumps=1;
        }
        onPlatform = 1;
        curJumps=1;
    }
}
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(place_meeting(x,y,outsideroomChanger) == false){
    killPlayer();
}else{
    tempwarp=instance_place(x,y,outsideroomChanger)
    with(tempwarp){
        room_goto(roomTo);
        if xMov=1{
            if warpX=0{
                player.x-=800-800*XDelta
                player.y+=608*YDelta
            }
            if warpX=1{
                player.x+=800+800*XDelta
                player.y+=608*YDelta
            }
        }
        if yMov=1{
            if warpY=0{
                player.x+=800*XDelta
                player.y-=608-608*YDelta
            }
            if warpY=1{
                player.x+=800*XDelta
                player.y+=608+608*YDelta
            }
        }
    }
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//creating bow
if !instance_exists(bow){
    var a;
    a = instance_create(x,y,bow);
    a.image_xscale = image_xscale;
    a.image_yscale = image_yscale;
}
//spin view
if(global.reverse == 1){
    view_enabled = true;
    view_angle[0] = 180;
}
else{
    view_angle[0] = 0;
}
hspeed=0
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!GodMode){
    if !TestMode{
        killPlayer();
    }
    else{
        if (TestModeDied==0){
            FMODSoundPlay(sndDeath);
            //create death effects
            instance_create(player.x,player.y,bloodEmitter);
            TestModeDied=1;
            alarm[1]=20;
        }
    }
}
#define KeyPress_71
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///发布时记得删除
TestMode = 1;
#define KeyPress_81
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//kill yourself
killPlayer();

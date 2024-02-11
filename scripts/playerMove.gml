var L,R,h;

image_yscale = yflag;
if(global.reverse == 0){
    yflag = 1;
    L = keyboard_check_direct(global.leftbutton);
    R = keyboard_check_direct(global.rightbutton);
}
else{
    yflag = -1;
    R = keyboard_check_direct(global.leftbutton);
    L = keyboard_check_direct(global.rightbutton);
}

//right overrides left
h = R;
if(h == 0){
    h = -L;
}
if(global.frozen == true){
    h = 0;
}
//if we're going to run
if(h != 0 ){
    if(distance_to_object(WalljumpR) != 1 && distance_to_object(WalljumpL) > 1){
        image_xscale = h;
    }
    if((h=-1 && distance_to_object(WalljumpR) != 1) || (h=1 && distance_to_object(WalljumpL) > 1)){
        //if not slipping
        if(!place_meeting(x,y+yflag*4,slipblock)){
            hsp = maxSpeed*h;
        }
        else{
            //slipping
            if((h=1 && hsp<maxSpeed) || (h=-1 && hsp>-maxSpeed)){
                hsp +=(instance_position(x,y+yflag*10,slipblock).slip)*h;
            }
        }
        //running sprites
        sprite_index = sprPlayerRunning;
        image_speed = 0.5;
    }
}
else{
    //stop if we're going to idle
    if(!place_meeting(x,y+yflag*4,slipblock)){
        hsp = 0;
    }
    else{
        //decelerate if we're standing on a slip block
        if(hsp!=0){
            hsp-=(instance_position(x,y+yflag*10,slipblock).slip)*sign(hsp)
        }
    }
    //idling sprite
    sprite_index = sprPlayerIdle;
    image_speed = 0.2;
}

//jumping sprites
if (onPlatform == false){
    if(global.reverse == 0){
        if(vsp < -0.05){
            sprite_index = sprPlayerJump;
        }
        if(vsp > 0.05 && !place_meeting(x,y+2,obj_wall)){
            sprite_index = sprPlayerFall;
        }
    }
    else{
        if(vsp < -0.05 && !place_meeting(x,y-2,obj_wall)){
            sprite_index = sprPlayerFall;
        }
        if(vsp > 0.05){
            sprite_index = sprPlayerJump;
        }
    }
}
else{
    if(place_meeting(x,y+yflag*4,platform) == false){
        onPlatform = 0;
    }
}

//vertical speed limitations 
if(vsp*yflag > maxVspeed){
  vsp = sign(vsp)*maxVspeed;
}
//shooting and jumping
if(global.frozen == false){
    playerShoot();
    playerJump();//global.enable_jump_cancel && 
    if(keyboard_check_released(global.jumpbutton) && yflag*vsp < 0){
        vsp *= 0.45;
    }
}

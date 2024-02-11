switch(argument0){
    case 0:
        return (room == R_AVOIDANCE_XXX ||
                room == R_AVOIDANCE_XXX ||
                room == R_AVOIDANCE_XXX ||
                room == R_AVOIDANCE_XXX ||
                room == R_AVOIDANCE_XXX);
        //用于判定是否处于耐久房间内
    break;
    case 1:
        return (
            !instance_exists(objAd_XXX_End) &&
            !instance_exists(objAd_XXX_End) &&
            !instance_exists(objAd_XXX_End) &&
            !instance_exists(objAd_XXX_End) &&
            !instance_exists(objAd_XXX_End)
        )
        //判定是否存在结束耐久的obj
    break;
    case 2:
        switch(room){
            case R_AVOIDANCE_XXX:{
                room_goto(R_XXX);
                player.x = XXX;
                player.y = XXX;
            }
            break;
        }
        //用于在耐久房间内时按下退格键回到选择耐久房间
    break;
}

///Return_realtime([STARTBEAT,MusicBPM],beat)
if (argument_count==3){
    return argument0+round(750*argument2/argument1)
}
else if (argument_count==1){
    return STARTBEAT+round(750*argument0/MusicBPM)
}

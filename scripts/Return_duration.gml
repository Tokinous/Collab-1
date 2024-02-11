///Return_duration([MusicBPM],STARTBEAT,Endbeat)
if (argument_count==3){
    return round(750*argument2/argument0)-round(750*argument1/argument0)
}
else if (argument_count==2){
    return round(750*argument1/MusicBPM)-round(750*argument0/MusicBPM)
}

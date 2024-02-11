///Return_realtime(STARTSTEP,MusicBPM,realtime)

if (argument_count==3){
    return round((argument2-argument0)*argument1/750)
}
else if (argument_count==1){
    return round((argument0-STARTSTEP)*MusicBPM/750)
}

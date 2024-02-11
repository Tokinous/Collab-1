///SSca((inst,)scto,TimeBySpeed)
if (argument_count==2){
    SSca(lerp(scale(),argument0,argument1))
}
else{
    SSca(argument0,lerp(scale(argument0),argument1,argument2))
}

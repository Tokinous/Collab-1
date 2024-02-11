///Mld((inst,)len,dir)
if (argument_count==2){
    x+=lengthdir_x(argument0,argument1)
    y+=lengthdir_y(argument0,argument1)
}
else{
    argument0.x+=lengthdir_x(argument1,argument2)
    argument0.y+=lengthdir_y(argument1,argument2)
}

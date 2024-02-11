///Mrt((inst,)x,y,r,theta)
if (argument_count==4){
    x=argument0+lengthdir_x(argument2,argument3);
    y=argument1+lengthdir_y(argument2,argument3);
}
else{
    argument0.x=argument1+lengthdir_x(argument3,argument4);
    argument0.y=argument2+lengthdir_y(argument3,argument4);
}

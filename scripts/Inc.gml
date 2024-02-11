///Inc(x,y,obj);
if (argument_count==3){
    return instance_create(argument0,argument1,argument2);
}
else if (argument_count==1){
    return instance_create(-1000,-1000,argument0);
}

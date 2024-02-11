///Draw_Ring(x,y,R_inside,R_outside,precision,(dirStart)):using the color setted before
if (argument_count==5){
    var i,dir;
    draw_primitive_begin(pr_trianglestrip)
    for(i=0;i<=argument4;i+=1){
        dir=i*360/argument4
        draw_vertex(argument0+lengthdir_x(argument2,dir),argument1+lengthdir_y(argument2,dir))
        draw_vertex(argument0+lengthdir_x(argument3,dir),argument1+lengthdir_y(argument3,dir))
    }
    draw_primitive_end()
}
if (argument_count==6){
    var i,dir;
    draw_primitive_begin(pr_trianglestrip)
    for(i=0;i<=argument4;i+=1){
        dir=i*360/argument4+argument5;
        draw_vertex(argument0+lengthdir_x(argument2,dir),argument1+lengthdir_y(argument2,dir))
        draw_vertex(argument0+lengthdir_x(argument3,dir),argument1+lengthdir_y(argument3,dir))
    }
    draw_primitive_end()
}

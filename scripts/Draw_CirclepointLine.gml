///Draw_CirclepointLine(x1,y1,x2,y2,width)
var x1,y1,x2,y2,width,xcen,ycen,xvert,yvert,i;
x1=argument0
y1=argument1
x2=argument2
y2=argument3
width=argument4
xcen=(x1+x2)/2
ycen=(y1+y2)/2
if point_distance(x1,y1,xcen,ycen)=0 break
draw_primitive_begin(pr_trianglefan)
draw_vertex(xcen,ycen)
xvert=(ycen-y1)/point_distance(x1,y1,xcen,ycen)
yvert=-(xcen-x1)/point_distance(x1,y1,xcen,ycen)
for(i=0;i<=180;i+=45){
    draw_vertex(x1+Return_x_Dtheta(xvert,yvert,i)*width/2,y1+Return_y_Dtheta(xvert,yvert,i)*width/2)
}
for(i=180;i<=360;i+=45){
    draw_vertex(x2+Return_x_Dtheta(xvert,yvert,i)*width/2,y2+Return_y_Dtheta(xvert,yvert,i)*width/2)
}
draw_vertex(x1+Return_x_Dtheta(xvert,yvert,0)*width/2,y1+Return_y_Dtheta(xvert,yvert,0)*width/2)
draw_primitive_end()

///Return_Heart_Theta_to_R(theta:deg)
var theta;
theta=abs(argument0)mod 360
if theta>180 theta=abs(theta-360)
theta=degtorad(theta)
return abs(theta)/2*(cos(theta*11/9)+2)+1

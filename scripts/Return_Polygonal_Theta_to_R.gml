///Return_Polygonal_Theta_to_R(theta:deg,Dtheta,N) R:center to point
var theta;
theta=(argument0-argument1)*pi/180
return cos(pi/argument2)/cos(theta-pi/argument2-floor(theta/2/pi*argument2)*2*pi/argument2)

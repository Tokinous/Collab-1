///Ease_bezier4Point(t:0~1,P1,P2,P3,P4):0~1(size)
var T1,T2,T3;
T1=lerp(argument1,argument2,argument0)
T2=lerp(argument2,argument3,argument0)
T3=lerp(argument3,argument4,argument0)
return lerp(lerp(T1,T2,argument0),lerp(T2,T3,argument0),argument0)

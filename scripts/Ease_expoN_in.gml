///Ease_expoN_in(t:0~1,N):0~1(size)
if argument0<0 return 0
else if argument0>1 return 1
else return (1-power(argument1,-argument0)-argument0*ln(argument1)/argument1)/(1-1/argument1-ln(argument1)/argument1)

///_Div(i, j) :: 对负数取整的修正
var i, j, k;
i = argument0;
j = argument1;
k = ceil(abs(i)/j);
i += k*j;
return i div j - k;

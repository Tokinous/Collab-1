///_Mod(i, j) :: 对负数取模的修正
var i, j;
i = argument0;
j = argument1;
i += ceil(abs(i)/j)*j;
return i mod j;

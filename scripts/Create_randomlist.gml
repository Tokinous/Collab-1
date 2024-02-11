///Create_randomlist(num,mark)>>>Create list Arg[0,mark] to Arg[num-1,mark] in 0 to num-1
var i,s;
for(i=0;i<argument0;i+=1){
    s=irandom(i)
    Arg[i,argument1]=Arg[s,argument1]
    Arg[s,argument1]=i
}

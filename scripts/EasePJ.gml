///powerN///EasePJ(T,power(,T_max))  EasePJ(a1,T1,T2,a2)+EasePJ(a2,T2,T3,a3)+EasePJ(a3,T3,T4,a4)+……
if (argument_count==2){
    global.T_EasePJ_Used=argument0;
    global.Power_EasePJ_Used=argument1;
}
else if (argument_count==3){
    if (argument0<argument2) global.T_EasePJ_Used=argument0;
    else global.T_EasePJ_Used=argument2;
    global.Power_EasePJ_Used=argument1;
}
else{
    if (global.T_EasePJ_Used>argument1 && global.T_EasePJ_Used<=argument2){
        return lerp(argument0,argument3,Ease_powerN_outin((global.T_EasePJ_Used-argument1)/(argument2-argument1),global.Power_EasePJ_Used) )
    }
    else return 0;
}

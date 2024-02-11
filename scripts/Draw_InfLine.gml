///Draw_InfLine(Xcenter,Ycenter,Dir(,Width))//Color and Alpha are not setted;
if (argument_count==3){
    draw_line(argument0+Lex(2000,argument2),argument1+Ley(2000,argument2),argument0-Lex(2000,argument2),argument1-Ley(2000,argument2));
}
else if (argument_count==4){
    draw_line_width(argument0+Lex(2000,argument2),argument1+Ley(2000,argument2),argument0-Lex(2000,argument2),argument1-Ley(2000,argument2),argument3);
}

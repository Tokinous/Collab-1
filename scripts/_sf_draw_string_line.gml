                                                                                                                                                                             ///_sf_draw_string_line(x, y, str, xscale, yscale, angle, ss, cc)
///Draw a line of text.

var xx, yy, str, xscale ,yscale, angle, ss, cc;
xx = argument0;
yy = argument1;
str = argument2;
xscale = argument3;
yscale = argument4;
angle = argument5;
ss = argument6;
cc = argument7;

var len, i;
len = string_length(str);

for (i = 0; i < len; i += 1) {
    var ch;
    ch = string_char_at(str, i + 1);

    var glyph;
    glyph = _sf_get_glyph(ch);

    var xo, yo, xa;
    xo = _sf_glyph_get_info(glyph, 'xo');
    yo = _sf_glyph_get_info(glyph, 'yo');
    xa = _sf_glyph_get_info(glyph, 'xa');

    draw_sprite_general(_sf_get_sprite(), 0,
        _sf_glyph_get_info(glyph, 'x'),
        _sf_glyph_get_info(glyph, 'y'),
        _sf_glyph_get_info(glyph, 'w'),
        _sf_glyph_get_info(glyph, 'h'),
        xx + xo * xscale * cc + yo * yscale * ss,
        yy + xo * xscale * -ss + yo * yscale * cc,
        xscale, yscale, angle,
        global.sf_cur_color, global.sf_cur_color, global.sf_cur_color, global.sf_cur_color,
        global.sf_cur_alpha
    );

    xx += cc * xa * xscale;
    yy -= ss * xa * xscale;
}

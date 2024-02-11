///_sf_draw_text(str, x, y, linesep, linewidth, angle, xscale, yscale)
///Draw multiline text.

var str, xx, yy, linesep, linewidth, angle, xscale, yscale;
str = argument0;
xx = argument1;
yy = argument2;
linesep = argument3;
linewidth = argument4;
angle = argument5;
xscale = argument6;
yscale = argument7;

var sl;
sl = ds_list_create();

_sf_split_text(sl, str, linewidth);

var ang, ss, cc;
ang = degtorad(angle);
ss = sin(ang);
cc = cos(ang);

var font_size;
font_size = _sf_get_font_size();

if (linesep <= 0) {
    linesep = font_size;
}

var xsep, ysep;
xsep = ss * xscale * linesep;
ysep = cc * yscale * linesep;

if (global.sf_cur_valign == fa_middle) {
    yy -= (ds_list_size(sl) * ysep) / 2;
    xx -= (ds_list_size(sl) * xsep) / 2;
}
if (global.sf_cur_valign == fa_bottom) {
    yy -= (ds_list_size(sl) * ysep);
    xx -= (ds_list_size(sl) * xsep);
}

// draw text
var i, xoff, yoff;
for (i = 0; i < ds_list_size(sl); i += 1) {
    xoff = 0;
    yoff = 0;

    var line;
    line = ds_list_find_value(sl, i);

    if (global.sf_cur_halign == fa_center) {
        xoff = -(xscale * _sf_text_width(line) / 2);
    }
    if (global.sf_cur_halign == fa_right) {
        xoff = -(xscale * _sf_text_width(line));
    }

    var dx, dy;
    dx = xx + cc * xoff + ss * yoff;
    dy = yy - ss * xoff + cc * yoff;

    _sf_draw_string_line(dx, dy, line, xscale, yscale, angle, ss, cc);

    xx += xsep;
    yy += ysep;
}

ds_list_destroy(sl);

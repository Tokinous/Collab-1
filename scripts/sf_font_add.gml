///sf_font_add(texture_file_name, glyphs_file_name)

var font, size, f, i;

font = ds_map_create();

f = file_text_open_read(argument1);

size = file_text_read_real(f);
file_text_readln(f);

glyph_count = file_text_read_real(f);
file_text_readln(f);

for (i = 0; i < glyph_count; i += 1) {
    var char, xx, yy, ww, hh, xo, yo, xa, glyph;

    char = file_text_read_string(f);
    file_text_readln(f);

    xx = file_text_read_real(f);
    file_text_readln(f);

    yy = file_text_read_real(f);
    file_text_readln(f);

    ww = file_text_read_real(f);
    file_text_readln(f);

    hh = file_text_read_real(f);
    file_text_readln(f);

    xo = file_text_read_real(f);
    file_text_readln(f);

    yo = file_text_read_real(f);
    file_text_readln(f);

    xa = file_text_read_real(f);
    file_text_readln(f);

    glyph = ds_map_create();
    ds_map_add(glyph, 'x', xx);
    ds_map_add(glyph, 'y', yy);
    ds_map_add(glyph, 'w', ww);
    ds_map_add(glyph, 'h', hh);
    ds_map_add(glyph, 'xo', xo);
    ds_map_add(glyph, 'yo', yo);
    ds_map_add(glyph, 'xa', xa);
    ds_map_add(font, char, glyph);
}
file_text_close(f);

ds_map_add(font, 'size', size); // size is font **height**
ds_map_add(font, 'spr', sprite_add(argument0, 0, 0, 0, 0, 0));

return font;

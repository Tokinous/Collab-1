///_sf_get_glyph(char)
///Get the glyph map of the specified character in the current font.

if (ds_map_exists(global.sf_cur_font, argument0)) {
    return ds_map_find_value(global.sf_cur_font, argument0);
} else {
    return ds_map_find_value(global.sf_cur_font, ' ');
}

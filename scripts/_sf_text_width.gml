///_sf_text_width(str)
///Measure the width of multiline text.

var i, len, glyph, result;
len = string_length(argument0);
result = 0;
for (i = 0; i < len; i += 1) {
    glyph = _sf_get_glyph(string_char_at(argument0, i + 1));
    result += _sf_glyph_get_info(glyph, 'xa');
}

return result;

///sf_string_height(str)

var str, i, len, newlines;
str = argument0;

newlines = 1;

len = string_length(str);
for (i = 0; i < len; i += 1) {
    if (string_char_at(str, i + 1) == chr(10) || string_char_at(str, i + 1) == '#') {
        newlines += 1;
    }
}

return _sf_get_font_size() * newlines;

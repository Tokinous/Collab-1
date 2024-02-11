///sf_string_width_ext(str, sep, w)

var str, sep, w;
str = argument0;
sep = argument1;
w = argument2;

var sl, result;
sl = ds_list_create();
_sf_split_text(sl, str, w);
if (sep < 0) {
    sep = _sf_get_font_size();
}

result = 0;
var i;
for (i = 0; i < ds_list_size(sl); i += 1) {
    var width;
    width = _sf_text_width(ds_list_find_value(sl, i));
    if (result < width) {
        result = width;
    }
}

ds_list_destroy(sl);

return result;

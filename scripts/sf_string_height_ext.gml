///sf_string_height_ext(str, sep, w)

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

result = ds_list_size(sl) * sep;

ds_list_destroy(sl);

return result;

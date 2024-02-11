///sf_font_delete(font)

var font;
font = argument0;

var size, key, last, i;
size = ds_map_size(font);
key = ds_map_find_first(font);
last = ds_map_find_last(font);
for (i = 0; i < size; i += 1) {
    if (key == 'size') {
        continue;
    } else if (key == 'spr') {
        sprite_delete(ds_map_find_value(font, key));
    } else {
        ds_map_destroy(ds_map_find_value(font, key));
    }

    if (key != last) {
        key = ds_map_find_next(font, key);
    }
    else break;
}

ds_map_destroy(font);

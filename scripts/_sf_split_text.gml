///_sf_split_text(list, str, linewidth)
///Convert text to a list.

var sl, str, linewidth;
sl = argument0;
str = argument1;
linewidth = argument2;

if (linewidth < 0) {
    linewidth = 10000000;
}

var st, ed, len;
st = 0;
ed = 0;
len = string_length(str);
while (st < len) {
    var total;
    total = 0;

    // if width < 0 (i.e. no wrapping required), then we DON'T strip spaces from the start... we just copy it!  (sounds wrong.. but its what they do...)
    if (linewidth == 10000000) {
        while (ed < len && (string_char_at(str, ed + 1) != chr(10) && string_char_at(str, ed + 1) != '#')) {
            ed += 1;
        }
        ds_list_add(sl, string_copy(str, st + 1, ed - st)); // add into our list...
    } else {
        // skip leading whitespace
        while (ed < len) {
            if (string_char_at(str, ed + 1) != ' ') {
                break;
            }
            ed += 1;
        }
        st = ed;

        var glyph;
        
        // loop through string and get the number of chars that will fit in the line.
        while (ed < len && total < linewidth) {
            if (string_char_at(str, ed + 1) == chr(10) || string_char_at(str, ed + 1) == '#') {
                break;
            } 
            glyph = _sf_get_glyph(string_char_at(str, ed + 1));
            total += _sf_glyph_get_info(glyph, 'xa');
            ed += 1;
        }

        // if we shot past the end, then move back a bit until we fit.
        if (total > linewidth) {
            ed -= 1;
            glyph = _sf_get_glyph(string_char_at(str, ed + 1));
            total -= _sf_glyph_get_info(glyph, 'xa');
        }

        // END of line
        if (string_char_at(str, ed + 1) == chr(10) || string_char_at(str, ed + 1) == '#') {
            ds_list_add(sl, string_copy(str, st + 1, ed - st));
        } else {
            // NOT a new line, but we didn't move on... fatel error. Probably a single char doesn't even fit!
            if (ed == st) {
                exit;
            }
            
            // If we don't END on a "space", OR if the next character isn't a space AS WELL. 
            // then backtrack to the start of the last "word"
            if (ed != len) {
                if ((string_char_at(str, ed + 1) != ' ') || 
                    (string_char_at(str, ed + 1) != ' ' && string_char_at(str, ed + 2) != ' ')) {
                    while (ed > st) {
                        ed -= 1;
                        if (string_char_at(str, ed + 1) == ' ') {
                            break;
                        }
                    }
                }
            }
            
            if (ed > st) {
                while (string_char_at(str, ed) == ' ') {
                    ed -= 1;
                }
            } else if (ed == st) {
                while (string_char_at(str, ed + 1) != ' ' && ed < len) {
                    ed += 1;
                }
            }

            ds_list_add(sl, string_copy(str, st + 1, ed - st));
        }
    }
    
    ed += 1;
    st = ed;
}

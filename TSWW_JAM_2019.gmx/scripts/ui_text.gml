#define ui_text
///ui_text(x, y, str, scale, colour, alpha)
var _x = argument0, _y = argument1, _str = argument2, _sz = argument3, _col = argument4, _alpha = argument5;

draw_text_transformed_colour(_x, _y + _sz, _str, _sz, _sz, 0, 0, 0, 0, 0, _alpha);
draw_text_transformed_colour(_x, _y, _str, _sz, _sz, 0, _col, _col, _col, _col, _alpha);

#define ui_text_wid
///ui_text_wid(x, y, str, scale, colour, alpha, sep, wid)
var _x = argument0, _y = argument1, _str = argument2, _sz = argument3, _col = argument4, _alpha = argument5;
var _sep = argument6, _wid = argument7;

draw_text_ext_transformed_colour(_x, _y + _sz, _str, _sep, _wid, _sz, _sz, 0, 0, 0, 0, 0, _alpha);
draw_text_ext_transformed_colour(_x, _y, _str, _sep, _wid, _sz, _sz, 0, _col, _col, _col, _col, _alpha);
///bilerp(a, b, c, d, u, v)
/*
    Calculates bilinear interpolation on the 4 values (a->b, c->d) with given factor (u, v)
*/

var _v1 = lerp(argument0, argument1, argument4);
var _v2 = lerp(argument2, argument3, argument4);
return lerp(_v1, _v2, argument5);

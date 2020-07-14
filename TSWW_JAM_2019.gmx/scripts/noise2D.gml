#define noise2D
///noise2D(x, y)
/*
    returns (smooth) noise value in 0..1 space
*/
var _ix = floor(argument0);
var _iy = floor(argument1);
var _fx = frac(argument0);
var _fy = frac(argument1);

var _s00 = hash2D(_ix, _iy);
var _s10 = hash2D(_ix + 1, _iy);
var _s01 = hash2D(_ix, _iy + 1);
var _s11 = hash2D(_ix + 1, _iy + 1);

return bilerp(_s00, _s10, _s01, _s11, _fx, _fy);

#define hash2D
///hash2D(x, y)
/*
    returns hashed (and hopefully random) value in 0...1 range
*/
var _pr = random_get_seed();
random_set_seed(argument0 | (argument1 << 4));
var _val = random(1);
random_set_seed(_pr);
return _val;
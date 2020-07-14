///instance_fetch_range(x, y, obj, dist)
var _x = argument0, _y = argument1;
var _object = argument2;
var _dist = argument3;

var _arr = -1;
var _idx = 0;

with (_object)
{
    var _pdist = point_distance(x, y, _x, _y);
    
    if (_pdist < _dist)
    {
        _arr[_idx++] = id;
    }
}

return _arr;

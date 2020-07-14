///entity_add(x, y, type)
/*
    Adds entity and returns its instance id
*/

var _x = argument0, _y = argument1, _type = argument2;
var _index = ds_list_size(entities);

// Generate instance & append it to list
var _inst = instance_create(_x, _y, oENTITY);
_inst.type = _type;

ds_list_add(entities, _inst);

// return it
return _inst;

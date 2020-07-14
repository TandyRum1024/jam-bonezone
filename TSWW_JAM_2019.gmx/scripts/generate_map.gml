///generate_map(seed)
show_debug_message("SEED : " + string(argument0));
var _seed = argument0;

// Generate grid vertex buffer
var _vbuff = -1;
for (var gx=0; gx<ds_grid_width(mapVB); gx++)
{
    for (var gy=0; gy<ds_grid_height(mapVB); gy++)
    {
        random_set_seed(_seed + gx + gy * _seed);
        _vbuff = vertex_create_buffer();
        
        // build buffer
        var _subdiv = 4;
        var _unit = global.gridSize / _subdiv;
        var _flooridx = irandom_range(1, 3);
        
        vertex_begin(_vbuff, lvlVF);
        // ground
        for (var i=0; i<_subdiv; i++)
        {
            for (var j=0; j<_subdiv; j++)
            {
                for (var c=0; c<6; c++)
                {
                    var _dx = _lutx[c], _dy = _luty[c];
                    var _wx = global.gridSize * gx + (i + _dx) * _unit, _wy = global.gridSize * gy + (j + _dy) * _unit;
                    var _diff = noise2D(_seed + _wx, _seed + _wy);
                    
                    var _u = _dx * global.mapTexUnit + _flooridx * global.mapTexUnit;
                    var _z = _diff * 8;
                    
                    vertex_position_3d(_vbuff, _wx, _wy, _z);
                    vertex_texcoord(_vbuff, _u, 1 - _dy);
                    vertex_colour(_vbuff, make_colour_hsv(_diff * 255, _diff * 50, 230 + _diff * 25), 1.0);
                }
            }
        }
        
        // fence(?)
        if (gx == 0)
        {
            for (var i=0; i<_subdiv; i++)
            {
                for (var c=0; c<6; c++)
                {
                    var _dx = _lutx[c], _dy = _luty[c];
                    var _wy = global.gridSize * gy + (i + _dx) * _unit, _wz = _dy * _unit;
                    
                    vertex_position_3d(_vbuff, 0, _wy, _wz);
                    vertex_texcoord(_vbuff, _dx * global.mapTexUnit, 1 - _dy);
                    vertex_colour(_vbuff, make_colour_hsv(_diff * 255, _diff * 50, 230 + _diff * 25), 1.0);
                }
            }
        }
        if (gx == gridW - 1)
        {
            var _wx = gridW * global.gridSize;
            
            for (var i=0; i<_subdiv; i++)
            {
                for (var c=0; c<6; c++)
                {
                    var _dx = _lutx[c], _dy = _luty[c];
                    var _wy = global.gridSize * gy + (i + _dx) * _unit, _wz = _dy * _unit;
                    
                    vertex_position_3d(_vbuff, _wx, _wy, _wz);
                    vertex_texcoord(_vbuff, _dx * global.mapTexUnit, 1 - _dy);
                    vertex_colour(_vbuff, make_colour_hsv(_diff * 255, _diff * 50, 230 + _diff * 25), 1.0);
                }
            }
        }
        
        if (gy == 0)
        {
            for (var i=0; i<_subdiv; i++)
            {
                for (var c=0; c<6; c++)
                {
                    var _dx = _lutx[c], _dy = _luty[c];
                    var _wx = global.gridSize * gx + (i + _dx) * _unit, _wz = _dy * _unit;
                    
                    vertex_position_3d(_vbuff, _wx, 0, _wz);
                    vertex_texcoord(_vbuff, _dx * global.mapTexUnit, 1 - _dy);
                    vertex_colour(_vbuff, make_colour_hsv(_diff * 255, _diff * 50, 230 + _diff * 25), 1.0);
                }
            }
        }
        
        if (gy == gridH - 1)
        {
            var _wy = gridH * global.gridSize;
        
            for (var i=0; i<_subdiv; i++)
            {
                for (var c=0; c<6; c++)
                {
                    var _dx = _lutx[c], _dy = _luty[c];
                    var _wx = global.gridSize * gx + (i + _dx) * _unit, _wz = _dy * _unit;
                    
                    vertex_position_3d(_vbuff, _wx, _wy, _wz);
                    vertex_texcoord(_vbuff, _dx * global.mapTexUnit, 1 - _dy);
                    vertex_colour(_vbuff, make_colour_hsv(_diff * 255, _diff * 50, 230 + _diff * 25), 1.0);
                }
            }
        }
        vertex_end(_vbuff);
        vertex_freeze(_vbuff);
        
        mapVB[# gx, gy] = _vbuff;
    }
}

// Generate Entities
var _minTrashes = 4;
for (var gx=0; gx<ds_grid_width(mapVB); gx++)
{
    for (var gy=0; gy<ds_grid_height(mapVB); gy++)
    {
        var _wx = global.gridSize * gx, _wy = global.gridSize * gy;
        
        random_set_seed(_seed + gx + _seed * gy);
        var _rand = random_range(0, 100);
        
        if (_rand < 4)
        {
            random_set_seed(_seed + gx + _seed * gy + 1);
            var _offx = random_range(42, global.gridSize-42), _offy = random_range(42, global.gridSize-42);
        
            var _i = instance_create(_wx + _offx, _wy + _offy, oITEM);
            trashLeft++;
        }
        if (_rand < 15)
        {
            random_set_seed(_seed + gx + _seed * gy + 2);
            var _offx = random_range(0, global.gridSize), _offy = random_range(0, global.gridSize);
            
            var _i = instance_create(_wx + _offx, _wy + _offy, oNPC);
            _i.type = choose(npcTYPE.MISC, npcTYPE.LOCATE_ITEM);
        }
        if (_rand < 30)
        {
            random_set_seed(_seed + gx + _seed * gy + 3);
            var _offx = random_range(0, global.gridSize), _offy = random_range(0, global.gridSize);
        
            var _i = instance_create(_wx + _offx, _wy + _offy, oDECO);
        }
    }
}

// place minimum trashes
for (var i=trashLeft; i<_minTrashes; i++)
{
    var _i = instance_create(random_range(itemDist, global.gridSize * gridW - itemDist), random_range(itemDist, global.gridSize * gridH - itemDist), oITEM);
    trashLeft++;
}

// update entity variables
with (oITEM)
{
    update_grid_pos();
    item_roll();
}

with (oNPC)
{
    npc_roll_quip();
    update_grid_pos();
}

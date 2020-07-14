//
// Vertex
//
attribute vec3 in_Position;                  // (x,y,z)
attribute vec2 in_TextureCoord;              // (u,v)
attribute vec4 in_Color;                     // (r,g,b)

varying vec3 v_vTexcoordRaw; // affine texture emulated uv
varying vec2 v_vTexcoord; // normal perspective correct uv
varying vec4 v_vColor;

vec2 rand2D (vec2 p)
{
    return vec2(fract(p.x * 53.0 * 3.1434), fract(p.y * 53.0 * 35.0 * 100.0));
}

void main()
{
    const float precFactor = 4.0; // vertex position precision factor (lower = MORE CRUNCHY)

    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    vec4 viewpos = gm_Matrices[MATRIX_WORLD_VIEW] * object_space_pos;
    
    // wobbly lowprec vertex position
    viewpos.xy = floor(viewpos.xy * precFactor) / precFactor;
    
    vec4 clippos = gm_Matrices[MATRIX_PROJECTION] * viewpos;
    gl_Position = clippos;

    v_vTexcoord = in_TextureCoord;
    
    // pass in non-perspective correct uv
    // with vertex w value to divide in fragment shader
    v_vTexcoordRaw = vec3(in_TextureCoord.xy * abs(clippos.w), abs(clippos.w));
    
    v_vColor = in_Color;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple but not so simple shader
//
varying vec3 v_vTexcoordRaw;  // affine texture emulated uv
varying vec2 v_vTexcoord; // normal perspective correct uv
varying vec4 v_vColor;

void main()
{
    // interpolate between normal & affine texture mapping uv
    vec2 warpeduv = mix(v_vTexcoordRaw.xy / v_vTexcoordRaw.z, v_vTexcoord, 0.5);
    
    // and sample some textures with it
    vec4 basicSamp = v_vColor * texture2D( gm_BaseTexture, warpeduv );
    
    // apply fog
    const float rangeStart = 0.99;
    const float rangeEnd = 0.998;
    float fogFactor = smoothstep(rangeStart, rangeEnd, fract(gl_FragCoord.z));
    
    const vec3 fogColour = vec3(0.086, 0.086, 0.086);
    vec4 fogResult = mix(basicSamp, vec4(vec3(fogColour), 1.0), fogFactor);
    
    gl_FragColor = fogResult;
}


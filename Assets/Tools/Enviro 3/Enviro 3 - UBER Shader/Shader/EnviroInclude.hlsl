#include "Assets/Enviro 3 - Sky and Weather/Resources/Shader/Includes/FogInclude.cginc"
/*
struct EnviroRemovalZones
{
    float type; 
    float3 pos; 
    float radius;
    float3 size; 
    float3 axis; 
    float stretch;
    float density;
    float feather;
    float4x4 transform;
    float pad0;
    float pad1;
}; 
   
#if defined(SHADER_API_D3D11) || defined(SHADER_API_METAL) || defined(SHADER_API_VULKAN)
StructuredBuffer<EnviroRemovalZones> _EnviroRemovalZones : register(t1);
#endif

float _EnviroRemovalZonesCount;

float3 InverseLerp(float lowThreshold, float hiThreshold, float3 value)
{
	return (value - lowThreshold) / (hiThreshold - lowThreshold);
} 
float ClampedInverseLerp(float lowThreshold, float hiThreshold, float value)
{
	return saturate(InverseLerp(lowThreshold, hiThreshold, value));
} 
 
*/
float EnviroRemoveZones(float3 pos, float density)
{
#if defined(SHADER_API_D3D11) || defined(SHADER_API_METAL) || defined(SHADER_API_VULKAN)
for (int i = 0; i < _EnviroRemovalZonesCount; i++)
{
    if(_EnviroRemovalZones[i].type == 0) 
    { 
        float3 dir = _EnviroRemovalZones[i].pos - pos;
        float3 axis = _EnviroRemovalZones[i].axis;
        float3 dirAlongAxis = dot(dir, axis) * axis;

        dir = dir + dirAlongAxis * _EnviroRemovalZones[i].stretch;
        float distsq = dot(dir, dir);
        float radius = _EnviroRemovalZones[i].radius;
        float feather = _EnviroRemovalZones[i].feather;

        feather = (1.0 - smoothstep (radius * feather, radius, distsq));

        float contribution = feather * _EnviroRemovalZones[i].density;
        density = density + contribution;
        //density = max(density,0.0);
    }
    else 
    {
        float influence = 1;
        float3 position = mul(_EnviroRemovalZones[i].transform, float4(pos, 1)).xyz;

        float x = ClampedInverseLerp(-0.5f, -0.5f + _EnviroRemovalZones[i].feather, position.x) - ClampedInverseLerp(0.5f - _EnviroRemovalZones[i].feather, 0.5f, position.x);
        float y = ClampedInverseLerp(-0.5f, -0.5f + _EnviroRemovalZones[i].feather, position.y) - ClampedInverseLerp(0.5f - _EnviroRemovalZones[i].feather, 0.5f, position.y);
        float z = ClampedInverseLerp(-0.5f, -0.5f + _EnviroRemovalZones[i].feather, position.z) - ClampedInverseLerp(0.5f - _EnviroRemovalZones[i].feather, 0.5f, position.z);
        
        influence = x * y * z; 

        density += _EnviroRemovalZones[i].density * influence;
        //density = max(density,0.0);
    }
}
#endif
    return density;
} 

float2 voronoi (float2 UV, float offset) 
{
    float2x2 m = float2x2(15.27, 47.63, 99.41, 89.98);
    UV = frac(sin(mul(UV, m)) * 46839.32);
    return float2(sin(UV.y * + offset) * 0.5 + 0.5, cos(UV.x * offset)  * 0.5 + 0.5);
}

float2 mod(float2 x, float y)
{
	return x - y * floor(x / y);
}

void Rain(float2 UV, float AngleOffset, float CellDensity, float Time, float Strength,float power,float sinus, out float Out, out float3 normal) {
    float2 g = floor(UV * CellDensity); 
    float2 f = frac(UV * CellDensity);  

    Out = 0;
    normal = float3(0, 0, 1);

    for(int y=-1; y<=1; y++) {
        for(int x=-1; x<=1; x++) {

            float2 lattice = float2(x,y);
            float2 offset = voronoi(mod(lattice + g, CellDensity), AngleOffset);
            float d = distance(lattice + offset, f);
            float t = frac(Time + (offset.x * 5));
            d = (1-d) * (1-d) * Strength * pow(saturate(1 - abs(d - t)), power) * lerp(sin((d-t) * 30),1,sinus);
            Out = max(Out, d);
            normal += d * (normalize(float3(normalize((lattice + offset).xy - f), 3))).xyz;
        }
    }
    normal = normalize(normal);
}
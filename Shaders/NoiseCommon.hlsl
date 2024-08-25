#ifndef _INCLUDE_NOISECOMMON_
#define _INCLUDE_NOISECOMMON_

#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/DynamicScaling.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/EntityLighting.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GlobalSamplers.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/UnityInstancing.hlsl"

float4 mod(float4 x, float4 y)
{
    return x - y * floor(x / y);
}

float3 mod(float3 x, float3 y)
{
    return x - y * floor(x / y);
}

float2 mod289(float2 x)
{
    return x - floor(x / 289.0) * 289.0;
}

float3 mod289(float3 x)
{
    return x - floor(x / 289.0) * 289.0;
}

float4 mod289(float4 x)
{
    return x - floor(x / 289.0) * 289.0;
}

float4 permute(float4 x)
{
    return mod289(((x * 34.0) + 1.0) * x);
}

float3 permute(float3 x)
{
    return mod289((x * 34.0 + 1.0) * x);
}

float4 taylorInvSqrt(float4 r)
{
    return (float4)1.79284291400159 - r * 0.85373472095314;
}

float3 taylorInvSqrt(float3 r)
{
    return 1.79284291400159 - 0.85373472095314 * r;
}

float3 fade(float3 t)
{
    return t * t * t * (t * (t * 6.0 - 15.0) + 10.0);
}

float2 fade(float2 t)
{
    return t * t * t * (t * (t * 6.0 - 15.0) + 10.0);
}

float rand2dTo1d(float2 value, float2 dotDir = float2(12.9898, 78.233))
{
    float2 smallValue = sin(value);
    float random = dot(smallValue, dotDir);
    random = frac(sin(random) * 143758.5453);
    return random;
}

float rand1dTo1d(float3 value, float mutator = 0.546)
{
    float random = frac(sin(value.x + mutator) * 143758.5453);
    return random;
}

float rand3dTo1d(float3 value, float3 dotDir = float3(12.9898, 78.233, 37.719))
{
    //make value smaller to avoid artefacts
    float3 smallValue = sin(value);
    //get scalar value from 3d vector
    float random = dot(smallValue, dotDir);
    //make value more random by making it bigger and then taking the factional part
    random = frac(sin(random) * 143758.5453);
    return random;
}

#endif

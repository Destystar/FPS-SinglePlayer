Shader "Hidden/UBER - Tessellation"
{
	Properties
	{
		_TilingOffset("Tiling / Offset", Vector) = (1,1,0,0)
		[NoScaleOffset][SingleLineTexture]_MainTex("Albedo", 2D) = "white" {}
		_Color("Base Tint", Color) = (1,1,1,1)
		_DetailTint("Detail Tint", Color) = (1,1,1,1)
		[NoScaleOffset][Normal][SingleLineTexture]_BumpMap("Normal", 2D) = "bump" {}
		_BumpScale("Normal Intensity", Range( 0 , 2)) = 1
		[NoScaleOffset][SingleLineTexture]_BaseMask("Base Mask", 2D) = "black" {}
		_Smoothness("Smoothness", Range( 0 , 1)) = 1
		_SmoothnessDetail("Smoothness Detail", Range( 0 , 1)) = 1
		_SmoothnessWet("SmoothnessWet", Range( 0 , 1)) = 0.1
		[SingleLineTexture]_EmissionMap("Emission", 2D) = "white" {}
		[HDR]_EmissionColor("Emission Color", Color) = (0,0,0,0)
		_SnowDisplacementStrength("Snow Displacement Strength", Range( 0 , 0.05)) = 0.01
		_SSSIntensity("SSS Intensity", Range( 0 , 5)) = 3
		_SSSScale("SSS Scale", Range( 0 , 1)) = 0.5
		_SSSDistortion("SSS Distortion", Range( 0 , 1)) = 0.9
		_DetailTilingOffset("Detail Tiling/Offset", Vector) = (1,1,0,0)
		[NoScaleOffset][SingleLineTexture]_Mask("Mask", 2D) = "black" {}
		_DetailMaskTiling("Detail Mask Tiling", Float) = 1
		[NoScaleOffset][SingleLineTexture]_DetailAlbedoMap("Detail Albedo", 2D) = "white" {}
		[NoScaleOffset][SingleLineTexture]_DetailNormalMap("Detail Normal", 2D) = "bump" {}
		[Toggle(_ENVIROREMOVALZONES_ON)] _ENVIROREMOVALZONES("_ENVIROREMOVALZONES", Float) = 0
		[Toggle(_RAIN_ON)] _Rain("Rain", Float) = 1
		_RainFlowIntensity("Rain Flow Intensity", Range( 0 , 2)) = 1
		_RainFlowDistortionScale("Rain Flow Distortion Scale", Float) = 10
		[Toggle(_PUDDLES_ON)] _Puddles("Puddles", Float) = 1
		_RainFlowDistortionStrenght("Rain Flow Distortion Strenght", Range( 0 , 0.25)) = 0.1
		_PuddleWaveTiling("Puddle Wave Tiling", Float) = 1
		_PuddleWaveIntensity("Puddle Wave Intensity", Range( 0 , 2)) = 1
		[NoScaleOffset][SingleLineTexture]_GlobalNormal("Global Normal", 2D) = "bump" {}
		_GlobalNormalIntensity("Global Normal Intensity", Range( 0 , 2)) = 1
		_GlobalNormalTiling("Global Normal Tiling", Vector) = (1,1,0,0)
		_MetallicBase("Metallic Base", Range( 0 , 1)) = 0
		_MetallicDetail("Metallic Detail", Range( 0 , 1)) = 0
		_OcclusionStrength("Occlusion Intensity", Range( 0 , 1)) = 0
		_DetailNormalMapScale("DetailNormalMapScale", Range( 0 , 2)) = 1
		_RainDropIntensity("RainDropIntensity", Float) = 5
		_RainDropSpeed("Rain Drop Speed", Range( 0 , 2)) = 1
		_PuddleIntensity("Puddle Intensity", Range( 0 , 5)) = 1
		_PuddleCoverageNoise("Puddle Coverage Noise", Float) = 0.5
		_RainDropTiling("RainDropTiling", Float) = 1
		_PuddleColor("Puddle Color", Color) = (0.6037736,0.6037736,0.6037736,0.6666667)
		_RainDistanceFade("RainDistanceFade", Range( 0 , 10)) = 5
		_RainFlowTiling("Rain Flow Tiling", Float) = 5
		_SnowNormalScale("Snow Normal Scale", Range( 0 , 2)) = 1
		[Normal][SingleLineTexture]_WaveNormal("Wave Normal", 2D) = "white" {}
		[SingleLineTexture]_DetailMask("Detail Mask", 2D) = "black" {}
		[KeywordEnum(Off,Mask,Procedural,Height)] _DetailProceduralMask("Detail Procedural Mask", Float) = 0
		_DetailProceduralMaskScale("Detail Procedural Mask Scale", Float) = 20
		_DetailProceduralMaskIntensity("Detail Procedural Mask Intensity", Float) = 1
		[Enum(Back,2,Front,1,Off,0)]_CullMode("Cull Mode", Int) = 2
		[Toggle(_SNOW_ON)] _Snow("Snow", Float) = 1
		_RainFlowStrength("Rain Flow Strength", Range( 0 , 1)) = 0.5
		[HideInInspector]_SrcBlend("_SrcBlend", Int) = 0
		[HideInInspector]_ZWrite("_ZWrite", Int) = 0
		[HideInInspector]_DstBlend("_DstBlend", Int) = 1
		_CutOff("_CutOff", Range( 0 , 1)) = 0.5
		[SingleLineTexture]_SnowMask("Snow Mask", 2D) = "black" {}
		_RainFlowSmoothnessBoost("RainFlowSmoothnessBoost", Range( 0 , 4)) = 2
		[Normal][SingleLineTexture]_SnowNormal("Snow Normal", 2D) = "white" {}
		[SingleLineTexture]_SnowAlbedo("Snow Albedo", 2D) = "white" {}
		_SnowTiling("Snow Tiling", Float) = 1
		_DetailHeight("Detail Height", Range( -5 , 5)) = 0
		_DetailThreshold("DetailThreshold", Range( -1 , 1)) = 1
		_DetailHeightBlendStrength("DetailHeightBlendStrength", Float) = 1
		_DisplacementStrength("Displacement Strength", Float) = 0.05
		[Toggle(_TESSELLATION_ON)] _Tessellation("Tessellation", Float) = 0
		_Opacity("Opacity", Range( 0 , 1)) = 0
		_TessellationFactor("TessellationFactor", Float) = 5
		[Toggle(_GLOBALDETAILNORMAL_ON)] _GlobalDetailNormal("GlobalDetailNormal", Float) = 0
		[Toggle(_EMISSION_ON)] _Emission("Emission", Float) = 0
		_DetailNormalInfluence("DetailNormalInfluence", Range( 0 , 1)) = 0.5

		//_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		//_TransStrength( "Trans Strength", Range( 0, 50 ) ) = 1
		//_TransNormal( "Trans Normal Distortion", Range( 0, 1 ) ) = 0.5
		//_TransScattering( "Trans Scattering", Range( 1, 50 ) ) = 2
		//_TransDirect( "Trans Direct", Range( 0, 1 ) ) = 0.9
		//_TransAmbient( "Trans Ambient", Range( 0, 1 ) ) = 0.1
		//_TransShadow( "Trans Shadow", Range( 0, 1 ) ) = 0.5
		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Max Tessellation", Range( 1, 32 ) ) = 16
		_TessMin( "Tess Min Distance", Float ) = 10
		_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25
		//[ToggleOff] _SpecularHighlights("Specular Highlights", Float) = 1.0
		//[ToggleOff] _GlossyReflections("Reflections", Float) = 1.0
	}

	SubShader
	{
		
		Tags { "Queue"="Geometry" "DisableBatching"="False" }
	LOD 0

		Cull [_CullMode]
		AlphaToMask Off
		ZWrite [_ZWrite]
		ZTest LEqual
		ColorMask RGBA
		
		Blend [_SrcBlend] [_DstBlend]
		

		CGINCLUDE
		#pragma target 4.6

		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}

		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlane (float3 pos, float4 plane)
		{
			float d = dot (float4(pos,1.0f), plane);
			return d;
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlane(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlane(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlane(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlane(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		ENDCG

		
		Pass
		{
			
			Name "ForwardBase"
			Tags { "LightMode"="ForwardBase" }

			Blend [_SrcBlend] [_DstBlend]

			CGPROGRAM
			#define ASE_NEEDS_FRAG_SHADOWCOORDS
			#pragma multi_compile_instancing
			#pragma multi_compile __ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_TESSELLATION 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_DISTANCE_TESSELLATION
			#define _ALPHATEST_ON 1

			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_fwdbase
			#ifndef UNITY_PASS_FORWARDBASE
				#define UNITY_PASS_FORWARDBASE
			#endif
			#include "HLSLSupport.cginc"
			#ifndef UNITY_INSTANCED_LOD_FADE
				#define UNITY_INSTANCED_LOD_FADE
			#endif
			#ifndef UNITY_INSTANCED_SH
				#define UNITY_INSTANCED_SH
			#endif
			#ifndef UNITY_INSTANCED_LIGHTMAPSTS
				#define UNITY_INSTANCED_LIGHTMAPSTS
			#endif
			#include "UnityShaderVariables.cginc"
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			#include "AutoLight.cginc"

			#include "UnityStandardUtils.cginc"
			#define ASE_NEEDS_FRAG_SCREEN_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_POSITION
			#pragma shader_feature_local _TESSELLATION_ON
			#pragma shader_feature_local _SNOW_ON
			#pragma shader_feature_local _ENVIROREMOVALZONES_ON
			#pragma shader_feature_local _PUDDLES_ON
			#pragma shader_feature_local _RENDERING_CUTOUT _RENDERING_FADE _RENDERING_TRANSPARENT _RENDERING_OPAQUE
			#pragma shader_feature_local _DETAILPROCEDURALMASK_OFF _DETAILPROCEDURALMASK_MASK _DETAILPROCEDURALMASK_PROCEDURAL _DETAILPROCEDURALMASK_HEIGHT
			#pragma shader_feature_local _GLOBALDETAILNORMAL_ON
			#pragma shader_feature_local _RAIN_ON
			#pragma shader_feature_local _EMISSION_ON
			#include "EnviroInclude.hlsl"

			struct appdata {
				float4 vertex : POSITION;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct v2f {
				#if UNITY_VERSION >= 201810
					UNITY_POSITION(pos);
				#else
					float4 pos : SV_POSITION;
				#endif
				#if defined(LIGHTMAP_ON) || (!defined(LIGHTMAP_ON) && SHADER_TARGET >= 30)
					float4 lmap : TEXCOORD0;
				#endif
				#if !defined(LIGHTMAP_ON) && UNITY_SHOULD_SAMPLE_SH
					half3 sh : TEXCOORD1;
				#endif
				#if defined(UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS) && UNITY_VERSION >= 201810 && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					UNITY_LIGHTING_COORDS(2,3)
				#elif defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if UNITY_VERSION >= 201710
						UNITY_SHADOW_COORDS(2)
					#else
						SHADOW_COORDS(2)
					#endif
				#endif
				#ifdef ASE_FOG
					UNITY_FOG_COORDS(4)
				#endif
				float4 tSpace0 : TEXCOORD5;
				float4 tSpace1 : TEXCOORD6;
				float4 tSpace2 : TEXCOORD7;
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 screenPos : TEXCOORD8;
				#endif
				float4 ase_texcoord9 : TEXCOORD9;
				float4 ase_texcoord10 : TEXCOORD10;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			uniform int _SrcBlend;
			uniform int _DstBlend;
			uniform int _ZWrite;
			uniform int _CullMode;
			uniform float _TessellationFactor;
			uniform sampler2D _SnowMask;
			uniform float _SnowTiling;
			uniform float4 _TilingOffset;
			uniform float _SnowDisplacementStrength;
			uniform float _EnviroSnow;
			uniform sampler2D _BaseMask;
			uniform float _PuddleIntensity;
			uniform float _PuddleCoverageNoise;
			uniform float _EnviroWetness;
			uniform float _DisplacementStrength;
			uniform sampler2D _MainTex;
			uniform float4 _Color;
			uniform sampler2D _DetailAlbedoMap;
			uniform float4 _DetailTilingOffset;
			uniform float4 _DetailTint;
			uniform sampler2D _Mask;
			uniform float _DetailMaskTiling;
			uniform float _DetailHeightBlendStrength;
			uniform float _DetailProceduralMaskScale;
			uniform float _DetailProceduralMaskIntensity;
			uniform float _DetailThreshold;
			uniform float _DetailHeight;
			uniform sampler2D _BumpMap;
			uniform float _BumpScale;
			uniform float _DetailNormalInfluence;
			uniform float4 _PuddleColor;
			uniform sampler2D _SnowAlbedo;
			uniform sampler2D _DetailNormalMap;
			uniform float _DetailNormalMapScale;
			uniform sampler2D _GlobalNormal;
			uniform float2 _GlobalNormalTiling;
			uniform float _GlobalNormalIntensity;
			uniform sampler2D _SnowNormal;
			uniform float _SnowNormalScale;
			uniform float _SSSDistortion;
			uniform float _SSSScale;
			uniform float _SSSIntensity;
			uniform float _Opacity;
			uniform float _RainFlowStrength;
			uniform float _EnviroRainIntensity;
			uniform float _RainFlowTiling;
			uniform float _RainFlowDistortionScale;
			uniform float _RainFlowDistortionStrenght;
			uniform float _RainFlowIntensity;
			uniform float _RainDistanceFade;
			uniform float _RainDropTiling;
			uniform float _RainDropSpeed;
			uniform float _RainDropIntensity;
			uniform sampler2D _WaveNormal;
			uniform float _PuddleWaveTiling;
			uniform float _PuddleWaveIntensity;
			uniform sampler2D _EmissionMap;
			uniform float4 _EmissionColor;
			uniform float _MetallicBase;
			uniform sampler2D _DetailMask;
			uniform float _MetallicDetail;
			uniform float _Smoothness;
			uniform float _SmoothnessAdd;
			uniform float _SmoothnessDetail;
			uniform float _SmoothnessDetailAdd;
			uniform float _SmoothnessWet;
			uniform float _RainFlowSmoothnessBoost;
			uniform float _OcclusionStrength;
			uniform float _CutOff;


			//This is a late directive
			
			inline float EnviroZonesFunction( float density, float3 wpos )
			{
				return EnviroRemoveZones(wpos,density);
			}
			
			inline float noise_randomValue (float2 uv) { return frac(sin(dot(uv, float2(12.9898, 78.233)))*43758.5453); }
			inline float noise_interpolate (float a, float b, float t) { return (1.0-t)*a + (t*b); }
			inline float valueNoise (float2 uv)
			{
				float2 i = floor(uv);
				float2 f = frac( uv );
				f = f* f * (3.0 - 2.0 * f);
				uv = abs( frac(uv) - 0.5);
				float2 c0 = i + float2( 0.0, 0.0 );
				float2 c1 = i + float2( 1.0, 0.0 );
				float2 c2 = i + float2( 0.0, 1.0 );
				float2 c3 = i + float2( 1.0, 1.0 );
				float r0 = noise_randomValue( c0 );
				float r1 = noise_randomValue( c1 );
				float r2 = noise_randomValue( c2 );
				float r3 = noise_randomValue( c3 );
				float bottomOfGrid = noise_interpolate( r0, r1, f.x );
				float topOfGrid = noise_interpolate( r2, r3, f.x );
				float t = noise_interpolate( bottomOfGrid, topOfGrid, f.y );
				return t;
			}
			
			float SimpleNoise(float2 UV)
			{
				float t = 0.0;
				float freq = pow( 2.0, float( 0 ) );
				float amp = pow( 0.5, float( 3 - 0 ) );
				t += valueNoise( UV/freq )*amp;
				freq = pow(2.0, float(1));
				amp = pow(0.5, float(3-1));
				t += valueNoise( UV/freq )*amp;
				freq = pow(2.0, float(2));
				amp = pow(0.5, float(3-2));
				t += valueNoise( UV/freq )*amp;
				return t;
			}
			
			inline float3 TriplanarSampling720( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = tex2D( topTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) );
				yNorm = tex2D( topTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) );
				zNorm = tex2D( topTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) );
				xNorm.xyz  = half3( UnpackScaleNormal( xNorm, normalScale.y ).xy * float2(  nsign.x, 1.0 ) + worldNormal.zy, worldNormal.x ).zyx;
				yNorm.xyz  = half3( UnpackScaleNormal( yNorm, normalScale.x ).xy * float2(  nsign.y, 1.0 ) + worldNormal.xz, worldNormal.y ).xzy;
				zNorm.xyz  = half3( UnpackScaleNormal( zNorm, normalScale.y ).xy * float2( -nsign.z, 1.0 ) + worldNormal.xy, worldNormal.z ).xyz;
				return normalize( xNorm.xyz * projNormal.x + yNorm.xyz * projNormal.y + zNorm.xyz * projNormal.z );
			}
			
			float2 UnityGradientNoiseDir( float2 p )
			{
				p = fmod(p , 289);
				float x = fmod((34 * p.x + 1) * p.x , 289) + p.y;
				x = fmod( (34 * x + 1) * x , 289);
				x = frac( x / 41 ) * 2 - 1;
				return normalize( float2(x - floor(x + 0.5 ), abs( x ) - 0.5 ) );
			}
			
			float UnityGradientNoise( float2 UV, float Scale )
			{
				float2 p = UV * Scale;
				float2 ip = floor( p );
				float2 fp = frac( p );
				float d00 = dot( UnityGradientNoiseDir( ip ), fp );
				float d01 = dot( UnityGradientNoiseDir( ip + float2( 0, 1 ) ), fp - float2( 0, 1 ) );
				float d10 = dot( UnityGradientNoiseDir( ip + float2( 1, 0 ) ), fp - float2( 1, 0 ) );
				float d11 = dot( UnityGradientNoiseDir( ip + float2( 1, 1 ) ), fp - float2( 1, 1 ) );
				fp = fp * fp * fp * ( fp * ( fp * 6 - 15 ) + 10 );
				return lerp( lerp( d00, d01, fp.y ), lerp( d10, d11, fp.y ), fp.x ) + 0.5;
			}
			
			float3 PerturbNormal107_g55( float3 surf_pos, float3 surf_norm, float height, float scale )
			{
				// "Bump Mapping Unparametrized Surfaces on the GPU" by Morten S. Mikkelsen
				float3 vSigmaS = ddx( surf_pos );
				float3 vSigmaT = ddy( surf_pos );
				float3 vN = surf_norm;
				float3 vR1 = cross( vSigmaT , vN );
				float3 vR2 = cross( vN , vSigmaS );
				float fDet = dot( vSigmaS , vR1 );
				float dBs = ddx( height );
				float dBt = ddy( height );
				float3 vSurfGrad = scale * 0.05 * sign( fDet ) * ( dBs * vR1 + dBt * vR2 );
				return normalize ( abs( fDet ) * vN - vSurfGrad );
			}
			

			v2f VertexFunction (appdata v  ) {
				UNITY_SETUP_INSTANCE_ID(v);
				v2f o;
				UNITY_INITIALIZE_OUTPUT(v2f,o);
				UNITY_TRANSFER_INSTANCE_ID(v,o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float2 temp_cast_0 = (_SnowTiling).xx;
				float2 appendResult286 = (float2(_TilingOffset.x , _TilingOffset.y));
				float2 appendResult287 = (float2(_TilingOffset.z , _TilingOffset.w));
				float2 texCoord44 = v.ase_texcoord.xy * appendResult286 + appendResult287;
				float2 Global_UV170 = texCoord44;
				float2 texCoord1385 = v.ase_texcoord.xy * temp_cast_0 + Global_UV170;
				float4 tex2DNode1387 = tex2Dlod( _SnowMask, float4( texCoord1385, 0, 0.0) );
				float Height_Snow234 = tex2DNode1387.b;
				float3 ase_worldNormal = UnityObjectToWorldNormal(v.normal);
				float density5_g5 = 0.0;
				float3 ase_worldPos = mul(unity_ObjectToWorld, float4( (v.vertex).xyz, 1 )).xyz;
				float3 wpos5_g5 = ase_worldPos;
				float localEnviroZonesFunction5_g5 = EnviroZonesFunction( density5_g5 , wpos5_g5 );
				float RemovalZoneMask1467 = localEnviroZonesFunction5_g5;
				#ifdef _ENVIROREMOVALZONES_ON
				float staticSwitch1456 = ( saturate( ( RemovalZoneMask1467 + _EnviroSnow ) ) * 2.0 );
				#else
				float staticSwitch1456 = ( _EnviroSnow * 2.0 );
				#endif
				float Snow_Amount199 = staticSwitch1456;
				#ifdef _SNOW_ON
				float3 staticSwitch1257 = ( saturate( ( ( Height_Snow234 + 0.5 ) * _SnowDisplacementStrength ) ) * ( v.normal * saturate( ( ( ase_worldNormal.y - 0.3 ) * Snow_Amount199 ) ) ) );
				#else
				float3 staticSwitch1257 = float3(0,0,0);
				#endif
				float3 Snow_Displacement707 = staticSwitch1257;
				float4 tex2DNode22 = tex2Dlod( _BaseMask, float4( Global_UV170, 0, 1.0) );
				float HEIGHT305 = tex2DNode22.b;
				float3 ase_worldTangent = UnityObjectToWorldDir(v.tangent);
				float ase_vertexTangentSign = v.tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 ase_worldViewDir = UnityWorldSpaceViewDir(ase_worldPos);
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float ase_faceVertex = (dot(ase_tanViewDir,float3(0,0,1)));
				float4 appendResult935 = (float4(ase_worldPos.x , ase_worldPos.z , 0.0 , 0.0));
				float simpleNoise921 = SimpleNoise( appendResult935.xy*_PuddleCoverageNoise );
				simpleNoise921 = simpleNoise921*2 - 1;
				#ifdef _ENVIROREMOVALZONES_ON
				float staticSwitch1464 = saturate( ( RemovalZoneMask1467 + _EnviroWetness ) );
				#else
				float staticSwitch1464 = _EnviroWetness;
				#endif
				float Wetness163 = staticSwitch1464;
				float switchResult1401 = (((ase_faceVertex>0)?(saturate( ( ( ( ase_worldNormal.y - 0.9 ) * ( ( saturate( ( _PuddleIntensity * simpleNoise921 ) ) * saturate( ( 2.0 - Snow_Amount199 ) ) ) * Wetness163 ) ) * 8.0 ) )):(0.0)));
				#ifdef _PUDDLES_ON
				float staticSwitch996 = switchResult1401;
				#else
				float staticSwitch996 = 0.0;
				#endif
				float Puddle_Mask584 = staticSwitch996;
				#ifdef _TESSELLATION_ON
				float3 staticSwitch1362 = ( Snow_Displacement707 + ( v.normal * ( ( HEIGHT305 * ( 1.0 - Puddle_Mask584 ) ) * _DisplacementStrength ) ) );
				#else
				float3 staticSwitch1362 = float3(0,0,0);
				#endif
				
				o.ase_texcoord9.xy = v.ase_texcoord.xy;
				o.ase_texcoord10 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord9.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = staticSwitch1362;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.vertex.w = 1;
				v.normal = v.normal;
				v.tangent = v.tangent;

				o.pos = UnityObjectToClipPos(v.vertex);
				float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				fixed3 worldNormal = UnityObjectToWorldNormal(v.normal);
				fixed3 worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
				fixed tangentSign = v.tangent.w * unity_WorldTransformParams.w;
				fixed3 worldBinormal = cross(worldNormal, worldTangent) * tangentSign;
				o.tSpace0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x);
				o.tSpace1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y);
				o.tSpace2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z);

				#ifdef DYNAMICLIGHTMAP_ON
				o.lmap.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif
				#ifdef LIGHTMAP_ON
				o.lmap.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				#ifndef LIGHTMAP_ON
					#if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
						o.sh = 0;
						#ifdef VERTEXLIGHT_ON
						o.sh += Shade4PointLights (
							unity_4LightPosX0, unity_4LightPosY0, unity_4LightPosZ0,
							unity_LightColor[0].rgb, unity_LightColor[1].rgb, unity_LightColor[2].rgb, unity_LightColor[3].rgb,
							unity_4LightAtten0, worldPos, worldNormal);
						#endif
						o.sh = ShadeSHPerVertex (worldNormal, o.sh);
					#endif
				#endif

				#if UNITY_VERSION >= 201810 && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					UNITY_TRANSFER_LIGHTING(o, v.texcoord1.xy);
				#elif defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if UNITY_VERSION >= 201710
						UNITY_TRANSFER_SHADOW(o, v.texcoord1.xy);
					#else
						TRANSFER_SHADOW(o);
					#endif
				#endif

				#ifdef ASE_FOG
					UNITY_TRANSFER_FOG(o,o.pos);
				#endif
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
					o.screenPos = ComputeScreenPos(o.pos);
				#endif
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( appdata v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.tangent = v.tangent;
				o.normal = v.normal;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessellationFactor; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, UNITY_MATRIX_M, _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			v2f DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				appdata o = (appdata) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.tangent = patch[0].tangent * bary.x + patch[1].tangent * bary.y + patch[2].tangent * bary.z;
				o.normal = patch[0].normal * bary.x + patch[1].normal * bary.y + patch[2].normal * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].normal * (dot(o.vertex.xyz, patch[i].normal) - dot(patch[i].vertex.xyz, patch[i].normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			v2f vert ( appdata v )
			{
				return VertexFunction( v );
			}
			#endif

			fixed4 frag (v2f IN , bool ase_vface : SV_IsFrontFace
				#ifdef _DEPTHOFFSET_ON
				, out float outputDepth : SV_Depth
				#endif
				) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(IN);

				#ifdef LOD_FADE_CROSSFADE
					UNITY_APPLY_DITHER_CROSSFADE(IN.pos.xy);
				#endif

				#if defined(_SPECULAR_SETUP)
					SurfaceOutputStandardSpecular o = (SurfaceOutputStandardSpecular)0;
				#else
					SurfaceOutputStandard o = (SurfaceOutputStandard)0;
				#endif
				float3 WorldTangent = float3(IN.tSpace0.x,IN.tSpace1.x,IN.tSpace2.x);
				float3 WorldBiTangent = float3(IN.tSpace0.y,IN.tSpace1.y,IN.tSpace2.y);
				float3 WorldNormal = float3(IN.tSpace0.z,IN.tSpace1.z,IN.tSpace2.z);
				float3 worldPos = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 worldViewDir = normalize(UnityWorldSpaceViewDir(worldPos));
				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					UNITY_LIGHT_ATTENUATION(atten, IN, worldPos)
				#else
					half atten = 1;
				#endif
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 ScreenPos = IN.screenPos;
				#endif

				float2 appendResult286 = (float2(_TilingOffset.x , _TilingOffset.y));
				float2 appendResult287 = (float2(_TilingOffset.z , _TilingOffset.w));
				float2 texCoord44 = IN.ase_texcoord9.xy * appendResult286 + appendResult287;
				float2 Global_UV170 = texCoord44;
				float2 Parallax_UV178 = Global_UV170;
				float4 tex2DNode17 = tex2D( _MainTex, Parallax_UV178 );
				float4 Albedo_Base195 = tex2DNode17;
				float2 appendResult261 = (float2(_DetailTilingOffset.x , _DetailTilingOffset.y));
				float2 appendResult262 = (float2(_DetailTilingOffset.z , _DetailTilingOffset.w));
				float2 texCoord257 = IN.ase_texcoord9.xy * appendResult261 + appendResult262;
				float4 Detail_Albedo248 = tex2D( _DetailAlbedoMap, texCoord257 );
				float4 tex2DNode22 = tex2D( _BaseMask, Global_UV170 );
				float HEIGHT305 = tex2DNode22.b;
				float2 appendResult256 = (float2(_DetailMaskTiling , _DetailMaskTiling));
				float2 texCoord254 = IN.ase_texcoord9.xy * appendResult256 + float2( 0,0 );
				float HeightMask1341 = saturate(pow(max( (((HEIGHT305*tex2D( _Mask, texCoord254 ).r)*4)+(tex2D( _Mask, texCoord254 ).r*2)), 0 ),_DetailHeightBlendStrength));
				float simpleNoise1239 = SimpleNoise( texCoord254*_DetailProceduralMaskScale );
				simpleNoise1239 = simpleNoise1239*2 - 1;
				float HeightMask1249 = saturate(pow(max( (((HEIGHT305*saturate( ( simpleNoise1239 * _DetailProceduralMaskIntensity ) ))*4)+(saturate( ( simpleNoise1239 * _DetailProceduralMaskIntensity ) )*2)), 0 ),_DetailHeightBlendStrength));
				float4 transform1329 = mul(unity_ObjectToWorld,float4( IN.ase_texcoord10.xyz , 0.0 ));
				float smoothstepResult1323 = smoothstep( ( _DetailHeight - 1.0 ) , ( _DetailHeight + 1.0 ) , transform1329.y);
				float4 appendResult935 = (float4(worldPos.x , worldPos.z , 0.0 , 0.0));
				float simpleNoise921 = SimpleNoise( appendResult935.xy*_PuddleCoverageNoise );
				simpleNoise921 = simpleNoise921*2 - 1;
				float density5_g5 = 0.0;
				float3 wpos5_g5 = worldPos;
				float localEnviroZonesFunction5_g5 = EnviroZonesFunction( density5_g5 , wpos5_g5 );
				float RemovalZoneMask1467 = localEnviroZonesFunction5_g5;
				#ifdef _ENVIROREMOVALZONES_ON
				float staticSwitch1456 = ( saturate( ( RemovalZoneMask1467 + _EnviroSnow ) ) * 2.0 );
				#else
				float staticSwitch1456 = ( _EnviroSnow * 2.0 );
				#endif
				float Snow_Amount199 = staticSwitch1456;
				#ifdef _ENVIROREMOVALZONES_ON
				float staticSwitch1464 = saturate( ( RemovalZoneMask1467 + _EnviroWetness ) );
				#else
				float staticSwitch1464 = _EnviroWetness;
				#endif
				float Wetness163 = staticSwitch1464;
				float switchResult1401 = (((ase_vface>0)?(saturate( ( ( ( WorldNormal.y - 0.9 ) * ( ( saturate( ( _PuddleIntensity * simpleNoise921 ) ) * saturate( ( 2.0 - Snow_Amount199 ) ) ) * Wetness163 ) ) * 8.0 ) )):(0.0)));
				#ifdef _PUDDLES_ON
				float staticSwitch996 = switchResult1401;
				#else
				float staticSwitch996 = 0.0;
				#endif
				float Puddle_Mask584 = staticSwitch996;
				#ifdef _PUDDLES_ON
				float staticSwitch659 = saturate( ( _BumpScale - Puddle_Mask584 ) );
				#else
				float staticSwitch659 = _BumpScale;
				#endif
				float3 Normal_Base209 = UnpackScaleNormal( tex2D( _BumpMap, Parallax_UV178 ), staticSwitch659 );
				float3x3 ase_tangentToWorldFast = float3x3(WorldTangent.x,WorldBiTangent.x,WorldNormal.x,WorldTangent.y,WorldBiTangent.y,WorldNormal.y,WorldTangent.z,WorldBiTangent.z,WorldNormal.z);
				float3 tangentToWorldDir1332 = mul( ase_tangentToWorldFast, Normal_Base209 );
				float lerpResult1436 = lerp( 1.0 , tangentToWorldDir1332.y , _DetailNormalInfluence);
				float smoothstepResult1335 = smoothstep( 0.0 , ( 1.0 - _DetailThreshold ) , ( smoothstepResult1323 * lerpResult1436 ));
				float HeightMask1342 = saturate(pow(max( (((HEIGHT305*smoothstepResult1335)*4)+(smoothstepResult1335*2)), 0 ),_DetailHeightBlendStrength));
				#if defined( _DETAILPROCEDURALMASK_OFF )
				float staticSwitch1238 = 0.0;
				#elif defined( _DETAILPROCEDURALMASK_MASK )
				float staticSwitch1238 = HeightMask1341;
				#elif defined( _DETAILPROCEDURALMASK_PROCEDURAL )
				float staticSwitch1238 = HeightMask1249;
				#elif defined( _DETAILPROCEDURALMASK_HEIGHT )
				float staticSwitch1238 = HeightMask1342;
				#else
				float staticSwitch1238 = 0.0;
				#endif
				float Mask253 = saturate( staticSwitch1238 );
				float HeightMask264 = saturate(pow(((HEIGHT305*Mask253)*4)+(Mask253*2),1.0));
				float Detail_Blending277 = HeightMask264;
				float4 lerpResult265 = lerp( ( Albedo_Base195 * _Color ) , ( Detail_Albedo248 * _DetailTint ) , Detail_Blending277);
				float4 lerpResult964 = lerp( float4( 1,1,1,0 ) , _PuddleColor , Puddle_Mask584);
				#ifdef _PUDDLES_ON
				float4 staticSwitch959 = ( lerpResult265 * lerpResult964 );
				#else
				float4 staticSwitch959 = lerpResult265;
				#endif
				float2 temp_cast_2 = (_SnowTiling).xx;
				float2 texCoord1385 = IN.ase_texcoord9.xy * temp_cast_2 + Global_UV170;
				float4 Albedo_Snow198 = tex2D( _SnowAlbedo, texCoord1385 );
				float3 worldSpaceLightDir = UnityWorldSpaceLightDir(worldPos);
				float3 Detail_Normal249 = UnpackScaleNormal( tex2D( _DetailNormalMap, texCoord257 ), _DetailNormalMapScale );
				float3 lerpResult283 = lerp( Normal_Base209 , Detail_Normal249 , Detail_Blending277);
				float3x3 ase_worldToTangent = float3x3(WorldTangent,WorldBiTangent,WorldNormal);
				#ifdef _PUDDLES_ON
				float staticSwitch766 = saturate( ( _GlobalNormalIntensity - Puddle_Mask584 ) );
				#else
				float staticSwitch766 = _GlobalNormalIntensity;
				#endif
				float3 triplanar720 = TriplanarSampling720( _GlobalNormal, worldPos, WorldNormal, 1.0, _GlobalNormalTiling, staticSwitch766, 0 );
				float3 tanTriplanarNormal720 = mul( ase_worldToTangent, triplanar720 );
				float3 Global_Normal688 = tanTriplanarNormal720;
				#ifdef _GLOBALDETAILNORMAL_ON
				float3 staticSwitch1431 = BlendNormals( lerpResult283 , Global_Normal688 );
				#else
				float3 staticSwitch1431 = lerpResult283;
				#endif
				float3 Normal_Snow211 = UnpackScaleNormal( tex2D( _SnowNormal, texCoord1385 ), _SnowNormalScale );
				float switchResult1311 = (((ase_vface>0)?(( WorldNormal.y * Snow_Amount199 )):(0.0)));
				float temp_output_10_0 = saturate( switchResult1311 );
				float3 lerpResult11 = lerp( staticSwitch1431 , Normal_Snow211 , temp_output_10_0);
				#ifdef _SNOW_ON
				float3 staticSwitch1261 = lerpResult11;
				#else
				float3 staticSwitch1261 = staticSwitch1431;
				#endif
				float3 Normal_Combined213 = staticSwitch1261;
				float3 tangentToWorldDir1209 = mul( ase_tangentToWorldFast, Normal_Combined213 );
				float dotResult72 = dot( worldViewDir , -( worldSpaceLightDir + ( tangentToWorldDir1209 * _SSSDistortion ) ) );
				float dotResult82 = dot( dotResult72 , _SSSScale );
				float SSS184 = ( saturate( dotResult82 ) * _SSSIntensity );
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal12 = Normal_Combined213;
				float3 worldNormal12 = float3(dot(tanToWorld0,tanNormal12), dot(tanToWorld1,tanNormal12), dot(tanToWorld2,tanNormal12));
				float switchResult1310 = (((ase_vface>0)?(saturate( ( worldNormal12.y * Snow_Amount199 ) )):(0.0)));
				#ifdef _SNOW_ON
				float staticSwitch1259 = switchResult1310;
				#else
				float staticSwitch1259 = 0.0;
				#endif
				float Snow_Blend_Normal205 = staticSwitch1259;
				float4 lerpResult16 = lerp( staticSwitch959 , ( Albedo_Snow198 + SSS184 ) , Snow_Blend_Normal205);
				#ifdef _SNOW_ON
				float4 staticSwitch1253 = lerpResult16;
				#else
				float4 staticSwitch1253 = staticSwitch959;
				#endif
				float4 temp_output_40_0 = ( staticSwitch1253 + (0.0 + (Wetness163 - 0.0) * (-0.01 - 0.0) / (1.0 - 0.0)) );
				float Opacity1274 = tex2DNode17.a;
				float TintAlpha1273 = _Color.a;
				float temp_output_1277_0 = ( Opacity1274 * TintAlpha1273 );
				#ifdef _SNOW_ON
				float staticSwitch1294 = ( temp_output_1277_0 + ( Snow_Blend_Normal205 * 2.0 ) );
				#else
				float staticSwitch1294 = temp_output_1277_0;
				#endif
				#if defined( _RENDERING_CUTOUT )
				float staticSwitch1478 = temp_output_1277_0;
				#elif defined( _RENDERING_FADE )
				float staticSwitch1478 = staticSwitch1294;
				#elif defined( _RENDERING_TRANSPARENT )
				float staticSwitch1478 = staticSwitch1294;
				#elif defined( _RENDERING_OPAQUE )
				float staticSwitch1478 = staticSwitch1294;
				#else
				float staticSwitch1478 = staticSwitch1294;
				#endif
				float BaseAlpha1283 = saturate( ( staticSwitch1478 + _Opacity ) );
				#if defined( _RENDERING_CUTOUT )
				float4 staticSwitch1284 = temp_output_40_0;
				#elif defined( _RENDERING_FADE )
				float4 staticSwitch1284 = temp_output_40_0;
				#elif defined( _RENDERING_TRANSPARENT )
				float4 staticSwitch1284 = ( temp_output_40_0 * BaseAlpha1283 );
				#elif defined( _RENDERING_OPAQUE )
				float4 staticSwitch1284 = temp_output_40_0;
				#else
				float4 staticSwitch1284 = temp_output_40_0;
				#endif
				float4 Albedo_Final224 = staticSwitch1284;
				
				float3 surf_pos107_g55 = worldPos;
				float3 surf_norm107_g55 = WorldNormal;
				#ifdef _ENVIROREMOVALZONES_ON
				float staticSwitch1468 = saturate( ( RemovalZoneMask1467 + _EnviroRainIntensity ) );
				#else
				float staticSwitch1468 = _EnviroRainIntensity;
				#endif
				float RainIntensity233 = staticSwitch1468;
				float temp_output_1156_0 = (1.0 + (( _RainFlowStrength * RainIntensity233 ) - 0.0) * (-1.0 - 1.0) / (1.0 - 0.0));
				float temp_output_1039_0 = ( _Time.y * 0.05 );
				float4 transform1024 = mul(unity_ObjectToWorld,float4( IN.ase_texcoord10.xyz , 0.0 ));
				float2 appendResult1027 = (float2(( transform1024.z * 0.7 ) , ( transform1024.y * 0.2 )));
				float2 panner1030 = ( temp_output_1039_0 * float2( 0,1 ) + ( appendResult1027 * _RainFlowTiling ));
				float2 texCoord649 = IN.ase_texcoord9.xy * float2( 10,10 ) + float2( 0,0 );
				float gradientNoise650 = UnityGradientNoise(texCoord649,_RainFlowDistortionScale);
				gradientNoise650 = gradientNoise650*0.5 + 0.5;
				float Distortion655 = ( gradientNoise650 * _RainFlowDistortionStrenght );
				float simpleNoise1021 = SimpleNoise( ( panner1030 + Distortion655 )*100.0 );
				simpleNoise1021 = simpleNoise1021*2 - 1;
				float smoothstepResult1071 = smoothstep( temp_output_1156_0 , 1.0 , simpleNoise1021);
				float temp_output_1047_0 = ( ( ( WorldNormal.y - 0.7 ) * -1.0 ) * _RainFlowIntensity );
				float3 temp_cast_5 = (0.3).xxx;
				float3 break1080 = ( abs( WorldNormal ) - temp_cast_5 );
				float lerpResult1081 = lerp( 0.0 , ( smoothstepResult1071 * temp_output_1047_0 ) , break1080.x);
				float4 transform1025 = mul(unity_ObjectToWorld,float4( IN.ase_texcoord10.xyz , 0.0 ));
				float2 appendResult1026 = (float2(( transform1025.x * 0.7 ) , ( transform1025.y * 0.2 )));
				float2 panner1031 = ( temp_output_1039_0 * float2( 0,1 ) + ( appendResult1026 * _RainFlowTiling ));
				float simpleNoise1028 = SimpleNoise( ( panner1031 + Distortion655 )*100.0 );
				simpleNoise1028 = simpleNoise1028*2 - 1;
				float smoothstepResult1070 = smoothstep( temp_output_1156_0 , 1.0 , simpleNoise1028);
				float lerpResult1082 = lerp( 0.0 , ( smoothstepResult1070 * temp_output_1047_0 ) , break1080.z);
				float Rain_Distance_Fade1154 = ( 1.0 - sqrt( saturate( ( distance( worldPos , _WorldSpaceCameraPos ) / _RainDistanceFade ) ) ) );
				float switchResult1400 = (((ase_vface>0)?(( ( lerpResult1081 + lerpResult1082 ) * Rain_Distance_Fade1154 )):(0.0)));
				float temp_output_1075_0 = saturate( switchResult1400 );
				float height107_g55 = temp_output_1075_0;
				float scale107_g55 = 0.1;
				float3 localPerturbNormal107_g55 = PerturbNormal107_g55( surf_pos107_g55 , surf_norm107_g55 , height107_g55 , scale107_g55 );
				float3 worldToTangentDir42_g55 = mul( ase_worldToTangent, localPerturbNormal107_g55);
				float3 RainFlow411 = worldToTangentDir42_g55;
				float localRainRipples1_g54 = ( 0.0 );
				float4 transform1427 = mul(unity_ObjectToWorld,float4( IN.ase_texcoord10.xyz , 0.0 ));
				float2 appendResult1422 = (float2(transform1427.x , transform1427.z));
				float2 UV1_g54 = ( appendResult1422 * _RainDropTiling );
				float AngleOffset1_g54 = 5.0;
				float lerpResult1419 = lerp( 64.0 , 12.0 , Puddle_Mask584);
				float CellDensity1_g54 = round( lerpResult1419 );
				float Time1_g54 = ( _Time.y * _RainDropSpeed );
				float temp_output_1128_0 = ( _RainDropIntensity * 1.5 );
				float lerpResult1126 = lerp( _RainDropIntensity , temp_output_1128_0 , Puddle_Mask584);
				#ifdef _PUDDLES_ON
				float staticSwitch1129 = lerpResult1126;
				#else
				float staticSwitch1129 = temp_output_1128_0;
				#endif
				float switchResult1402 = (((ase_vface>0)?(( ( ( WorldNormal.y - 0.8 ) * ( staticSwitch1129 * RainIntensity233 ) ) * Rain_Distance_Fade1154 )):(0.0)));
				float Strength1_g54 = max( 0.0 , switchResult1402 );
				float3 normal1_g54 = float3( 0,0,0 );
				float Out1_g54 = 0.0;
				float lerpResult1002 = lerp( 5.0 , 8.0 , Puddle_Mask584);
				float pow1_g54 = lerpResult1002;
				float lerpResult1004 = lerp( 1.0 , 0.0 , Puddle_Mask584);
				float sin1_g54 = lerpResult1004;
				{
				Rain(UV1_g54,AngleOffset1_g54,CellDensity1_g54,Time1_g54,Strength1_g54,pow1_g54,sin1_g54,Out1_g54,normal1_g54);
				}
				float3 temp_output_1392_9 = normal1_g54;
				float3 Rain_Drop341 = temp_output_1392_9;
				#ifdef _RAIN_ON
				float3 staticSwitch639 = BlendNormals( Normal_Combined213 , BlendNormals( RainFlow411 , Rain_Drop341 ) );
				#else
				float3 staticSwitch639 = Normal_Combined213;
				#endif
				float temp_output_729_0 = ( _Time.y * 0.05 );
				float2 appendResult1414 = (float2(worldPos.x , worldPos.z));
				float2 temp_output_1415_0 = ( appendResult1414 * _PuddleWaveTiling );
				float2 panner734 = ( temp_output_729_0 * float2( 1,0 ) + temp_output_1415_0);
				float temp_output_735_0 = ( Puddle_Mask584 * ( _PuddleWaveIntensity * Wetness163 ) );
				float2 panner736 = ( temp_output_729_0 * float2( 0,1 ) + temp_output_1415_0);
				float3 Puddle740 = BlendNormals( UnpackScaleNormal( tex2D( _WaveNormal, panner734 ), temp_output_735_0 ) , UnpackScaleNormal( tex2D( _WaveNormal, panner736 ), temp_output_735_0 ) );
				#ifdef _PUDDLES_ON
				float3 staticSwitch628 = BlendNormals( staticSwitch639 , Puddle740 );
				#else
				float3 staticSwitch628 = staticSwitch639;
				#endif
				float3 Normals_Final216 = staticSwitch628;
				
				#ifdef _EMISSION_ON
				float4 staticSwitch1432 = ( tex2D( _EmissionMap, Parallax_UV178 ) * _EmissionColor );
				#else
				float4 staticSwitch1432 = float4(0,0,0,0);
				#endif
				float4 Emission_Final678 = staticSwitch1432;
				
				float Metallic_Base187 = tex2DNode22.r;
				float4 tex2DNode1211 = tex2D( _DetailMask, texCoord257 );
				float Detail_Metallic1212 = tex2DNode1211.r;
				float lerpResult1231 = lerp( saturate( ( Metallic_Base187 + _MetallicBase ) ) , saturate( ( Detail_Metallic1212 + _MetallicDetail ) ) , Mask253);
				float4 tex2DNode1387 = tex2D( _SnowMask, texCoord1385 );
				float Metallic_Snow189 = tex2DNode1387.r;
				float lerpResult15 = lerp( lerpResult1231 , Metallic_Snow189 , Snow_Blend_Normal205);
				#ifdef _SNOW_ON
				float staticSwitch1254 = lerpResult15;
				#else
				float staticSwitch1254 = lerpResult1231;
				#endif
				float Metallic_Final218 = staticSwitch1254;
				
				float Smoothness663 = tex2DNode22.a;
				float Smothness_Detail665 = tex2DNode1211.a;
				float lerpResult671 = lerp( ( ( Smoothness663 * _Smoothness ) + _SmoothnessAdd ) , ( ( Smothness_Detail665 * _SmoothnessDetail ) + _SmoothnessDetailAdd ) , Mask253);
				float lerpResult37 = lerp( 0.0 , _SmoothnessWet , Wetness163);
				#ifdef _PUDDLES_ON
				float staticSwitch629 = ( lerpResult37 + saturate( ( Puddle_Mask584 - 0.2 ) ) );
				#else
				float staticSwitch629 = lerpResult37;
				#endif
				float RainDropSmoothness870 = ( Out1_g54 * 0.25 );
				float RainFlowSmoothness1087 = ( temp_output_1075_0 * _RainFlowSmoothnessBoost );
				#ifdef _RAIN_ON
				float staticSwitch944 = ( ( staticSwitch629 + RainDropSmoothness870 ) + RainFlowSmoothness1087 );
				#else
				float staticSwitch944 = staticSwitch629;
				#endif
				float temp_output_674_0 = ( lerpResult671 + staticSwitch944 );
				float Smothness_Snow664 = tex2DNode1387.a;
				float lerpResult668 = lerp( temp_output_674_0 , Smothness_Snow664 , Snow_Blend_Normal205);
				#ifdef _SNOW_ON
				float staticSwitch1256 = lerpResult668;
				#else
				float staticSwitch1256 = temp_output_674_0;
				#endif
				float Smoothness_Final220 = saturate( staticSwitch1256 );
				
				float Occlusion_Base193 = tex2DNode22.g;
				float Detail_Occlusion1213 = tex2DNode1211.g;
				float lerpResult1236 = lerp( Occlusion_Base193 , Detail_Occlusion1213 , Mask253);
				float Occlusion_Snow191 = tex2DNode1387.g;
				float lerpResult27 = lerp( lerpResult1236 , Occlusion_Snow191 , Snow_Blend_Normal205);
				#ifdef _SNOW_ON
				float staticSwitch1255 = lerpResult27;
				#else
				float staticSwitch1255 = lerpResult1236;
				#endif
				float lerpResult969 = lerp( 1.0 , staticSwitch1255 , _OcclusionStrength);
				#ifdef _PUDDLES_ON
				float staticSwitch970 = saturate( ( lerpResult969 + Puddle_Mask584 ) );
				#else
				float staticSwitch970 = lerpResult969;
				#endif
				float Occlusion_Final222 = staticSwitch970;
				
				#if defined( _RENDERING_CUTOUT )
				float staticSwitch1279 = BaseAlpha1283;
				#elif defined( _RENDERING_FADE )
				float staticSwitch1279 = BaseAlpha1283;
				#elif defined( _RENDERING_TRANSPARENT )
				float staticSwitch1279 = BaseAlpha1283;
				#elif defined( _RENDERING_OPAQUE )
				float staticSwitch1279 = 1.0;
				#else
				float staticSwitch1279 = 1.0;
				#endif
				float OpacityFinal1278 = staticSwitch1279;
				
				#if defined( _RENDERING_CUTOUT )
				float staticSwitch1288 = _CutOff;
				#elif defined( _RENDERING_FADE )
				float staticSwitch1288 = 0.0;
				#elif defined( _RENDERING_TRANSPARENT )
				float staticSwitch1288 = 0.0;
				#elif defined( _RENDERING_OPAQUE )
				float staticSwitch1288 = 0.0;
				#else
				float staticSwitch1288 = 0.0;
				#endif
				float OpacityMaskFinal1289 = staticSwitch1288;
				
				o.Albedo = Albedo_Final224.rgb;
				o.Normal = Normals_Final216;
				o.Emission = Emission_Final678.xyz;
				#if defined(_SPECULAR_SETUP)
					o.Specular = fixed3( 0, 0, 0 );
				#else
					o.Metallic = Metallic_Final218;
				#endif
				o.Smoothness = Smoothness_Final220;
				o.Occlusion = Occlusion_Final222;
				o.Alpha = OpacityFinal1278;
				float AlphaClipThreshold = OpacityMaskFinal1289;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;

				#ifdef _ALPHATEST_ON
					clip( o.Alpha - AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
					outputDepth = IN.pos.z;
				#endif

				#ifndef USING_DIRECTIONAL_LIGHT
					fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
				#else
					fixed3 lightDir = _WorldSpaceLightPos0.xyz;
				#endif

				fixed4 c = 0;
				float3 worldN;
				worldN.x = dot(IN.tSpace0.xyz, o.Normal);
				worldN.y = dot(IN.tSpace1.xyz, o.Normal);
				worldN.z = dot(IN.tSpace2.xyz, o.Normal);
				worldN = normalize(worldN);
				o.Normal = worldN;

				UnityGI gi;
				UNITY_INITIALIZE_OUTPUT(UnityGI, gi);
				gi.indirect.diffuse = 0;
				gi.indirect.specular = 0;
				gi.light.color = _LightColor0.rgb;
				gi.light.dir = lightDir;

				UnityGIInput giInput;
				UNITY_INITIALIZE_OUTPUT(UnityGIInput, giInput);
				giInput.light = gi.light;
				giInput.worldPos = worldPos;
				giInput.worldViewDir = worldViewDir;
				giInput.atten = atten;
				#if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
					giInput.lightmapUV = IN.lmap;
				#else
					giInput.lightmapUV = 0.0;
				#endif
				#if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
					giInput.ambient = IN.sh;
				#else
					giInput.ambient.rgb = 0.0;
				#endif
				giInput.probeHDR[0] = unity_SpecCube0_HDR;
				giInput.probeHDR[1] = unity_SpecCube1_HDR;
				#if defined(UNITY_SPECCUBE_BLENDING) || defined(UNITY_SPECCUBE_BOX_PROJECTION)
					giInput.boxMin[0] = unity_SpecCube0_BoxMin;
				#endif
				#ifdef UNITY_SPECCUBE_BOX_PROJECTION
					giInput.boxMax[0] = unity_SpecCube0_BoxMax;
					giInput.probePosition[0] = unity_SpecCube0_ProbePosition;
					giInput.boxMax[1] = unity_SpecCube1_BoxMax;
					giInput.boxMin[1] = unity_SpecCube1_BoxMin;
					giInput.probePosition[1] = unity_SpecCube1_ProbePosition;
				#endif

				#if defined(_SPECULAR_SETUP)
					LightingStandardSpecular_GI(o, giInput, gi);
				#else
					LightingStandard_GI( o, giInput, gi );
				#endif

				#ifdef ASE_BAKEDGI
					gi.indirect.diffuse = BakedGI;
				#endif

				#if UNITY_SHOULD_SAMPLE_SH && !defined(LIGHTMAP_ON) && defined(ASE_NO_AMBIENT)
					gi.indirect.diffuse = 0;
				#endif

				#if defined(_SPECULAR_SETUP)
					c += LightingStandardSpecular (o, worldViewDir, gi);
				#else
					c += LightingStandard( o, worldViewDir, gi );
				#endif

				#ifdef ASE_TRANSMISSION
				{
					float shadow = _TransmissionShadow;
					#ifdef DIRECTIONAL
						float3 lightAtten = lerp( _LightColor0.rgb, gi.light.color, shadow );
					#else
						float3 lightAtten = gi.light.color;
					#endif
					half3 transmission = max(0 , -dot(o.Normal, gi.light.dir)) * lightAtten * Transmission;
					c.rgb += o.Albedo * transmission;
				}
				#endif

				#ifdef ASE_TRANSLUCENCY
				{
					float shadow = _TransShadow;
					float normal = _TransNormal;
					float scattering = _TransScattering;
					float direct = _TransDirect;
					float ambient = _TransAmbient;
					float strength = _TransStrength;

					#ifdef DIRECTIONAL
						float3 lightAtten = lerp( _LightColor0.rgb, gi.light.color, shadow );
					#else
						float3 lightAtten = gi.light.color;
					#endif
					half3 lightDir = gi.light.dir + o.Normal * normal;
					half transVdotL = pow( saturate( dot( worldViewDir, -lightDir ) ), scattering );
					half3 translucency = lightAtten * (transVdotL * direct + gi.indirect.diffuse * ambient) * Translucency;
					c.rgb += o.Albedo * translucency * strength;
				}
				#endif

				//#ifdef ASE_REFRACTION
				//	float4 projScreenPos = ScreenPos / ScreenPos.w;
				//	float3 refractionOffset = ( RefractionIndex - 1.0 ) * mul( UNITY_MATRIX_V, WorldNormal ).xyz * ( 1.0 - dot( WorldNormal, WorldViewDirection ) );
				//	projScreenPos.xy += refractionOffset.xy;
				//	float3 refraction = UNITY_SAMPLE_SCREENSPACE_TEXTURE( _GrabTexture, projScreenPos ) * RefractionColor;
				//	color.rgb = lerp( refraction, color.rgb, color.a );
				//	color.a = 1;
				//#endif

				c.rgb += o.Emission;

				#ifdef ASE_FOG
					UNITY_APPLY_FOG(IN.fogCoord, c);
				#endif
				#ifndef UNITY_PASS_FORWARDADD

#if defined(_RENDERING_TRANSPARENT) || defined(_RENDERING_FADE)	
c.rgb = ApplyFogAndVolumetricLights(c.rgb,IN.screenPos.xy / IN.screenPos.w,worldPos.xyz,0);

#if defined(_RENDERING_TRANSPARENT)
c.rgb *= o.Alpha;
#endif

#endif

#endif
				return c;
			}
			ENDCG
		}

		
		Pass
		{
			
			Name "ForwardAdd"
			Tags { "LightMode"="ForwardAdd" }
			ZWrite Off
			Blend One One

			CGPROGRAM
			#define ASE_NEEDS_FRAG_SHADOWCOORDS
			#pragma multi_compile_instancing
			#pragma multi_compile __ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_TESSELLATION 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_DISTANCE_TESSELLATION
			#define _ALPHATEST_ON 1

			#pragma vertex vert
			#pragma fragment frag
			#pragma skip_variants INSTANCING_ON
			#pragma multi_compile_fwdadd_fullshadows
			#ifndef UNITY_PASS_FORWARDADD
				#define UNITY_PASS_FORWARDADD
			#endif
			#include "HLSLSupport.cginc"
			#if !defined( UNITY_INSTANCED_LOD_FADE )
				#define UNITY_INSTANCED_LOD_FADE
			#endif
			#if !defined( UNITY_INSTANCED_SH )
				#define UNITY_INSTANCED_SH
			#endif
			#if !defined( UNITY_INSTANCED_LIGHTMAPSTS )
				#define UNITY_INSTANCED_LIGHTMAPSTS
			#endif
			#include "UnityShaderVariables.cginc"
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			#include "AutoLight.cginc"

			#include "UnityStandardUtils.cginc"
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_POSITION
			#pragma shader_feature_local _TESSELLATION_ON
			#pragma shader_feature_local _SNOW_ON
			#pragma shader_feature_local _ENVIROREMOVALZONES_ON
			#pragma shader_feature_local _PUDDLES_ON
			#pragma shader_feature_local _RENDERING_CUTOUT _RENDERING_FADE _RENDERING_TRANSPARENT _RENDERING_OPAQUE
			#pragma shader_feature_local _DETAILPROCEDURALMASK_OFF _DETAILPROCEDURALMASK_MASK _DETAILPROCEDURALMASK_PROCEDURAL _DETAILPROCEDURALMASK_HEIGHT
			#pragma shader_feature_local _GLOBALDETAILNORMAL_ON
			#pragma shader_feature_local _RAIN_ON
			#pragma shader_feature_local _EMISSION_ON
			#include "EnviroInclude.hlsl"

			struct appdata {
				float4 vertex : POSITION;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			struct v2f {
				#if UNITY_VERSION >= 201810
					UNITY_POSITION(pos);
				#else
					float4 pos : SV_POSITION;
				#endif
				#if UNITY_VERSION >= 201810 && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					UNITY_LIGHTING_COORDS(1,2)
				#elif defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if UNITY_VERSION >= 201710
						UNITY_SHADOW_COORDS(1)
					#else
						SHADOW_COORDS(1)
					#endif
				#endif
				#ifdef ASE_FOG
					UNITY_FOG_COORDS(3)
				#endif
				float4 tSpace0 : TEXCOORD5;
				float4 tSpace1 : TEXCOORD6;
				float4 tSpace2 : TEXCOORD7;
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 screenPos : TEXCOORD8;
				#endif
				float4 ase_texcoord9 : TEXCOORD9;
				float4 ase_texcoord10 : TEXCOORD10;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			uniform int _SrcBlend;
			uniform int _DstBlend;
			uniform int _ZWrite;
			uniform int _CullMode;
			uniform float _TessellationFactor;
			uniform sampler2D _SnowMask;
			uniform float _SnowTiling;
			uniform float4 _TilingOffset;
			uniform float _SnowDisplacementStrength;
			uniform float _EnviroSnow;
			uniform sampler2D _BaseMask;
			uniform float _PuddleIntensity;
			uniform float _PuddleCoverageNoise;
			uniform float _EnviroWetness;
			uniform float _DisplacementStrength;
			uniform sampler2D _MainTex;
			uniform float4 _Color;
			uniform sampler2D _DetailAlbedoMap;
			uniform float4 _DetailTilingOffset;
			uniform float4 _DetailTint;
			uniform sampler2D _Mask;
			uniform float _DetailMaskTiling;
			uniform float _DetailHeightBlendStrength;
			uniform float _DetailProceduralMaskScale;
			uniform float _DetailProceduralMaskIntensity;
			uniform float _DetailThreshold;
			uniform float _DetailHeight;
			uniform sampler2D _BumpMap;
			uniform float _BumpScale;
			uniform float _DetailNormalInfluence;
			uniform float4 _PuddleColor;
			uniform sampler2D _SnowAlbedo;
			uniform sampler2D _DetailNormalMap;
			uniform float _DetailNormalMapScale;
			uniform sampler2D _GlobalNormal;
			uniform float2 _GlobalNormalTiling;
			uniform float _GlobalNormalIntensity;
			uniform sampler2D _SnowNormal;
			uniform float _SnowNormalScale;
			uniform float _SSSDistortion;
			uniform float _SSSScale;
			uniform float _SSSIntensity;
			uniform float _Opacity;
			uniform float _RainFlowStrength;
			uniform float _EnviroRainIntensity;
			uniform float _RainFlowTiling;
			uniform float _RainFlowDistortionScale;
			uniform float _RainFlowDistortionStrenght;
			uniform float _RainFlowIntensity;
			uniform float _RainDistanceFade;
			uniform float _RainDropTiling;
			uniform float _RainDropSpeed;
			uniform float _RainDropIntensity;
			uniform sampler2D _WaveNormal;
			uniform float _PuddleWaveTiling;
			uniform float _PuddleWaveIntensity;
			uniform sampler2D _EmissionMap;
			uniform float4 _EmissionColor;
			uniform float _MetallicBase;
			uniform sampler2D _DetailMask;
			uniform float _MetallicDetail;
			uniform float _Smoothness;
			uniform float _SmoothnessAdd;
			uniform float _SmoothnessDetail;
			uniform float _SmoothnessDetailAdd;
			uniform float _SmoothnessWet;
			uniform float _RainFlowSmoothnessBoost;
			uniform float _OcclusionStrength;
			uniform float _CutOff;


			//This is a late directive
			
			inline float EnviroZonesFunction( float density, float3 wpos )
			{
				return EnviroRemoveZones(wpos,density);
			}
			
			inline float noise_randomValue (float2 uv) { return frac(sin(dot(uv, float2(12.9898, 78.233)))*43758.5453); }
			inline float noise_interpolate (float a, float b, float t) { return (1.0-t)*a + (t*b); }
			inline float valueNoise (float2 uv)
			{
				float2 i = floor(uv);
				float2 f = frac( uv );
				f = f* f * (3.0 - 2.0 * f);
				uv = abs( frac(uv) - 0.5);
				float2 c0 = i + float2( 0.0, 0.0 );
				float2 c1 = i + float2( 1.0, 0.0 );
				float2 c2 = i + float2( 0.0, 1.0 );
				float2 c3 = i + float2( 1.0, 1.0 );
				float r0 = noise_randomValue( c0 );
				float r1 = noise_randomValue( c1 );
				float r2 = noise_randomValue( c2 );
				float r3 = noise_randomValue( c3 );
				float bottomOfGrid = noise_interpolate( r0, r1, f.x );
				float topOfGrid = noise_interpolate( r2, r3, f.x );
				float t = noise_interpolate( bottomOfGrid, topOfGrid, f.y );
				return t;
			}
			
			float SimpleNoise(float2 UV)
			{
				float t = 0.0;
				float freq = pow( 2.0, float( 0 ) );
				float amp = pow( 0.5, float( 3 - 0 ) );
				t += valueNoise( UV/freq )*amp;
				freq = pow(2.0, float(1));
				amp = pow(0.5, float(3-1));
				t += valueNoise( UV/freq )*amp;
				freq = pow(2.0, float(2));
				amp = pow(0.5, float(3-2));
				t += valueNoise( UV/freq )*amp;
				return t;
			}
			
			inline float3 TriplanarSampling720( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = tex2D( topTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) );
				yNorm = tex2D( topTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) );
				zNorm = tex2D( topTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) );
				xNorm.xyz  = half3( UnpackScaleNormal( xNorm, normalScale.y ).xy * float2(  nsign.x, 1.0 ) + worldNormal.zy, worldNormal.x ).zyx;
				yNorm.xyz  = half3( UnpackScaleNormal( yNorm, normalScale.x ).xy * float2(  nsign.y, 1.0 ) + worldNormal.xz, worldNormal.y ).xzy;
				zNorm.xyz  = half3( UnpackScaleNormal( zNorm, normalScale.y ).xy * float2( -nsign.z, 1.0 ) + worldNormal.xy, worldNormal.z ).xyz;
				return normalize( xNorm.xyz * projNormal.x + yNorm.xyz * projNormal.y + zNorm.xyz * projNormal.z );
			}
			
			float2 UnityGradientNoiseDir( float2 p )
			{
				p = fmod(p , 289);
				float x = fmod((34 * p.x + 1) * p.x , 289) + p.y;
				x = fmod( (34 * x + 1) * x , 289);
				x = frac( x / 41 ) * 2 - 1;
				return normalize( float2(x - floor(x + 0.5 ), abs( x ) - 0.5 ) );
			}
			
			float UnityGradientNoise( float2 UV, float Scale )
			{
				float2 p = UV * Scale;
				float2 ip = floor( p );
				float2 fp = frac( p );
				float d00 = dot( UnityGradientNoiseDir( ip ), fp );
				float d01 = dot( UnityGradientNoiseDir( ip + float2( 0, 1 ) ), fp - float2( 0, 1 ) );
				float d10 = dot( UnityGradientNoiseDir( ip + float2( 1, 0 ) ), fp - float2( 1, 0 ) );
				float d11 = dot( UnityGradientNoiseDir( ip + float2( 1, 1 ) ), fp - float2( 1, 1 ) );
				fp = fp * fp * fp * ( fp * ( fp * 6 - 15 ) + 10 );
				return lerp( lerp( d00, d01, fp.y ), lerp( d10, d11, fp.y ), fp.x ) + 0.5;
			}
			
			float3 PerturbNormal107_g55( float3 surf_pos, float3 surf_norm, float height, float scale )
			{
				// "Bump Mapping Unparametrized Surfaces on the GPU" by Morten S. Mikkelsen
				float3 vSigmaS = ddx( surf_pos );
				float3 vSigmaT = ddy( surf_pos );
				float3 vN = surf_norm;
				float3 vR1 = cross( vSigmaT , vN );
				float3 vR2 = cross( vN , vSigmaS );
				float fDet = dot( vSigmaS , vR1 );
				float dBs = ddx( height );
				float dBt = ddy( height );
				float3 vSurfGrad = scale * 0.05 * sign( fDet ) * ( dBs * vR1 + dBt * vR2 );
				return normalize ( abs( fDet ) * vN - vSurfGrad );
			}
			

			v2f VertexFunction (appdata v  ) {
				UNITY_SETUP_INSTANCE_ID(v);
				v2f o;
				UNITY_INITIALIZE_OUTPUT(v2f,o);
				UNITY_TRANSFER_INSTANCE_ID(v,o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float2 temp_cast_0 = (_SnowTiling).xx;
				float2 appendResult286 = (float2(_TilingOffset.x , _TilingOffset.y));
				float2 appendResult287 = (float2(_TilingOffset.z , _TilingOffset.w));
				float2 texCoord44 = v.ase_texcoord.xy * appendResult286 + appendResult287;
				float2 Global_UV170 = texCoord44;
				float2 texCoord1385 = v.ase_texcoord.xy * temp_cast_0 + Global_UV170;
				float4 tex2DNode1387 = tex2Dlod( _SnowMask, float4( texCoord1385, 0, 0.0) );
				float Height_Snow234 = tex2DNode1387.b;
				float3 ase_worldNormal = UnityObjectToWorldNormal(v.normal);
				float density5_g5 = 0.0;
				float3 ase_worldPos = mul(unity_ObjectToWorld, float4( (v.vertex).xyz, 1 )).xyz;
				float3 wpos5_g5 = ase_worldPos;
				float localEnviroZonesFunction5_g5 = EnviroZonesFunction( density5_g5 , wpos5_g5 );
				float RemovalZoneMask1467 = localEnviroZonesFunction5_g5;
				#ifdef _ENVIROREMOVALZONES_ON
				float staticSwitch1456 = ( saturate( ( RemovalZoneMask1467 + _EnviroSnow ) ) * 2.0 );
				#else
				float staticSwitch1456 = ( _EnviroSnow * 2.0 );
				#endif
				float Snow_Amount199 = staticSwitch1456;
				#ifdef _SNOW_ON
				float3 staticSwitch1257 = ( saturate( ( ( Height_Snow234 + 0.5 ) * _SnowDisplacementStrength ) ) * ( v.normal * saturate( ( ( ase_worldNormal.y - 0.3 ) * Snow_Amount199 ) ) ) );
				#else
				float3 staticSwitch1257 = float3(0,0,0);
				#endif
				float3 Snow_Displacement707 = staticSwitch1257;
				float4 tex2DNode22 = tex2Dlod( _BaseMask, float4( Global_UV170, 0, 1.0) );
				float HEIGHT305 = tex2DNode22.b;
				float3 ase_worldTangent = UnityObjectToWorldDir(v.tangent);
				float ase_vertexTangentSign = v.tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 ase_worldViewDir = UnityWorldSpaceViewDir(ase_worldPos);
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float ase_faceVertex = (dot(ase_tanViewDir,float3(0,0,1)));
				float4 appendResult935 = (float4(ase_worldPos.x , ase_worldPos.z , 0.0 , 0.0));
				float simpleNoise921 = SimpleNoise( appendResult935.xy*_PuddleCoverageNoise );
				simpleNoise921 = simpleNoise921*2 - 1;
				#ifdef _ENVIROREMOVALZONES_ON
				float staticSwitch1464 = saturate( ( RemovalZoneMask1467 + _EnviroWetness ) );
				#else
				float staticSwitch1464 = _EnviroWetness;
				#endif
				float Wetness163 = staticSwitch1464;
				float switchResult1401 = (((ase_faceVertex>0)?(saturate( ( ( ( ase_worldNormal.y - 0.9 ) * ( ( saturate( ( _PuddleIntensity * simpleNoise921 ) ) * saturate( ( 2.0 - Snow_Amount199 ) ) ) * Wetness163 ) ) * 8.0 ) )):(0.0)));
				#ifdef _PUDDLES_ON
				float staticSwitch996 = switchResult1401;
				#else
				float staticSwitch996 = 0.0;
				#endif
				float Puddle_Mask584 = staticSwitch996;
				#ifdef _TESSELLATION_ON
				float3 staticSwitch1362 = ( Snow_Displacement707 + ( v.normal * ( ( HEIGHT305 * ( 1.0 - Puddle_Mask584 ) ) * _DisplacementStrength ) ) );
				#else
				float3 staticSwitch1362 = float3(0,0,0);
				#endif
				
				o.ase_texcoord9.xy = v.ase_texcoord.xy;
				o.ase_texcoord10 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord9.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = staticSwitch1362;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.vertex.w = 1;
				v.normal = v.normal;
				v.tangent = v.tangent;

				o.pos = UnityObjectToClipPos(v.vertex);
				float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				fixed3 worldNormal = UnityObjectToWorldNormal(v.normal);
				fixed3 worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
				fixed tangentSign = v.tangent.w * unity_WorldTransformParams.w;
				fixed3 worldBinormal = cross(worldNormal, worldTangent) * tangentSign;
				o.tSpace0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x);
				o.tSpace1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y);
				o.tSpace2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z);

				#if UNITY_VERSION >= 201810 && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					UNITY_TRANSFER_LIGHTING(o, v.texcoord1.xy);
				#elif defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if UNITY_VERSION >= 201710
						UNITY_TRANSFER_SHADOW(o, v.texcoord1.xy);
					#else
						TRANSFER_SHADOW(o);
					#endif
				#endif

				#ifdef ASE_FOG
					UNITY_TRANSFER_FOG(o,o.pos);
				#endif
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
					o.screenPos = ComputeScreenPos(o.pos);
				#endif
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( appdata v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.tangent = v.tangent;
				o.normal = v.normal;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessellationFactor; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, UNITY_MATRIX_M, _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			v2f DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				appdata o = (appdata) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.tangent = patch[0].tangent * bary.x + patch[1].tangent * bary.y + patch[2].tangent * bary.z;
				o.normal = patch[0].normal * bary.x + patch[1].normal * bary.y + patch[2].normal * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].normal * (dot(o.vertex.xyz, patch[i].normal) - dot(patch[i].vertex.xyz, patch[i].normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			v2f vert ( appdata v )
			{
				return VertexFunction( v );
			}
			#endif

			fixed4 frag ( v2f IN , bool ase_vface : SV_IsFrontFace
				#ifdef _DEPTHOFFSET_ON
				, out float outputDepth : SV_Depth
				#endif
				) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(IN);

				#ifdef LOD_FADE_CROSSFADE
					UNITY_APPLY_DITHER_CROSSFADE(IN.pos.xy);
				#endif

				#if defined(_SPECULAR_SETUP)
					SurfaceOutputStandardSpecular o = (SurfaceOutputStandardSpecular)0;
				#else
					SurfaceOutputStandard o = (SurfaceOutputStandard)0;
				#endif
				float3 WorldTangent = float3(IN.tSpace0.x,IN.tSpace1.x,IN.tSpace2.x);
				float3 WorldBiTangent = float3(IN.tSpace0.y,IN.tSpace1.y,IN.tSpace2.y);
				float3 WorldNormal = float3(IN.tSpace0.z,IN.tSpace1.z,IN.tSpace2.z);
				float3 worldPos = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 worldViewDir = normalize(UnityWorldSpaceViewDir(worldPos));
				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					UNITY_LIGHT_ATTENUATION(atten, IN, worldPos)
				#else
					half atten = 1;
				#endif
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 ScreenPos = IN.screenPos;
				#endif


				float2 appendResult286 = (float2(_TilingOffset.x , _TilingOffset.y));
				float2 appendResult287 = (float2(_TilingOffset.z , _TilingOffset.w));
				float2 texCoord44 = IN.ase_texcoord9.xy * appendResult286 + appendResult287;
				float2 Global_UV170 = texCoord44;
				float2 Parallax_UV178 = Global_UV170;
				float4 tex2DNode17 = tex2D( _MainTex, Parallax_UV178 );
				float4 Albedo_Base195 = tex2DNode17;
				float2 appendResult261 = (float2(_DetailTilingOffset.x , _DetailTilingOffset.y));
				float2 appendResult262 = (float2(_DetailTilingOffset.z , _DetailTilingOffset.w));
				float2 texCoord257 = IN.ase_texcoord9.xy * appendResult261 + appendResult262;
				float4 Detail_Albedo248 = tex2D( _DetailAlbedoMap, texCoord257 );
				float4 tex2DNode22 = tex2D( _BaseMask, Global_UV170 );
				float HEIGHT305 = tex2DNode22.b;
				float2 appendResult256 = (float2(_DetailMaskTiling , _DetailMaskTiling));
				float2 texCoord254 = IN.ase_texcoord9.xy * appendResult256 + float2( 0,0 );
				float HeightMask1341 = saturate(pow(max( (((HEIGHT305*tex2D( _Mask, texCoord254 ).r)*4)+(tex2D( _Mask, texCoord254 ).r*2)), 0 ),_DetailHeightBlendStrength));
				float simpleNoise1239 = SimpleNoise( texCoord254*_DetailProceduralMaskScale );
				simpleNoise1239 = simpleNoise1239*2 - 1;
				float HeightMask1249 = saturate(pow(max( (((HEIGHT305*saturate( ( simpleNoise1239 * _DetailProceduralMaskIntensity ) ))*4)+(saturate( ( simpleNoise1239 * _DetailProceduralMaskIntensity ) )*2)), 0 ),_DetailHeightBlendStrength));
				float4 transform1329 = mul(unity_ObjectToWorld,float4( IN.ase_texcoord10.xyz , 0.0 ));
				float smoothstepResult1323 = smoothstep( ( _DetailHeight - 1.0 ) , ( _DetailHeight + 1.0 ) , transform1329.y);
				float4 appendResult935 = (float4(worldPos.x , worldPos.z , 0.0 , 0.0));
				float simpleNoise921 = SimpleNoise( appendResult935.xy*_PuddleCoverageNoise );
				simpleNoise921 = simpleNoise921*2 - 1;
				float density5_g5 = 0.0;
				float3 wpos5_g5 = worldPos;
				float localEnviroZonesFunction5_g5 = EnviroZonesFunction( density5_g5 , wpos5_g5 );
				float RemovalZoneMask1467 = localEnviroZonesFunction5_g5;
				#ifdef _ENVIROREMOVALZONES_ON
				float staticSwitch1456 = ( saturate( ( RemovalZoneMask1467 + _EnviroSnow ) ) * 2.0 );
				#else
				float staticSwitch1456 = ( _EnviroSnow * 2.0 );
				#endif
				float Snow_Amount199 = staticSwitch1456;
				#ifdef _ENVIROREMOVALZONES_ON
				float staticSwitch1464 = saturate( ( RemovalZoneMask1467 + _EnviroWetness ) );
				#else
				float staticSwitch1464 = _EnviroWetness;
				#endif
				float Wetness163 = staticSwitch1464;
				float switchResult1401 = (((ase_vface>0)?(saturate( ( ( ( WorldNormal.y - 0.9 ) * ( ( saturate( ( _PuddleIntensity * simpleNoise921 ) ) * saturate( ( 2.0 - Snow_Amount199 ) ) ) * Wetness163 ) ) * 8.0 ) )):(0.0)));
				#ifdef _PUDDLES_ON
				float staticSwitch996 = switchResult1401;
				#else
				float staticSwitch996 = 0.0;
				#endif
				float Puddle_Mask584 = staticSwitch996;
				#ifdef _PUDDLES_ON
				float staticSwitch659 = saturate( ( _BumpScale - Puddle_Mask584 ) );
				#else
				float staticSwitch659 = _BumpScale;
				#endif
				float3 Normal_Base209 = UnpackScaleNormal( tex2D( _BumpMap, Parallax_UV178 ), staticSwitch659 );
				float3x3 ase_tangentToWorldFast = float3x3(WorldTangent.x,WorldBiTangent.x,WorldNormal.x,WorldTangent.y,WorldBiTangent.y,WorldNormal.y,WorldTangent.z,WorldBiTangent.z,WorldNormal.z);
				float3 tangentToWorldDir1332 = mul( ase_tangentToWorldFast, Normal_Base209 );
				float lerpResult1436 = lerp( 1.0 , tangentToWorldDir1332.y , _DetailNormalInfluence);
				float smoothstepResult1335 = smoothstep( 0.0 , ( 1.0 - _DetailThreshold ) , ( smoothstepResult1323 * lerpResult1436 ));
				float HeightMask1342 = saturate(pow(max( (((HEIGHT305*smoothstepResult1335)*4)+(smoothstepResult1335*2)), 0 ),_DetailHeightBlendStrength));
				#if defined( _DETAILPROCEDURALMASK_OFF )
				float staticSwitch1238 = 0.0;
				#elif defined( _DETAILPROCEDURALMASK_MASK )
				float staticSwitch1238 = HeightMask1341;
				#elif defined( _DETAILPROCEDURALMASK_PROCEDURAL )
				float staticSwitch1238 = HeightMask1249;
				#elif defined( _DETAILPROCEDURALMASK_HEIGHT )
				float staticSwitch1238 = HeightMask1342;
				#else
				float staticSwitch1238 = 0.0;
				#endif
				float Mask253 = saturate( staticSwitch1238 );
				float HeightMask264 = saturate(pow(((HEIGHT305*Mask253)*4)+(Mask253*2),1.0));
				float Detail_Blending277 = HeightMask264;
				float4 lerpResult265 = lerp( ( Albedo_Base195 * _Color ) , ( Detail_Albedo248 * _DetailTint ) , Detail_Blending277);
				float4 lerpResult964 = lerp( float4( 1,1,1,0 ) , _PuddleColor , Puddle_Mask584);
				#ifdef _PUDDLES_ON
				float4 staticSwitch959 = ( lerpResult265 * lerpResult964 );
				#else
				float4 staticSwitch959 = lerpResult265;
				#endif
				float2 temp_cast_2 = (_SnowTiling).xx;
				float2 texCoord1385 = IN.ase_texcoord9.xy * temp_cast_2 + Global_UV170;
				float4 Albedo_Snow198 = tex2D( _SnowAlbedo, texCoord1385 );
				float3 worldSpaceLightDir = UnityWorldSpaceLightDir(worldPos);
				float3 Detail_Normal249 = UnpackScaleNormal( tex2D( _DetailNormalMap, texCoord257 ), _DetailNormalMapScale );
				float3 lerpResult283 = lerp( Normal_Base209 , Detail_Normal249 , Detail_Blending277);
				float3x3 ase_worldToTangent = float3x3(WorldTangent,WorldBiTangent,WorldNormal);
				#ifdef _PUDDLES_ON
				float staticSwitch766 = saturate( ( _GlobalNormalIntensity - Puddle_Mask584 ) );
				#else
				float staticSwitch766 = _GlobalNormalIntensity;
				#endif
				float3 triplanar720 = TriplanarSampling720( _GlobalNormal, worldPos, WorldNormal, 1.0, _GlobalNormalTiling, staticSwitch766, 0 );
				float3 tanTriplanarNormal720 = mul( ase_worldToTangent, triplanar720 );
				float3 Global_Normal688 = tanTriplanarNormal720;
				#ifdef _GLOBALDETAILNORMAL_ON
				float3 staticSwitch1431 = BlendNormals( lerpResult283 , Global_Normal688 );
				#else
				float3 staticSwitch1431 = lerpResult283;
				#endif
				float3 Normal_Snow211 = UnpackScaleNormal( tex2D( _SnowNormal, texCoord1385 ), _SnowNormalScale );
				float switchResult1311 = (((ase_vface>0)?(( WorldNormal.y * Snow_Amount199 )):(0.0)));
				float temp_output_10_0 = saturate( switchResult1311 );
				float3 lerpResult11 = lerp( staticSwitch1431 , Normal_Snow211 , temp_output_10_0);
				#ifdef _SNOW_ON
				float3 staticSwitch1261 = lerpResult11;
				#else
				float3 staticSwitch1261 = staticSwitch1431;
				#endif
				float3 Normal_Combined213 = staticSwitch1261;
				float3 tangentToWorldDir1209 = mul( ase_tangentToWorldFast, Normal_Combined213 );
				float dotResult72 = dot( worldViewDir , -( worldSpaceLightDir + ( tangentToWorldDir1209 * _SSSDistortion ) ) );
				float dotResult82 = dot( dotResult72 , _SSSScale );
				float SSS184 = ( saturate( dotResult82 ) * _SSSIntensity );
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal12 = Normal_Combined213;
				float3 worldNormal12 = float3(dot(tanToWorld0,tanNormal12), dot(tanToWorld1,tanNormal12), dot(tanToWorld2,tanNormal12));
				float switchResult1310 = (((ase_vface>0)?(saturate( ( worldNormal12.y * Snow_Amount199 ) )):(0.0)));
				#ifdef _SNOW_ON
				float staticSwitch1259 = switchResult1310;
				#else
				float staticSwitch1259 = 0.0;
				#endif
				float Snow_Blend_Normal205 = staticSwitch1259;
				float4 lerpResult16 = lerp( staticSwitch959 , ( Albedo_Snow198 + SSS184 ) , Snow_Blend_Normal205);
				#ifdef _SNOW_ON
				float4 staticSwitch1253 = lerpResult16;
				#else
				float4 staticSwitch1253 = staticSwitch959;
				#endif
				float4 temp_output_40_0 = ( staticSwitch1253 + (0.0 + (Wetness163 - 0.0) * (-0.01 - 0.0) / (1.0 - 0.0)) );
				float Opacity1274 = tex2DNode17.a;
				float TintAlpha1273 = _Color.a;
				float temp_output_1277_0 = ( Opacity1274 * TintAlpha1273 );
				#ifdef _SNOW_ON
				float staticSwitch1294 = ( temp_output_1277_0 + ( Snow_Blend_Normal205 * 2.0 ) );
				#else
				float staticSwitch1294 = temp_output_1277_0;
				#endif
				#if defined( _RENDERING_CUTOUT )
				float staticSwitch1478 = temp_output_1277_0;
				#elif defined( _RENDERING_FADE )
				float staticSwitch1478 = staticSwitch1294;
				#elif defined( _RENDERING_TRANSPARENT )
				float staticSwitch1478 = staticSwitch1294;
				#elif defined( _RENDERING_OPAQUE )
				float staticSwitch1478 = staticSwitch1294;
				#else
				float staticSwitch1478 = staticSwitch1294;
				#endif
				float BaseAlpha1283 = saturate( ( staticSwitch1478 + _Opacity ) );
				#if defined( _RENDERING_CUTOUT )
				float4 staticSwitch1284 = temp_output_40_0;
				#elif defined( _RENDERING_FADE )
				float4 staticSwitch1284 = temp_output_40_0;
				#elif defined( _RENDERING_TRANSPARENT )
				float4 staticSwitch1284 = ( temp_output_40_0 * BaseAlpha1283 );
				#elif defined( _RENDERING_OPAQUE )
				float4 staticSwitch1284 = temp_output_40_0;
				#else
				float4 staticSwitch1284 = temp_output_40_0;
				#endif
				float4 Albedo_Final224 = staticSwitch1284;
				
				float3 surf_pos107_g55 = worldPos;
				float3 surf_norm107_g55 = WorldNormal;
				#ifdef _ENVIROREMOVALZONES_ON
				float staticSwitch1468 = saturate( ( RemovalZoneMask1467 + _EnviroRainIntensity ) );
				#else
				float staticSwitch1468 = _EnviroRainIntensity;
				#endif
				float RainIntensity233 = staticSwitch1468;
				float temp_output_1156_0 = (1.0 + (( _RainFlowStrength * RainIntensity233 ) - 0.0) * (-1.0 - 1.0) / (1.0 - 0.0));
				float temp_output_1039_0 = ( _Time.y * 0.05 );
				float4 transform1024 = mul(unity_ObjectToWorld,float4( IN.ase_texcoord10.xyz , 0.0 ));
				float2 appendResult1027 = (float2(( transform1024.z * 0.7 ) , ( transform1024.y * 0.2 )));
				float2 panner1030 = ( temp_output_1039_0 * float2( 0,1 ) + ( appendResult1027 * _RainFlowTiling ));
				float2 texCoord649 = IN.ase_texcoord9.xy * float2( 10,10 ) + float2( 0,0 );
				float gradientNoise650 = UnityGradientNoise(texCoord649,_RainFlowDistortionScale);
				gradientNoise650 = gradientNoise650*0.5 + 0.5;
				float Distortion655 = ( gradientNoise650 * _RainFlowDistortionStrenght );
				float simpleNoise1021 = SimpleNoise( ( panner1030 + Distortion655 )*100.0 );
				simpleNoise1021 = simpleNoise1021*2 - 1;
				float smoothstepResult1071 = smoothstep( temp_output_1156_0 , 1.0 , simpleNoise1021);
				float temp_output_1047_0 = ( ( ( WorldNormal.y - 0.7 ) * -1.0 ) * _RainFlowIntensity );
				float3 temp_cast_5 = (0.3).xxx;
				float3 break1080 = ( abs( WorldNormal ) - temp_cast_5 );
				float lerpResult1081 = lerp( 0.0 , ( smoothstepResult1071 * temp_output_1047_0 ) , break1080.x);
				float4 transform1025 = mul(unity_ObjectToWorld,float4( IN.ase_texcoord10.xyz , 0.0 ));
				float2 appendResult1026 = (float2(( transform1025.x * 0.7 ) , ( transform1025.y * 0.2 )));
				float2 panner1031 = ( temp_output_1039_0 * float2( 0,1 ) + ( appendResult1026 * _RainFlowTiling ));
				float simpleNoise1028 = SimpleNoise( ( panner1031 + Distortion655 )*100.0 );
				simpleNoise1028 = simpleNoise1028*2 - 1;
				float smoothstepResult1070 = smoothstep( temp_output_1156_0 , 1.0 , simpleNoise1028);
				float lerpResult1082 = lerp( 0.0 , ( smoothstepResult1070 * temp_output_1047_0 ) , break1080.z);
				float Rain_Distance_Fade1154 = ( 1.0 - sqrt( saturate( ( distance( worldPos , _WorldSpaceCameraPos ) / _RainDistanceFade ) ) ) );
				float switchResult1400 = (((ase_vface>0)?(( ( lerpResult1081 + lerpResult1082 ) * Rain_Distance_Fade1154 )):(0.0)));
				float temp_output_1075_0 = saturate( switchResult1400 );
				float height107_g55 = temp_output_1075_0;
				float scale107_g55 = 0.1;
				float3 localPerturbNormal107_g55 = PerturbNormal107_g55( surf_pos107_g55 , surf_norm107_g55 , height107_g55 , scale107_g55 );
				float3 worldToTangentDir42_g55 = mul( ase_worldToTangent, localPerturbNormal107_g55);
				float3 RainFlow411 = worldToTangentDir42_g55;
				float localRainRipples1_g54 = ( 0.0 );
				float4 transform1427 = mul(unity_ObjectToWorld,float4( IN.ase_texcoord10.xyz , 0.0 ));
				float2 appendResult1422 = (float2(transform1427.x , transform1427.z));
				float2 UV1_g54 = ( appendResult1422 * _RainDropTiling );
				float AngleOffset1_g54 = 5.0;
				float lerpResult1419 = lerp( 64.0 , 12.0 , Puddle_Mask584);
				float CellDensity1_g54 = round( lerpResult1419 );
				float Time1_g54 = ( _Time.y * _RainDropSpeed );
				float temp_output_1128_0 = ( _RainDropIntensity * 1.5 );
				float lerpResult1126 = lerp( _RainDropIntensity , temp_output_1128_0 , Puddle_Mask584);
				#ifdef _PUDDLES_ON
				float staticSwitch1129 = lerpResult1126;
				#else
				float staticSwitch1129 = temp_output_1128_0;
				#endif
				float switchResult1402 = (((ase_vface>0)?(( ( ( WorldNormal.y - 0.8 ) * ( staticSwitch1129 * RainIntensity233 ) ) * Rain_Distance_Fade1154 )):(0.0)));
				float Strength1_g54 = max( 0.0 , switchResult1402 );
				float3 normal1_g54 = float3( 0,0,0 );
				float Out1_g54 = 0.0;
				float lerpResult1002 = lerp( 5.0 , 8.0 , Puddle_Mask584);
				float pow1_g54 = lerpResult1002;
				float lerpResult1004 = lerp( 1.0 , 0.0 , Puddle_Mask584);
				float sin1_g54 = lerpResult1004;
				{
				Rain(UV1_g54,AngleOffset1_g54,CellDensity1_g54,Time1_g54,Strength1_g54,pow1_g54,sin1_g54,Out1_g54,normal1_g54);
				}
				float3 temp_output_1392_9 = normal1_g54;
				float3 Rain_Drop341 = temp_output_1392_9;
				#ifdef _RAIN_ON
				float3 staticSwitch639 = BlendNormals( Normal_Combined213 , BlendNormals( RainFlow411 , Rain_Drop341 ) );
				#else
				float3 staticSwitch639 = Normal_Combined213;
				#endif
				float temp_output_729_0 = ( _Time.y * 0.05 );
				float2 appendResult1414 = (float2(worldPos.x , worldPos.z));
				float2 temp_output_1415_0 = ( appendResult1414 * _PuddleWaveTiling );
				float2 panner734 = ( temp_output_729_0 * float2( 1,0 ) + temp_output_1415_0);
				float temp_output_735_0 = ( Puddle_Mask584 * ( _PuddleWaveIntensity * Wetness163 ) );
				float2 panner736 = ( temp_output_729_0 * float2( 0,1 ) + temp_output_1415_0);
				float3 Puddle740 = BlendNormals( UnpackScaleNormal( tex2D( _WaveNormal, panner734 ), temp_output_735_0 ) , UnpackScaleNormal( tex2D( _WaveNormal, panner736 ), temp_output_735_0 ) );
				#ifdef _PUDDLES_ON
				float3 staticSwitch628 = BlendNormals( staticSwitch639 , Puddle740 );
				#else
				float3 staticSwitch628 = staticSwitch639;
				#endif
				float3 Normals_Final216 = staticSwitch628;
				
				#ifdef _EMISSION_ON
				float4 staticSwitch1432 = ( tex2D( _EmissionMap, Parallax_UV178 ) * _EmissionColor );
				#else
				float4 staticSwitch1432 = float4(0,0,0,0);
				#endif
				float4 Emission_Final678 = staticSwitch1432;
				
				float Metallic_Base187 = tex2DNode22.r;
				float4 tex2DNode1211 = tex2D( _DetailMask, texCoord257 );
				float Detail_Metallic1212 = tex2DNode1211.r;
				float lerpResult1231 = lerp( saturate( ( Metallic_Base187 + _MetallicBase ) ) , saturate( ( Detail_Metallic1212 + _MetallicDetail ) ) , Mask253);
				float4 tex2DNode1387 = tex2D( _SnowMask, texCoord1385 );
				float Metallic_Snow189 = tex2DNode1387.r;
				float lerpResult15 = lerp( lerpResult1231 , Metallic_Snow189 , Snow_Blend_Normal205);
				#ifdef _SNOW_ON
				float staticSwitch1254 = lerpResult15;
				#else
				float staticSwitch1254 = lerpResult1231;
				#endif
				float Metallic_Final218 = staticSwitch1254;
				
				float Smoothness663 = tex2DNode22.a;
				float Smothness_Detail665 = tex2DNode1211.a;
				float lerpResult671 = lerp( ( ( Smoothness663 * _Smoothness ) + _SmoothnessAdd ) , ( ( Smothness_Detail665 * _SmoothnessDetail ) + _SmoothnessDetailAdd ) , Mask253);
				float lerpResult37 = lerp( 0.0 , _SmoothnessWet , Wetness163);
				#ifdef _PUDDLES_ON
				float staticSwitch629 = ( lerpResult37 + saturate( ( Puddle_Mask584 - 0.2 ) ) );
				#else
				float staticSwitch629 = lerpResult37;
				#endif
				float RainDropSmoothness870 = ( Out1_g54 * 0.25 );
				float RainFlowSmoothness1087 = ( temp_output_1075_0 * _RainFlowSmoothnessBoost );
				#ifdef _RAIN_ON
				float staticSwitch944 = ( ( staticSwitch629 + RainDropSmoothness870 ) + RainFlowSmoothness1087 );
				#else
				float staticSwitch944 = staticSwitch629;
				#endif
				float temp_output_674_0 = ( lerpResult671 + staticSwitch944 );
				float Smothness_Snow664 = tex2DNode1387.a;
				float lerpResult668 = lerp( temp_output_674_0 , Smothness_Snow664 , Snow_Blend_Normal205);
				#ifdef _SNOW_ON
				float staticSwitch1256 = lerpResult668;
				#else
				float staticSwitch1256 = temp_output_674_0;
				#endif
				float Smoothness_Final220 = saturate( staticSwitch1256 );
				
				float Occlusion_Base193 = tex2DNode22.g;
				float Detail_Occlusion1213 = tex2DNode1211.g;
				float lerpResult1236 = lerp( Occlusion_Base193 , Detail_Occlusion1213 , Mask253);
				float Occlusion_Snow191 = tex2DNode1387.g;
				float lerpResult27 = lerp( lerpResult1236 , Occlusion_Snow191 , Snow_Blend_Normal205);
				#ifdef _SNOW_ON
				float staticSwitch1255 = lerpResult27;
				#else
				float staticSwitch1255 = lerpResult1236;
				#endif
				float lerpResult969 = lerp( 1.0 , staticSwitch1255 , _OcclusionStrength);
				#ifdef _PUDDLES_ON
				float staticSwitch970 = saturate( ( lerpResult969 + Puddle_Mask584 ) );
				#else
				float staticSwitch970 = lerpResult969;
				#endif
				float Occlusion_Final222 = staticSwitch970;
				
				#if defined( _RENDERING_CUTOUT )
				float staticSwitch1279 = BaseAlpha1283;
				#elif defined( _RENDERING_FADE )
				float staticSwitch1279 = BaseAlpha1283;
				#elif defined( _RENDERING_TRANSPARENT )
				float staticSwitch1279 = BaseAlpha1283;
				#elif defined( _RENDERING_OPAQUE )
				float staticSwitch1279 = 1.0;
				#else
				float staticSwitch1279 = 1.0;
				#endif
				float OpacityFinal1278 = staticSwitch1279;
				
				#if defined( _RENDERING_CUTOUT )
				float staticSwitch1288 = _CutOff;
				#elif defined( _RENDERING_FADE )
				float staticSwitch1288 = 0.0;
				#elif defined( _RENDERING_TRANSPARENT )
				float staticSwitch1288 = 0.0;
				#elif defined( _RENDERING_OPAQUE )
				float staticSwitch1288 = 0.0;
				#else
				float staticSwitch1288 = 0.0;
				#endif
				float OpacityMaskFinal1289 = staticSwitch1288;
				
				o.Albedo = Albedo_Final224.rgb;
				o.Normal = Normals_Final216;
				o.Emission = Emission_Final678.xyz;
				#if defined(_SPECULAR_SETUP)
					o.Specular = fixed3( 0, 0, 0 );
				#else
					o.Metallic = Metallic_Final218;
				#endif
				o.Smoothness = Smoothness_Final220;
				o.Occlusion = Occlusion_Final222;
				o.Alpha = OpacityFinal1278;
				float AlphaClipThreshold = OpacityMaskFinal1289;
				float3 Transmission = 1;
				float3 Translucency = 1;

				#ifdef _ALPHATEST_ON
					clip( o.Alpha - AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
					outputDepth = IN.pos.z;
				#endif

				#ifndef USING_DIRECTIONAL_LIGHT
					fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
				#else
					fixed3 lightDir = _WorldSpaceLightPos0.xyz;
				#endif

				fixed4 c = 0;
				float3 worldN;
				worldN.x = dot(IN.tSpace0.xyz, o.Normal);
				worldN.y = dot(IN.tSpace1.xyz, o.Normal);
				worldN.z = dot(IN.tSpace2.xyz, o.Normal);
				worldN = normalize(worldN);
				o.Normal = worldN;

				UnityGI gi;
				UNITY_INITIALIZE_OUTPUT(UnityGI, gi);
				gi.indirect.diffuse = 0;
				gi.indirect.specular = 0;
				gi.light.color = _LightColor0.rgb;
				gi.light.dir = lightDir;
				gi.light.color *= atten;

				#if defined(_SPECULAR_SETUP)
					c += LightingStandardSpecular( o, worldViewDir, gi );
				#else
					c += LightingStandard( o, worldViewDir, gi );
				#endif

				#ifdef ASE_TRANSMISSION
				{
					float shadow = _TransmissionShadow;
					#ifdef DIRECTIONAL
						float3 lightAtten = lerp( _LightColor0.rgb, gi.light.color, shadow );
					#else
						float3 lightAtten = gi.light.color;
					#endif
					half3 transmission = max(0 , -dot(o.Normal, gi.light.dir)) * lightAtten * Transmission;
					c.rgb += o.Albedo * transmission;
				}
				#endif

				#ifdef ASE_TRANSLUCENCY
				{
					float shadow = _TransShadow;
					float normal = _TransNormal;
					float scattering = _TransScattering;
					float direct = _TransDirect;
					float ambient = _TransAmbient;
					float strength = _TransStrength;

					#ifdef DIRECTIONAL
						float3 lightAtten = lerp( _LightColor0.rgb, gi.light.color, shadow );
					#else
						float3 lightAtten = gi.light.color;
					#endif
					half3 lightDir = gi.light.dir + o.Normal * normal;
					half transVdotL = pow( saturate( dot( worldViewDir, -lightDir ) ), scattering );
					half3 translucency = lightAtten * (transVdotL * direct + gi.indirect.diffuse * ambient) * Translucency;
					c.rgb += o.Albedo * translucency * strength;
				}
				#endif

				//#ifdef ASE_REFRACTION
				//	float4 projScreenPos = ScreenPos / ScreenPos.w;
				//	float3 refractionOffset = ( RefractionIndex - 1.0 ) * mul( UNITY_MATRIX_V, WorldNormal ).xyz * ( 1.0 - dot( WorldNormal, WorldViewDirection ) );
				//	projScreenPos.xy += refractionOffset.xy;
				//	float3 refraction = UNITY_SAMPLE_SCREENSPACE_TEXTURE( _GrabTexture, projScreenPos ) * RefractionColor;
				//	color.rgb = lerp( refraction, color.rgb, color.a );
				//	color.a = 1;
				//#endif

				#ifdef ASE_FOG
					UNITY_APPLY_FOG(IN.fogCoord, c);
				#endif
				#ifndef UNITY_PASS_FORWARDADD

#if defined(_RENDERING_TRANSPARENT) || defined(_RENDERING_FADE)	
c.rgb = ApplyFogAndVolumetricLights(c.rgb,IN.screenPos.xy / IN.screenPos.w,worldPos.xyz,0);

#if defined(_RENDERING_TRANSPARENT)
c.rgb *= o.Alpha;
#endif

#endif

#endif
				return c;
			}
			ENDCG
		}

		
		Pass
		{
			
			Name "Deferred"
			Tags { "LightMode"="Deferred" }

			AlphaToMask Off

			CGPROGRAM
			#define ASE_NEEDS_FRAG_SHADOWCOORDS
			#pragma multi_compile_instancing
			#pragma multi_compile __ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_TESSELLATION 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_DISTANCE_TESSELLATION
			#define _ALPHATEST_ON 1

			#pragma vertex vert
			#pragma fragment frag
			#pragma target 3.0
			#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
			#pragma multi_compile_prepassfinal
			#ifndef UNITY_PASS_DEFERRED
				#define UNITY_PASS_DEFERRED
			#endif
			#include "HLSLSupport.cginc"
			#if !defined( UNITY_INSTANCED_LOD_FADE )
				#define UNITY_INSTANCED_LOD_FADE
			#endif
			#if !defined( UNITY_INSTANCED_SH )
				#define UNITY_INSTANCED_SH
			#endif
			#if !defined( UNITY_INSTANCED_LIGHTMAPSTS )
				#define UNITY_INSTANCED_LIGHTMAPSTS
			#endif
			#include "UnityShaderVariables.cginc"
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"

			#include "UnityStandardUtils.cginc"
			#include "AutoLight.cginc"
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_POSITION
			#pragma shader_feature_local _TESSELLATION_ON
			#pragma shader_feature_local _SNOW_ON
			#pragma shader_feature_local _ENVIROREMOVALZONES_ON
			#pragma shader_feature_local _PUDDLES_ON
			#pragma shader_feature_local _RENDERING_CUTOUT _RENDERING_FADE _RENDERING_TRANSPARENT _RENDERING_OPAQUE
			#pragma shader_feature_local _DETAILPROCEDURALMASK_OFF _DETAILPROCEDURALMASK_MASK _DETAILPROCEDURALMASK_PROCEDURAL _DETAILPROCEDURALMASK_HEIGHT
			#pragma shader_feature_local _GLOBALDETAILNORMAL_ON
			#pragma shader_feature_local _RAIN_ON
			#pragma shader_feature_local _EMISSION_ON
			#include "EnviroInclude.hlsl"

			struct appdata {
				float4 vertex : POSITION;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct v2f {
				#if UNITY_VERSION >= 201810
					UNITY_POSITION(pos);
				#else
					float4 pos : SV_POSITION;
				#endif
				float4 lmap : TEXCOORD2;
				#ifndef LIGHTMAP_ON
					#if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
						half3 sh : TEXCOORD3;
					#endif
				#else
					#ifdef DIRLIGHTMAP_OFF
						float4 lmapFadePos : TEXCOORD4;
					#endif
				#endif
				float4 tSpace0 : TEXCOORD5;
				float4 tSpace1 : TEXCOORD6;
				float4 tSpace2 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			#ifdef LIGHTMAP_ON
			float4 unity_LightmapFade;
			#endif
			fixed4 unity_Ambient;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			uniform int _SrcBlend;
			uniform int _DstBlend;
			uniform int _ZWrite;
			uniform int _CullMode;
			uniform float _TessellationFactor;
			uniform sampler2D _SnowMask;
			uniform float _SnowTiling;
			uniform float4 _TilingOffset;
			uniform float _SnowDisplacementStrength;
			uniform float _EnviroSnow;
			uniform sampler2D _BaseMask;
			uniform float _PuddleIntensity;
			uniform float _PuddleCoverageNoise;
			uniform float _EnviroWetness;
			uniform float _DisplacementStrength;
			uniform sampler2D _MainTex;
			uniform float4 _Color;
			uniform sampler2D _DetailAlbedoMap;
			uniform float4 _DetailTilingOffset;
			uniform float4 _DetailTint;
			uniform sampler2D _Mask;
			uniform float _DetailMaskTiling;
			uniform float _DetailHeightBlendStrength;
			uniform float _DetailProceduralMaskScale;
			uniform float _DetailProceduralMaskIntensity;
			uniform float _DetailThreshold;
			uniform float _DetailHeight;
			uniform sampler2D _BumpMap;
			uniform float _BumpScale;
			uniform float _DetailNormalInfluence;
			uniform float4 _PuddleColor;
			uniform sampler2D _SnowAlbedo;
			uniform sampler2D _DetailNormalMap;
			uniform float _DetailNormalMapScale;
			uniform sampler2D _GlobalNormal;
			uniform float2 _GlobalNormalTiling;
			uniform float _GlobalNormalIntensity;
			uniform sampler2D _SnowNormal;
			uniform float _SnowNormalScale;
			uniform float _SSSDistortion;
			uniform float _SSSScale;
			uniform float _SSSIntensity;
			uniform float _Opacity;
			uniform float _RainFlowStrength;
			uniform float _EnviroRainIntensity;
			uniform float _RainFlowTiling;
			uniform float _RainFlowDistortionScale;
			uniform float _RainFlowDistortionStrenght;
			uniform float _RainFlowIntensity;
			uniform float _RainDistanceFade;
			uniform float _RainDropTiling;
			uniform float _RainDropSpeed;
			uniform float _RainDropIntensity;
			uniform sampler2D _WaveNormal;
			uniform float _PuddleWaveTiling;
			uniform float _PuddleWaveIntensity;
			uniform sampler2D _EmissionMap;
			uniform float4 _EmissionColor;
			uniform float _MetallicBase;
			uniform sampler2D _DetailMask;
			uniform float _MetallicDetail;
			uniform float _Smoothness;
			uniform float _SmoothnessAdd;
			uniform float _SmoothnessDetail;
			uniform float _SmoothnessDetailAdd;
			uniform float _SmoothnessWet;
			uniform float _RainFlowSmoothnessBoost;
			uniform float _OcclusionStrength;
			uniform float _CutOff;


			//This is a late directive
			
			inline float EnviroZonesFunction( float density, float3 wpos )
			{
				return EnviroRemoveZones(wpos,density);
			}
			
			inline float noise_randomValue (float2 uv) { return frac(sin(dot(uv, float2(12.9898, 78.233)))*43758.5453); }
			inline float noise_interpolate (float a, float b, float t) { return (1.0-t)*a + (t*b); }
			inline float valueNoise (float2 uv)
			{
				float2 i = floor(uv);
				float2 f = frac( uv );
				f = f* f * (3.0 - 2.0 * f);
				uv = abs( frac(uv) - 0.5);
				float2 c0 = i + float2( 0.0, 0.0 );
				float2 c1 = i + float2( 1.0, 0.0 );
				float2 c2 = i + float2( 0.0, 1.0 );
				float2 c3 = i + float2( 1.0, 1.0 );
				float r0 = noise_randomValue( c0 );
				float r1 = noise_randomValue( c1 );
				float r2 = noise_randomValue( c2 );
				float r3 = noise_randomValue( c3 );
				float bottomOfGrid = noise_interpolate( r0, r1, f.x );
				float topOfGrid = noise_interpolate( r2, r3, f.x );
				float t = noise_interpolate( bottomOfGrid, topOfGrid, f.y );
				return t;
			}
			
			float SimpleNoise(float2 UV)
			{
				float t = 0.0;
				float freq = pow( 2.0, float( 0 ) );
				float amp = pow( 0.5, float( 3 - 0 ) );
				t += valueNoise( UV/freq )*amp;
				freq = pow(2.0, float(1));
				amp = pow(0.5, float(3-1));
				t += valueNoise( UV/freq )*amp;
				freq = pow(2.0, float(2));
				amp = pow(0.5, float(3-2));
				t += valueNoise( UV/freq )*amp;
				return t;
			}
			
			inline float3 TriplanarSampling720( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = tex2D( topTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) );
				yNorm = tex2D( topTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) );
				zNorm = tex2D( topTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) );
				xNorm.xyz  = half3( UnpackScaleNormal( xNorm, normalScale.y ).xy * float2(  nsign.x, 1.0 ) + worldNormal.zy, worldNormal.x ).zyx;
				yNorm.xyz  = half3( UnpackScaleNormal( yNorm, normalScale.x ).xy * float2(  nsign.y, 1.0 ) + worldNormal.xz, worldNormal.y ).xzy;
				zNorm.xyz  = half3( UnpackScaleNormal( zNorm, normalScale.y ).xy * float2( -nsign.z, 1.0 ) + worldNormal.xy, worldNormal.z ).xyz;
				return normalize( xNorm.xyz * projNormal.x + yNorm.xyz * projNormal.y + zNorm.xyz * projNormal.z );
			}
			
			float2 UnityGradientNoiseDir( float2 p )
			{
				p = fmod(p , 289);
				float x = fmod((34 * p.x + 1) * p.x , 289) + p.y;
				x = fmod( (34 * x + 1) * x , 289);
				x = frac( x / 41 ) * 2 - 1;
				return normalize( float2(x - floor(x + 0.5 ), abs( x ) - 0.5 ) );
			}
			
			float UnityGradientNoise( float2 UV, float Scale )
			{
				float2 p = UV * Scale;
				float2 ip = floor( p );
				float2 fp = frac( p );
				float d00 = dot( UnityGradientNoiseDir( ip ), fp );
				float d01 = dot( UnityGradientNoiseDir( ip + float2( 0, 1 ) ), fp - float2( 0, 1 ) );
				float d10 = dot( UnityGradientNoiseDir( ip + float2( 1, 0 ) ), fp - float2( 1, 0 ) );
				float d11 = dot( UnityGradientNoiseDir( ip + float2( 1, 1 ) ), fp - float2( 1, 1 ) );
				fp = fp * fp * fp * ( fp * ( fp * 6 - 15 ) + 10 );
				return lerp( lerp( d00, d01, fp.y ), lerp( d10, d11, fp.y ), fp.x ) + 0.5;
			}
			
			float3 PerturbNormal107_g55( float3 surf_pos, float3 surf_norm, float height, float scale )
			{
				// "Bump Mapping Unparametrized Surfaces on the GPU" by Morten S. Mikkelsen
				float3 vSigmaS = ddx( surf_pos );
				float3 vSigmaT = ddy( surf_pos );
				float3 vN = surf_norm;
				float3 vR1 = cross( vSigmaT , vN );
				float3 vR2 = cross( vN , vSigmaS );
				float fDet = dot( vSigmaS , vR1 );
				float dBs = ddx( height );
				float dBt = ddy( height );
				float3 vSurfGrad = scale * 0.05 * sign( fDet ) * ( dBs * vR1 + dBt * vR2 );
				return normalize ( abs( fDet ) * vN - vSurfGrad );
			}
			

			v2f VertexFunction (appdata v  ) {
				UNITY_SETUP_INSTANCE_ID(v);
				v2f o;
				UNITY_INITIALIZE_OUTPUT(v2f,o);
				UNITY_TRANSFER_INSTANCE_ID(v,o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float2 temp_cast_0 = (_SnowTiling).xx;
				float2 appendResult286 = (float2(_TilingOffset.x , _TilingOffset.y));
				float2 appendResult287 = (float2(_TilingOffset.z , _TilingOffset.w));
				float2 texCoord44 = v.ase_texcoord.xy * appendResult286 + appendResult287;
				float2 Global_UV170 = texCoord44;
				float2 texCoord1385 = v.ase_texcoord.xy * temp_cast_0 + Global_UV170;
				float4 tex2DNode1387 = tex2Dlod( _SnowMask, float4( texCoord1385, 0, 0.0) );
				float Height_Snow234 = tex2DNode1387.b;
				float3 ase_worldNormal = UnityObjectToWorldNormal(v.normal);
				float density5_g5 = 0.0;
				float3 ase_worldPos = mul(unity_ObjectToWorld, float4( (v.vertex).xyz, 1 )).xyz;
				float3 wpos5_g5 = ase_worldPos;
				float localEnviroZonesFunction5_g5 = EnviroZonesFunction( density5_g5 , wpos5_g5 );
				float RemovalZoneMask1467 = localEnviroZonesFunction5_g5;
				#ifdef _ENVIROREMOVALZONES_ON
				float staticSwitch1456 = ( saturate( ( RemovalZoneMask1467 + _EnviroSnow ) ) * 2.0 );
				#else
				float staticSwitch1456 = ( _EnviroSnow * 2.0 );
				#endif
				float Snow_Amount199 = staticSwitch1456;
				#ifdef _SNOW_ON
				float3 staticSwitch1257 = ( saturate( ( ( Height_Snow234 + 0.5 ) * _SnowDisplacementStrength ) ) * ( v.normal * saturate( ( ( ase_worldNormal.y - 0.3 ) * Snow_Amount199 ) ) ) );
				#else
				float3 staticSwitch1257 = float3(0,0,0);
				#endif
				float3 Snow_Displacement707 = staticSwitch1257;
				float4 tex2DNode22 = tex2Dlod( _BaseMask, float4( Global_UV170, 0, 1.0) );
				float HEIGHT305 = tex2DNode22.b;
				float3 ase_worldTangent = UnityObjectToWorldDir(v.tangent);
				float ase_vertexTangentSign = v.tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 ase_worldViewDir = UnityWorldSpaceViewDir(ase_worldPos);
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float ase_faceVertex = (dot(ase_tanViewDir,float3(0,0,1)));
				float4 appendResult935 = (float4(ase_worldPos.x , ase_worldPos.z , 0.0 , 0.0));
				float simpleNoise921 = SimpleNoise( appendResult935.xy*_PuddleCoverageNoise );
				simpleNoise921 = simpleNoise921*2 - 1;
				#ifdef _ENVIROREMOVALZONES_ON
				float staticSwitch1464 = saturate( ( RemovalZoneMask1467 + _EnviroWetness ) );
				#else
				float staticSwitch1464 = _EnviroWetness;
				#endif
				float Wetness163 = staticSwitch1464;
				float switchResult1401 = (((ase_faceVertex>0)?(saturate( ( ( ( ase_worldNormal.y - 0.9 ) * ( ( saturate( ( _PuddleIntensity * simpleNoise921 ) ) * saturate( ( 2.0 - Snow_Amount199 ) ) ) * Wetness163 ) ) * 8.0 ) )):(0.0)));
				#ifdef _PUDDLES_ON
				float staticSwitch996 = switchResult1401;
				#else
				float staticSwitch996 = 0.0;
				#endif
				float Puddle_Mask584 = staticSwitch996;
				#ifdef _TESSELLATION_ON
				float3 staticSwitch1362 = ( Snow_Displacement707 + ( v.normal * ( ( HEIGHT305 * ( 1.0 - Puddle_Mask584 ) ) * _DisplacementStrength ) ) );
				#else
				float3 staticSwitch1362 = float3(0,0,0);
				#endif
				
				o.ase_texcoord8.xy = v.ase_texcoord.xy;
				o.ase_texcoord9 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord8.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = staticSwitch1362;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.vertex.w = 1;
				v.normal = v.normal;
				v.tangent = v.tangent;

				o.pos = UnityObjectToClipPos(v.vertex);
				float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				fixed3 worldNormal = UnityObjectToWorldNormal(v.normal);
				fixed3 worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
				fixed tangentSign = v.tangent.w * unity_WorldTransformParams.w;
				fixed3 worldBinormal = cross(worldNormal, worldTangent) * tangentSign;
				o.tSpace0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x);
				o.tSpace1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y);
				o.tSpace2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z);

				#ifdef DYNAMICLIGHTMAP_ON
					o.lmap.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#else
					o.lmap.zw = 0;
				#endif
				#ifdef LIGHTMAP_ON
					o.lmap.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					#ifdef DIRLIGHTMAP_OFF
						o.lmapFadePos.xyz = (mul(unity_ObjectToWorld, v.vertex).xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w;
						o.lmapFadePos.w = (-UnityObjectToViewPos(v.vertex).z) * (1.0 - unity_ShadowFadeCenterAndType.w);
					#endif
				#else
					o.lmap.xy = 0;
					#if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
						o.sh = 0;
						o.sh = ShadeSHPerVertex (worldNormal, o.sh);
					#endif
				#endif
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( appdata v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.tangent = v.tangent;
				o.normal = v.normal;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessellationFactor; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, UNITY_MATRIX_M, _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			v2f DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				appdata o = (appdata) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.tangent = patch[0].tangent * bary.x + patch[1].tangent * bary.y + patch[2].tangent * bary.z;
				o.normal = patch[0].normal * bary.x + patch[1].normal * bary.y + patch[2].normal * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].normal * (dot(o.vertex.xyz, patch[i].normal) - dot(patch[i].vertex.xyz, patch[i].normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			v2f vert ( appdata v )
			{
				return VertexFunction( v );
			}
			#endif

			void frag (v2f IN , bool ase_vface : SV_IsFrontFace
				, out half4 outGBuffer0 : SV_Target0
				, out half4 outGBuffer1 : SV_Target1
				, out half4 outGBuffer2 : SV_Target2
				, out half4 outEmission : SV_Target3
				#if defined(SHADOWS_SHADOWMASK) && (UNITY_ALLOWED_MRT_COUNT > 4)
				, out half4 outShadowMask : SV_Target4
				#endif
				#ifdef _DEPTHOFFSET_ON
				, out float outputDepth : SV_Depth
				#endif
			)
			{
				UNITY_SETUP_INSTANCE_ID(IN);

				#ifdef LOD_FADE_CROSSFADE
					UNITY_APPLY_DITHER_CROSSFADE(IN.pos.xy);
				#endif

				#if defined(_SPECULAR_SETUP)
					SurfaceOutputStandardSpecular o = (SurfaceOutputStandardSpecular)0;
				#else
					SurfaceOutputStandard o = (SurfaceOutputStandard)0;
				#endif
				float3 WorldTangent = float3(IN.tSpace0.x,IN.tSpace1.x,IN.tSpace2.x);
				float3 WorldBiTangent = float3(IN.tSpace0.y,IN.tSpace1.y,IN.tSpace2.y);
				float3 WorldNormal = float3(IN.tSpace0.z,IN.tSpace1.z,IN.tSpace2.z);
				float3 worldPos = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 worldViewDir = normalize(UnityWorldSpaceViewDir(worldPos));
				half atten = 1;

				float2 appendResult286 = (float2(_TilingOffset.x , _TilingOffset.y));
				float2 appendResult287 = (float2(_TilingOffset.z , _TilingOffset.w));
				float2 texCoord44 = IN.ase_texcoord8.xy * appendResult286 + appendResult287;
				float2 Global_UV170 = texCoord44;
				float2 Parallax_UV178 = Global_UV170;
				float4 tex2DNode17 = tex2D( _MainTex, Parallax_UV178 );
				float4 Albedo_Base195 = tex2DNode17;
				float2 appendResult261 = (float2(_DetailTilingOffset.x , _DetailTilingOffset.y));
				float2 appendResult262 = (float2(_DetailTilingOffset.z , _DetailTilingOffset.w));
				float2 texCoord257 = IN.ase_texcoord8.xy * appendResult261 + appendResult262;
				float4 Detail_Albedo248 = tex2D( _DetailAlbedoMap, texCoord257 );
				float4 tex2DNode22 = tex2D( _BaseMask, Global_UV170 );
				float HEIGHT305 = tex2DNode22.b;
				float2 appendResult256 = (float2(_DetailMaskTiling , _DetailMaskTiling));
				float2 texCoord254 = IN.ase_texcoord8.xy * appendResult256 + float2( 0,0 );
				float HeightMask1341 = saturate(pow(max( (((HEIGHT305*tex2D( _Mask, texCoord254 ).r)*4)+(tex2D( _Mask, texCoord254 ).r*2)), 0 ),_DetailHeightBlendStrength));
				float simpleNoise1239 = SimpleNoise( texCoord254*_DetailProceduralMaskScale );
				simpleNoise1239 = simpleNoise1239*2 - 1;
				float HeightMask1249 = saturate(pow(max( (((HEIGHT305*saturate( ( simpleNoise1239 * _DetailProceduralMaskIntensity ) ))*4)+(saturate( ( simpleNoise1239 * _DetailProceduralMaskIntensity ) )*2)), 0 ),_DetailHeightBlendStrength));
				float4 transform1329 = mul(unity_ObjectToWorld,float4( IN.ase_texcoord9.xyz , 0.0 ));
				float smoothstepResult1323 = smoothstep( ( _DetailHeight - 1.0 ) , ( _DetailHeight + 1.0 ) , transform1329.y);
				float4 appendResult935 = (float4(worldPos.x , worldPos.z , 0.0 , 0.0));
				float simpleNoise921 = SimpleNoise( appendResult935.xy*_PuddleCoverageNoise );
				simpleNoise921 = simpleNoise921*2 - 1;
				float density5_g5 = 0.0;
				float3 wpos5_g5 = worldPos;
				float localEnviroZonesFunction5_g5 = EnviroZonesFunction( density5_g5 , wpos5_g5 );
				float RemovalZoneMask1467 = localEnviroZonesFunction5_g5;
				#ifdef _ENVIROREMOVALZONES_ON
				float staticSwitch1456 = ( saturate( ( RemovalZoneMask1467 + _EnviroSnow ) ) * 2.0 );
				#else
				float staticSwitch1456 = ( _EnviroSnow * 2.0 );
				#endif
				float Snow_Amount199 = staticSwitch1456;
				#ifdef _ENVIROREMOVALZONES_ON
				float staticSwitch1464 = saturate( ( RemovalZoneMask1467 + _EnviroWetness ) );
				#else
				float staticSwitch1464 = _EnviroWetness;
				#endif
				float Wetness163 = staticSwitch1464;
				float switchResult1401 = (((ase_vface>0)?(saturate( ( ( ( WorldNormal.y - 0.9 ) * ( ( saturate( ( _PuddleIntensity * simpleNoise921 ) ) * saturate( ( 2.0 - Snow_Amount199 ) ) ) * Wetness163 ) ) * 8.0 ) )):(0.0)));
				#ifdef _PUDDLES_ON
				float staticSwitch996 = switchResult1401;
				#else
				float staticSwitch996 = 0.0;
				#endif
				float Puddle_Mask584 = staticSwitch996;
				#ifdef _PUDDLES_ON
				float staticSwitch659 = saturate( ( _BumpScale - Puddle_Mask584 ) );
				#else
				float staticSwitch659 = _BumpScale;
				#endif
				float3 Normal_Base209 = UnpackScaleNormal( tex2D( _BumpMap, Parallax_UV178 ), staticSwitch659 );
				float3x3 ase_tangentToWorldFast = float3x3(WorldTangent.x,WorldBiTangent.x,WorldNormal.x,WorldTangent.y,WorldBiTangent.y,WorldNormal.y,WorldTangent.z,WorldBiTangent.z,WorldNormal.z);
				float3 tangentToWorldDir1332 = mul( ase_tangentToWorldFast, Normal_Base209 );
				float lerpResult1436 = lerp( 1.0 , tangentToWorldDir1332.y , _DetailNormalInfluence);
				float smoothstepResult1335 = smoothstep( 0.0 , ( 1.0 - _DetailThreshold ) , ( smoothstepResult1323 * lerpResult1436 ));
				float HeightMask1342 = saturate(pow(max( (((HEIGHT305*smoothstepResult1335)*4)+(smoothstepResult1335*2)), 0 ),_DetailHeightBlendStrength));
				#if defined( _DETAILPROCEDURALMASK_OFF )
				float staticSwitch1238 = 0.0;
				#elif defined( _DETAILPROCEDURALMASK_MASK )
				float staticSwitch1238 = HeightMask1341;
				#elif defined( _DETAILPROCEDURALMASK_PROCEDURAL )
				float staticSwitch1238 = HeightMask1249;
				#elif defined( _DETAILPROCEDURALMASK_HEIGHT )
				float staticSwitch1238 = HeightMask1342;
				#else
				float staticSwitch1238 = 0.0;
				#endif
				float Mask253 = saturate( staticSwitch1238 );
				float HeightMask264 = saturate(pow(((HEIGHT305*Mask253)*4)+(Mask253*2),1.0));
				float Detail_Blending277 = HeightMask264;
				float4 lerpResult265 = lerp( ( Albedo_Base195 * _Color ) , ( Detail_Albedo248 * _DetailTint ) , Detail_Blending277);
				float4 lerpResult964 = lerp( float4( 1,1,1,0 ) , _PuddleColor , Puddle_Mask584);
				#ifdef _PUDDLES_ON
				float4 staticSwitch959 = ( lerpResult265 * lerpResult964 );
				#else
				float4 staticSwitch959 = lerpResult265;
				#endif
				float2 temp_cast_2 = (_SnowTiling).xx;
				float2 texCoord1385 = IN.ase_texcoord8.xy * temp_cast_2 + Global_UV170;
				float4 Albedo_Snow198 = tex2D( _SnowAlbedo, texCoord1385 );
				float3 worldSpaceLightDir = UnityWorldSpaceLightDir(worldPos);
				float3 Detail_Normal249 = UnpackScaleNormal( tex2D( _DetailNormalMap, texCoord257 ), _DetailNormalMapScale );
				float3 lerpResult283 = lerp( Normal_Base209 , Detail_Normal249 , Detail_Blending277);
				float3x3 ase_worldToTangent = float3x3(WorldTangent,WorldBiTangent,WorldNormal);
				#ifdef _PUDDLES_ON
				float staticSwitch766 = saturate( ( _GlobalNormalIntensity - Puddle_Mask584 ) );
				#else
				float staticSwitch766 = _GlobalNormalIntensity;
				#endif
				float3 triplanar720 = TriplanarSampling720( _GlobalNormal, worldPos, WorldNormal, 1.0, _GlobalNormalTiling, staticSwitch766, 0 );
				float3 tanTriplanarNormal720 = mul( ase_worldToTangent, triplanar720 );
				float3 Global_Normal688 = tanTriplanarNormal720;
				#ifdef _GLOBALDETAILNORMAL_ON
				float3 staticSwitch1431 = BlendNormals( lerpResult283 , Global_Normal688 );
				#else
				float3 staticSwitch1431 = lerpResult283;
				#endif
				float3 Normal_Snow211 = UnpackScaleNormal( tex2D( _SnowNormal, texCoord1385 ), _SnowNormalScale );
				float switchResult1311 = (((ase_vface>0)?(( WorldNormal.y * Snow_Amount199 )):(0.0)));
				float temp_output_10_0 = saturate( switchResult1311 );
				float3 lerpResult11 = lerp( staticSwitch1431 , Normal_Snow211 , temp_output_10_0);
				#ifdef _SNOW_ON
				float3 staticSwitch1261 = lerpResult11;
				#else
				float3 staticSwitch1261 = staticSwitch1431;
				#endif
				float3 Normal_Combined213 = staticSwitch1261;
				float3 tangentToWorldDir1209 = mul( ase_tangentToWorldFast, Normal_Combined213 );
				float dotResult72 = dot( worldViewDir , -( worldSpaceLightDir + ( tangentToWorldDir1209 * _SSSDistortion ) ) );
				float dotResult82 = dot( dotResult72 , _SSSScale );
				float SSS184 = ( saturate( dotResult82 ) * _SSSIntensity );
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal12 = Normal_Combined213;
				float3 worldNormal12 = float3(dot(tanToWorld0,tanNormal12), dot(tanToWorld1,tanNormal12), dot(tanToWorld2,tanNormal12));
				float switchResult1310 = (((ase_vface>0)?(saturate( ( worldNormal12.y * Snow_Amount199 ) )):(0.0)));
				#ifdef _SNOW_ON
				float staticSwitch1259 = switchResult1310;
				#else
				float staticSwitch1259 = 0.0;
				#endif
				float Snow_Blend_Normal205 = staticSwitch1259;
				float4 lerpResult16 = lerp( staticSwitch959 , ( Albedo_Snow198 + SSS184 ) , Snow_Blend_Normal205);
				#ifdef _SNOW_ON
				float4 staticSwitch1253 = lerpResult16;
				#else
				float4 staticSwitch1253 = staticSwitch959;
				#endif
				float4 temp_output_40_0 = ( staticSwitch1253 + (0.0 + (Wetness163 - 0.0) * (-0.01 - 0.0) / (1.0 - 0.0)) );
				float Opacity1274 = tex2DNode17.a;
				float TintAlpha1273 = _Color.a;
				float temp_output_1277_0 = ( Opacity1274 * TintAlpha1273 );
				#ifdef _SNOW_ON
				float staticSwitch1294 = ( temp_output_1277_0 + ( Snow_Blend_Normal205 * 2.0 ) );
				#else
				float staticSwitch1294 = temp_output_1277_0;
				#endif
				#if defined( _RENDERING_CUTOUT )
				float staticSwitch1478 = temp_output_1277_0;
				#elif defined( _RENDERING_FADE )
				float staticSwitch1478 = staticSwitch1294;
				#elif defined( _RENDERING_TRANSPARENT )
				float staticSwitch1478 = staticSwitch1294;
				#elif defined( _RENDERING_OPAQUE )
				float staticSwitch1478 = staticSwitch1294;
				#else
				float staticSwitch1478 = staticSwitch1294;
				#endif
				float BaseAlpha1283 = saturate( ( staticSwitch1478 + _Opacity ) );
				#if defined( _RENDERING_CUTOUT )
				float4 staticSwitch1284 = temp_output_40_0;
				#elif defined( _RENDERING_FADE )
				float4 staticSwitch1284 = temp_output_40_0;
				#elif defined( _RENDERING_TRANSPARENT )
				float4 staticSwitch1284 = ( temp_output_40_0 * BaseAlpha1283 );
				#elif defined( _RENDERING_OPAQUE )
				float4 staticSwitch1284 = temp_output_40_0;
				#else
				float4 staticSwitch1284 = temp_output_40_0;
				#endif
				float4 Albedo_Final224 = staticSwitch1284;
				
				float3 surf_pos107_g55 = worldPos;
				float3 surf_norm107_g55 = WorldNormal;
				#ifdef _ENVIROREMOVALZONES_ON
				float staticSwitch1468 = saturate( ( RemovalZoneMask1467 + _EnviroRainIntensity ) );
				#else
				float staticSwitch1468 = _EnviroRainIntensity;
				#endif
				float RainIntensity233 = staticSwitch1468;
				float temp_output_1156_0 = (1.0 + (( _RainFlowStrength * RainIntensity233 ) - 0.0) * (-1.0 - 1.0) / (1.0 - 0.0));
				float temp_output_1039_0 = ( _Time.y * 0.05 );
				float4 transform1024 = mul(unity_ObjectToWorld,float4( IN.ase_texcoord9.xyz , 0.0 ));
				float2 appendResult1027 = (float2(( transform1024.z * 0.7 ) , ( transform1024.y * 0.2 )));
				float2 panner1030 = ( temp_output_1039_0 * float2( 0,1 ) + ( appendResult1027 * _RainFlowTiling ));
				float2 texCoord649 = IN.ase_texcoord8.xy * float2( 10,10 ) + float2( 0,0 );
				float gradientNoise650 = UnityGradientNoise(texCoord649,_RainFlowDistortionScale);
				gradientNoise650 = gradientNoise650*0.5 + 0.5;
				float Distortion655 = ( gradientNoise650 * _RainFlowDistortionStrenght );
				float simpleNoise1021 = SimpleNoise( ( panner1030 + Distortion655 )*100.0 );
				simpleNoise1021 = simpleNoise1021*2 - 1;
				float smoothstepResult1071 = smoothstep( temp_output_1156_0 , 1.0 , simpleNoise1021);
				float temp_output_1047_0 = ( ( ( WorldNormal.y - 0.7 ) * -1.0 ) * _RainFlowIntensity );
				float3 temp_cast_5 = (0.3).xxx;
				float3 break1080 = ( abs( WorldNormal ) - temp_cast_5 );
				float lerpResult1081 = lerp( 0.0 , ( smoothstepResult1071 * temp_output_1047_0 ) , break1080.x);
				float4 transform1025 = mul(unity_ObjectToWorld,float4( IN.ase_texcoord9.xyz , 0.0 ));
				float2 appendResult1026 = (float2(( transform1025.x * 0.7 ) , ( transform1025.y * 0.2 )));
				float2 panner1031 = ( temp_output_1039_0 * float2( 0,1 ) + ( appendResult1026 * _RainFlowTiling ));
				float simpleNoise1028 = SimpleNoise( ( panner1031 + Distortion655 )*100.0 );
				simpleNoise1028 = simpleNoise1028*2 - 1;
				float smoothstepResult1070 = smoothstep( temp_output_1156_0 , 1.0 , simpleNoise1028);
				float lerpResult1082 = lerp( 0.0 , ( smoothstepResult1070 * temp_output_1047_0 ) , break1080.z);
				float Rain_Distance_Fade1154 = ( 1.0 - sqrt( saturate( ( distance( worldPos , _WorldSpaceCameraPos ) / _RainDistanceFade ) ) ) );
				float switchResult1400 = (((ase_vface>0)?(( ( lerpResult1081 + lerpResult1082 ) * Rain_Distance_Fade1154 )):(0.0)));
				float temp_output_1075_0 = saturate( switchResult1400 );
				float height107_g55 = temp_output_1075_0;
				float scale107_g55 = 0.1;
				float3 localPerturbNormal107_g55 = PerturbNormal107_g55( surf_pos107_g55 , surf_norm107_g55 , height107_g55 , scale107_g55 );
				float3 worldToTangentDir42_g55 = mul( ase_worldToTangent, localPerturbNormal107_g55);
				float3 RainFlow411 = worldToTangentDir42_g55;
				float localRainRipples1_g54 = ( 0.0 );
				float4 transform1427 = mul(unity_ObjectToWorld,float4( IN.ase_texcoord9.xyz , 0.0 ));
				float2 appendResult1422 = (float2(transform1427.x , transform1427.z));
				float2 UV1_g54 = ( appendResult1422 * _RainDropTiling );
				float AngleOffset1_g54 = 5.0;
				float lerpResult1419 = lerp( 64.0 , 12.0 , Puddle_Mask584);
				float CellDensity1_g54 = round( lerpResult1419 );
				float Time1_g54 = ( _Time.y * _RainDropSpeed );
				float temp_output_1128_0 = ( _RainDropIntensity * 1.5 );
				float lerpResult1126 = lerp( _RainDropIntensity , temp_output_1128_0 , Puddle_Mask584);
				#ifdef _PUDDLES_ON
				float staticSwitch1129 = lerpResult1126;
				#else
				float staticSwitch1129 = temp_output_1128_0;
				#endif
				float switchResult1402 = (((ase_vface>0)?(( ( ( WorldNormal.y - 0.8 ) * ( staticSwitch1129 * RainIntensity233 ) ) * Rain_Distance_Fade1154 )):(0.0)));
				float Strength1_g54 = max( 0.0 , switchResult1402 );
				float3 normal1_g54 = float3( 0,0,0 );
				float Out1_g54 = 0.0;
				float lerpResult1002 = lerp( 5.0 , 8.0 , Puddle_Mask584);
				float pow1_g54 = lerpResult1002;
				float lerpResult1004 = lerp( 1.0 , 0.0 , Puddle_Mask584);
				float sin1_g54 = lerpResult1004;
				{
				Rain(UV1_g54,AngleOffset1_g54,CellDensity1_g54,Time1_g54,Strength1_g54,pow1_g54,sin1_g54,Out1_g54,normal1_g54);
				}
				float3 temp_output_1392_9 = normal1_g54;
				float3 Rain_Drop341 = temp_output_1392_9;
				#ifdef _RAIN_ON
				float3 staticSwitch639 = BlendNormals( Normal_Combined213 , BlendNormals( RainFlow411 , Rain_Drop341 ) );
				#else
				float3 staticSwitch639 = Normal_Combined213;
				#endif
				float temp_output_729_0 = ( _Time.y * 0.05 );
				float2 appendResult1414 = (float2(worldPos.x , worldPos.z));
				float2 temp_output_1415_0 = ( appendResult1414 * _PuddleWaveTiling );
				float2 panner734 = ( temp_output_729_0 * float2( 1,0 ) + temp_output_1415_0);
				float temp_output_735_0 = ( Puddle_Mask584 * ( _PuddleWaveIntensity * Wetness163 ) );
				float2 panner736 = ( temp_output_729_0 * float2( 0,1 ) + temp_output_1415_0);
				float3 Puddle740 = BlendNormals( UnpackScaleNormal( tex2D( _WaveNormal, panner734 ), temp_output_735_0 ) , UnpackScaleNormal( tex2D( _WaveNormal, panner736 ), temp_output_735_0 ) );
				#ifdef _PUDDLES_ON
				float3 staticSwitch628 = BlendNormals( staticSwitch639 , Puddle740 );
				#else
				float3 staticSwitch628 = staticSwitch639;
				#endif
				float3 Normals_Final216 = staticSwitch628;
				
				#ifdef _EMISSION_ON
				float4 staticSwitch1432 = ( tex2D( _EmissionMap, Parallax_UV178 ) * _EmissionColor );
				#else
				float4 staticSwitch1432 = float4(0,0,0,0);
				#endif
				float4 Emission_Final678 = staticSwitch1432;
				
				float Metallic_Base187 = tex2DNode22.r;
				float4 tex2DNode1211 = tex2D( _DetailMask, texCoord257 );
				float Detail_Metallic1212 = tex2DNode1211.r;
				float lerpResult1231 = lerp( saturate( ( Metallic_Base187 + _MetallicBase ) ) , saturate( ( Detail_Metallic1212 + _MetallicDetail ) ) , Mask253);
				float4 tex2DNode1387 = tex2D( _SnowMask, texCoord1385 );
				float Metallic_Snow189 = tex2DNode1387.r;
				float lerpResult15 = lerp( lerpResult1231 , Metallic_Snow189 , Snow_Blend_Normal205);
				#ifdef _SNOW_ON
				float staticSwitch1254 = lerpResult15;
				#else
				float staticSwitch1254 = lerpResult1231;
				#endif
				float Metallic_Final218 = staticSwitch1254;
				
				float Smoothness663 = tex2DNode22.a;
				float Smothness_Detail665 = tex2DNode1211.a;
				float lerpResult671 = lerp( ( ( Smoothness663 * _Smoothness ) + _SmoothnessAdd ) , ( ( Smothness_Detail665 * _SmoothnessDetail ) + _SmoothnessDetailAdd ) , Mask253);
				float lerpResult37 = lerp( 0.0 , _SmoothnessWet , Wetness163);
				#ifdef _PUDDLES_ON
				float staticSwitch629 = ( lerpResult37 + saturate( ( Puddle_Mask584 - 0.2 ) ) );
				#else
				float staticSwitch629 = lerpResult37;
				#endif
				float RainDropSmoothness870 = ( Out1_g54 * 0.25 );
				float RainFlowSmoothness1087 = ( temp_output_1075_0 * _RainFlowSmoothnessBoost );
				#ifdef _RAIN_ON
				float staticSwitch944 = ( ( staticSwitch629 + RainDropSmoothness870 ) + RainFlowSmoothness1087 );
				#else
				float staticSwitch944 = staticSwitch629;
				#endif
				float temp_output_674_0 = ( lerpResult671 + staticSwitch944 );
				float Smothness_Snow664 = tex2DNode1387.a;
				float lerpResult668 = lerp( temp_output_674_0 , Smothness_Snow664 , Snow_Blend_Normal205);
				#ifdef _SNOW_ON
				float staticSwitch1256 = lerpResult668;
				#else
				float staticSwitch1256 = temp_output_674_0;
				#endif
				float Smoothness_Final220 = saturate( staticSwitch1256 );
				
				float Occlusion_Base193 = tex2DNode22.g;
				float Detail_Occlusion1213 = tex2DNode1211.g;
				float lerpResult1236 = lerp( Occlusion_Base193 , Detail_Occlusion1213 , Mask253);
				float Occlusion_Snow191 = tex2DNode1387.g;
				float lerpResult27 = lerp( lerpResult1236 , Occlusion_Snow191 , Snow_Blend_Normal205);
				#ifdef _SNOW_ON
				float staticSwitch1255 = lerpResult27;
				#else
				float staticSwitch1255 = lerpResult1236;
				#endif
				float lerpResult969 = lerp( 1.0 , staticSwitch1255 , _OcclusionStrength);
				#ifdef _PUDDLES_ON
				float staticSwitch970 = saturate( ( lerpResult969 + Puddle_Mask584 ) );
				#else
				float staticSwitch970 = lerpResult969;
				#endif
				float Occlusion_Final222 = staticSwitch970;
				
				#if defined( _RENDERING_CUTOUT )
				float staticSwitch1279 = BaseAlpha1283;
				#elif defined( _RENDERING_FADE )
				float staticSwitch1279 = BaseAlpha1283;
				#elif defined( _RENDERING_TRANSPARENT )
				float staticSwitch1279 = BaseAlpha1283;
				#elif defined( _RENDERING_OPAQUE )
				float staticSwitch1279 = 1.0;
				#else
				float staticSwitch1279 = 1.0;
				#endif
				float OpacityFinal1278 = staticSwitch1279;
				
				#if defined( _RENDERING_CUTOUT )
				float staticSwitch1288 = _CutOff;
				#elif defined( _RENDERING_FADE )
				float staticSwitch1288 = 0.0;
				#elif defined( _RENDERING_TRANSPARENT )
				float staticSwitch1288 = 0.0;
				#elif defined( _RENDERING_OPAQUE )
				float staticSwitch1288 = 0.0;
				#else
				float staticSwitch1288 = 0.0;
				#endif
				float OpacityMaskFinal1289 = staticSwitch1288;
				
				o.Albedo = Albedo_Final224.rgb;
				o.Normal = Normals_Final216;
				o.Emission = Emission_Final678.xyz;
				#if defined(_SPECULAR_SETUP)
					o.Specular = fixed3( 0, 0, 0 );
				#else
					o.Metallic = Metallic_Final218;
				#endif
				o.Smoothness = Smoothness_Final220;
				o.Occlusion = Occlusion_Final222;
				o.Alpha = OpacityFinal1278;
				float AlphaClipThreshold = OpacityMaskFinal1289;
				float3 BakedGI = 0;

				#ifdef _ALPHATEST_ON
					clip( o.Alpha - AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
					outputDepth = IN.pos.z;
				#endif

				#ifndef USING_DIRECTIONAL_LIGHT
					fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
				#else
					fixed3 lightDir = _WorldSpaceLightPos0.xyz;
				#endif

				float3 worldN;
				worldN.x = dot(IN.tSpace0.xyz, o.Normal);
				worldN.y = dot(IN.tSpace1.xyz, o.Normal);
				worldN.z = dot(IN.tSpace2.xyz, o.Normal);
				worldN = normalize(worldN);
				o.Normal = worldN;

				UnityGI gi;
				UNITY_INITIALIZE_OUTPUT(UnityGI, gi);
				gi.indirect.diffuse = 0;
				gi.indirect.specular = 0;
				gi.light.color = 0;
				gi.light.dir = half3(0,1,0);

				UnityGIInput giInput;
				UNITY_INITIALIZE_OUTPUT(UnityGIInput, giInput);
				giInput.light = gi.light;
				giInput.worldPos = worldPos;
				giInput.worldViewDir = worldViewDir;
				giInput.atten = atten;
				#if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
					giInput.lightmapUV = IN.lmap;
				#else
					giInput.lightmapUV = 0.0;
				#endif
				#if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
					giInput.ambient = IN.sh;
				#else
					giInput.ambient.rgb = 0.0;
				#endif
				giInput.probeHDR[0] = unity_SpecCube0_HDR;
				giInput.probeHDR[1] = unity_SpecCube1_HDR;
				#if defined(UNITY_SPECCUBE_BLENDING) || defined(UNITY_SPECCUBE_BOX_PROJECTION)
					giInput.boxMin[0] = unity_SpecCube0_BoxMin;
				#endif
				#ifdef UNITY_SPECCUBE_BOX_PROJECTION
					giInput.boxMax[0] = unity_SpecCube0_BoxMax;
					giInput.probePosition[0] = unity_SpecCube0_ProbePosition;
					giInput.boxMax[1] = unity_SpecCube1_BoxMax;
					giInput.boxMin[1] = unity_SpecCube1_BoxMin;
					giInput.probePosition[1] = unity_SpecCube1_ProbePosition;
				#endif

				#if defined(_SPECULAR_SETUP)
					LightingStandardSpecular_GI( o, giInput, gi );
				#else
					LightingStandard_GI( o, giInput, gi );
				#endif

				#ifdef ASE_BAKEDGI
					gi.indirect.diffuse = BakedGI;
				#endif

				#if UNITY_SHOULD_SAMPLE_SH && !defined(LIGHTMAP_ON) && defined(ASE_NO_AMBIENT)
					gi.indirect.diffuse = 0;
				#endif

				#if defined(_SPECULAR_SETUP)
					outEmission = LightingStandardSpecular_Deferred( o, worldViewDir, gi, outGBuffer0, outGBuffer1, outGBuffer2 );
				#else
					outEmission = LightingStandard_Deferred( o, worldViewDir, gi, outGBuffer0, outGBuffer1, outGBuffer2 );
				#endif

				#if defined(SHADOWS_SHADOWMASK) && (UNITY_ALLOWED_MRT_COUNT > 4)
					outShadowMask = UnityGetRawBakedOcclusions (IN.lmap.xy, float3(0, 0, 0));
				#endif
				#ifndef UNITY_HDR_ON
					outEmission.rgb = exp2(-outEmission.rgb);
				#endif
			}
			ENDCG
		}

		
		Pass
		{
			
			Name "Meta"
			Tags { "LightMode"="Meta" }
			Cull Off

			CGPROGRAM
			#define ASE_NEEDS_FRAG_SHADOWCOORDS
			#pragma multi_compile_instancing
			#pragma multi_compile __ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_TESSELLATION 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_DISTANCE_TESSELLATION
			#define _ALPHATEST_ON 1

			#pragma vertex vert
			#pragma fragment frag
			#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
			#pragma shader_feature EDITOR_VISUALIZATION
			#ifndef UNITY_PASS_META
				#define UNITY_PASS_META
			#endif
			#include "HLSLSupport.cginc"
			#if !defined( UNITY_INSTANCED_LOD_FADE )
				#define UNITY_INSTANCED_LOD_FADE
			#endif
			#if !defined( UNITY_INSTANCED_SH )
				#define UNITY_INSTANCED_SH
			#endif
			#if !defined( UNITY_INSTANCED_LIGHTMAPSTS )
				#define UNITY_INSTANCED_LIGHTMAPSTS
			#endif
			#include "UnityShaderVariables.cginc"
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			#include "UnityMetaPass.cginc"

			#include "UnityStandardUtils.cginc"
			#include "AutoLight.cginc"
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#pragma shader_feature_local _TESSELLATION_ON
			#pragma shader_feature_local _SNOW_ON
			#pragma shader_feature_local _ENVIROREMOVALZONES_ON
			#pragma shader_feature_local _PUDDLES_ON
			#pragma shader_feature_local _RENDERING_CUTOUT _RENDERING_FADE _RENDERING_TRANSPARENT _RENDERING_OPAQUE
			#pragma shader_feature_local _DETAILPROCEDURALMASK_OFF _DETAILPROCEDURALMASK_MASK _DETAILPROCEDURALMASK_PROCEDURAL _DETAILPROCEDURALMASK_HEIGHT
			#pragma shader_feature_local _GLOBALDETAILNORMAL_ON
			#pragma shader_feature_local _EMISSION_ON
			#include "EnviroInclude.hlsl"

			struct appdata {
				float4 vertex : POSITION;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			struct v2f {
				#if UNITY_VERSION >= 201810
					UNITY_POSITION(pos);
				#else
					float4 pos : SV_POSITION;
				#endif
				#ifdef EDITOR_VISUALIZATION
					float2 vizUV : TEXCOORD1;
					float4 lightCoord : TEXCOORD2;
				#endif
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			uniform int _SrcBlend;
			uniform int _DstBlend;
			uniform int _ZWrite;
			uniform int _CullMode;
			uniform float _TessellationFactor;
			uniform sampler2D _SnowMask;
			uniform float _SnowTiling;
			uniform float4 _TilingOffset;
			uniform float _SnowDisplacementStrength;
			uniform float _EnviroSnow;
			uniform sampler2D _BaseMask;
			uniform float _PuddleIntensity;
			uniform float _PuddleCoverageNoise;
			uniform float _EnviroWetness;
			uniform float _DisplacementStrength;
			uniform sampler2D _MainTex;
			uniform float4 _Color;
			uniform sampler2D _DetailAlbedoMap;
			uniform float4 _DetailTilingOffset;
			uniform float4 _DetailTint;
			uniform sampler2D _Mask;
			uniform float _DetailMaskTiling;
			uniform float _DetailHeightBlendStrength;
			uniform float _DetailProceduralMaskScale;
			uniform float _DetailProceduralMaskIntensity;
			uniform float _DetailThreshold;
			uniform float _DetailHeight;
			uniform sampler2D _BumpMap;
			uniform float _BumpScale;
			uniform float _DetailNormalInfluence;
			uniform float4 _PuddleColor;
			uniform sampler2D _SnowAlbedo;
			uniform sampler2D _DetailNormalMap;
			uniform float _DetailNormalMapScale;
			uniform sampler2D _GlobalNormal;
			uniform float2 _GlobalNormalTiling;
			uniform float _GlobalNormalIntensity;
			uniform sampler2D _SnowNormal;
			uniform float _SnowNormalScale;
			uniform float _SSSDistortion;
			uniform float _SSSScale;
			uniform float _SSSIntensity;
			uniform float _Opacity;
			uniform sampler2D _EmissionMap;
			uniform float4 _EmissionColor;
			uniform float _CutOff;


			//This is a late directive
			
			inline float EnviroZonesFunction( float density, float3 wpos )
			{
				return EnviroRemoveZones(wpos,density);
			}
			
			inline float noise_randomValue (float2 uv) { return frac(sin(dot(uv, float2(12.9898, 78.233)))*43758.5453); }
			inline float noise_interpolate (float a, float b, float t) { return (1.0-t)*a + (t*b); }
			inline float valueNoise (float2 uv)
			{
				float2 i = floor(uv);
				float2 f = frac( uv );
				f = f* f * (3.0 - 2.0 * f);
				uv = abs( frac(uv) - 0.5);
				float2 c0 = i + float2( 0.0, 0.0 );
				float2 c1 = i + float2( 1.0, 0.0 );
				float2 c2 = i + float2( 0.0, 1.0 );
				float2 c3 = i + float2( 1.0, 1.0 );
				float r0 = noise_randomValue( c0 );
				float r1 = noise_randomValue( c1 );
				float r2 = noise_randomValue( c2 );
				float r3 = noise_randomValue( c3 );
				float bottomOfGrid = noise_interpolate( r0, r1, f.x );
				float topOfGrid = noise_interpolate( r2, r3, f.x );
				float t = noise_interpolate( bottomOfGrid, topOfGrid, f.y );
				return t;
			}
			
			float SimpleNoise(float2 UV)
			{
				float t = 0.0;
				float freq = pow( 2.0, float( 0 ) );
				float amp = pow( 0.5, float( 3 - 0 ) );
				t += valueNoise( UV/freq )*amp;
				freq = pow(2.0, float(1));
				amp = pow(0.5, float(3-1));
				t += valueNoise( UV/freq )*amp;
				freq = pow(2.0, float(2));
				amp = pow(0.5, float(3-2));
				t += valueNoise( UV/freq )*amp;
				return t;
			}
			
			inline float3 TriplanarSampling720( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = tex2D( topTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) );
				yNorm = tex2D( topTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) );
				zNorm = tex2D( topTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) );
				xNorm.xyz  = half3( UnpackScaleNormal( xNorm, normalScale.y ).xy * float2(  nsign.x, 1.0 ) + worldNormal.zy, worldNormal.x ).zyx;
				yNorm.xyz  = half3( UnpackScaleNormal( yNorm, normalScale.x ).xy * float2(  nsign.y, 1.0 ) + worldNormal.xz, worldNormal.y ).xzy;
				zNorm.xyz  = half3( UnpackScaleNormal( zNorm, normalScale.y ).xy * float2( -nsign.z, 1.0 ) + worldNormal.xy, worldNormal.z ).xyz;
				return normalize( xNorm.xyz * projNormal.x + yNorm.xyz * projNormal.y + zNorm.xyz * projNormal.z );
			}
			

			v2f VertexFunction (appdata v  ) {
				UNITY_SETUP_INSTANCE_ID(v);
				v2f o;
				UNITY_INITIALIZE_OUTPUT(v2f,o);
				UNITY_TRANSFER_INSTANCE_ID(v,o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float2 temp_cast_0 = (_SnowTiling).xx;
				float2 appendResult286 = (float2(_TilingOffset.x , _TilingOffset.y));
				float2 appendResult287 = (float2(_TilingOffset.z , _TilingOffset.w));
				float2 texCoord44 = v.ase_texcoord.xy * appendResult286 + appendResult287;
				float2 Global_UV170 = texCoord44;
				float2 texCoord1385 = v.ase_texcoord.xy * temp_cast_0 + Global_UV170;
				float4 tex2DNode1387 = tex2Dlod( _SnowMask, float4( texCoord1385, 0, 0.0) );
				float Height_Snow234 = tex2DNode1387.b;
				float3 ase_worldNormal = UnityObjectToWorldNormal(v.normal);
				float density5_g5 = 0.0;
				float3 ase_worldPos = mul(unity_ObjectToWorld, float4( (v.vertex).xyz, 1 )).xyz;
				float3 wpos5_g5 = ase_worldPos;
				float localEnviroZonesFunction5_g5 = EnviroZonesFunction( density5_g5 , wpos5_g5 );
				float RemovalZoneMask1467 = localEnviroZonesFunction5_g5;
				#ifdef _ENVIROREMOVALZONES_ON
				float staticSwitch1456 = ( saturate( ( RemovalZoneMask1467 + _EnviroSnow ) ) * 2.0 );
				#else
				float staticSwitch1456 = ( _EnviroSnow * 2.0 );
				#endif
				float Snow_Amount199 = staticSwitch1456;
				#ifdef _SNOW_ON
				float3 staticSwitch1257 = ( saturate( ( ( Height_Snow234 + 0.5 ) * _SnowDisplacementStrength ) ) * ( v.normal * saturate( ( ( ase_worldNormal.y - 0.3 ) * Snow_Amount199 ) ) ) );
				#else
				float3 staticSwitch1257 = float3(0,0,0);
				#endif
				float3 Snow_Displacement707 = staticSwitch1257;
				float4 tex2DNode22 = tex2Dlod( _BaseMask, float4( Global_UV170, 0, 1.0) );
				float HEIGHT305 = tex2DNode22.b;
				float3 ase_worldTangent = UnityObjectToWorldDir(v.tangent);
				float ase_vertexTangentSign = v.tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 ase_worldViewDir = UnityWorldSpaceViewDir(ase_worldPos);
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float ase_faceVertex = (dot(ase_tanViewDir,float3(0,0,1)));
				float4 appendResult935 = (float4(ase_worldPos.x , ase_worldPos.z , 0.0 , 0.0));
				float simpleNoise921 = SimpleNoise( appendResult935.xy*_PuddleCoverageNoise );
				simpleNoise921 = simpleNoise921*2 - 1;
				#ifdef _ENVIROREMOVALZONES_ON
				float staticSwitch1464 = saturate( ( RemovalZoneMask1467 + _EnviroWetness ) );
				#else
				float staticSwitch1464 = _EnviroWetness;
				#endif
				float Wetness163 = staticSwitch1464;
				float switchResult1401 = (((ase_faceVertex>0)?(saturate( ( ( ( ase_worldNormal.y - 0.9 ) * ( ( saturate( ( _PuddleIntensity * simpleNoise921 ) ) * saturate( ( 2.0 - Snow_Amount199 ) ) ) * Wetness163 ) ) * 8.0 ) )):(0.0)));
				#ifdef _PUDDLES_ON
				float staticSwitch996 = switchResult1401;
				#else
				float staticSwitch996 = 0.0;
				#endif
				float Puddle_Mask584 = staticSwitch996;
				#ifdef _TESSELLATION_ON
				float3 staticSwitch1362 = ( Snow_Displacement707 + ( v.normal * ( ( HEIGHT305 * ( 1.0 - Puddle_Mask584 ) ) * _DisplacementStrength ) ) );
				#else
				float3 staticSwitch1362 = float3(0,0,0);
				#endif
				
				o.ase_texcoord5.xyz = ase_worldNormal;
				o.ase_texcoord6.xyz = ase_worldPos;
				o.ase_texcoord7.xyz = ase_worldTangent;
				o.ase_texcoord8.xyz = ase_worldBitangent;
				
				o.ase_texcoord3.xy = v.ase_texcoord.xy;
				o.ase_texcoord4 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.zw = 0;
				o.ase_texcoord5.w = 0;
				o.ase_texcoord6.w = 0;
				o.ase_texcoord7.w = 0;
				o.ase_texcoord8.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = staticSwitch1362;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.vertex.w = 1;
				v.normal = v.normal;
				v.tangent = v.tangent;

				#ifdef EDITOR_VISUALIZATION
					o.vizUV = 0;
					o.lightCoord = 0;
					if (unity_VisualizationMode == EDITORVIZ_TEXTURE)
						o.vizUV = UnityMetaVizUV(unity_EditorViz_UVIndex, v.texcoord.xy, v.texcoord1.xy, v.texcoord2.xy, unity_EditorViz_Texture_ST);
					else if (unity_VisualizationMode == EDITORVIZ_SHOWLIGHTMASK)
					{
						o.vizUV = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
						o.lightCoord = mul(unity_EditorViz_WorldToLight, mul(unity_ObjectToWorld, float4(v.vertex.xyz, 1)));
					}
				#endif

				o.pos = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST);

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( appdata v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.tangent = v.tangent;
				o.normal = v.normal;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessellationFactor; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, UNITY_MATRIX_M, _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			v2f DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				appdata o = (appdata) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.tangent = patch[0].tangent * bary.x + patch[1].tangent * bary.y + patch[2].tangent * bary.z;
				o.normal = patch[0].normal * bary.x + patch[1].normal * bary.y + patch[2].normal * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].normal * (dot(o.vertex.xyz, patch[i].normal) - dot(patch[i].vertex.xyz, patch[i].normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			v2f vert ( appdata v )
			{
				return VertexFunction( v );
			}
			#endif

			fixed4 frag (v2f IN , bool ase_vface : SV_IsFrontFace
				#ifdef _DEPTHOFFSET_ON
				, out float outputDepth : SV_Depth
				#endif
				) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(IN);

				#ifdef LOD_FADE_CROSSFADE
					UNITY_APPLY_DITHER_CROSSFADE(IN.pos.xy);
				#endif

				#if defined(_SPECULAR_SETUP)
					SurfaceOutputStandardSpecular o = (SurfaceOutputStandardSpecular)0;
				#else
					SurfaceOutputStandard o = (SurfaceOutputStandard)0;
				#endif

				float2 appendResult286 = (float2(_TilingOffset.x , _TilingOffset.y));
				float2 appendResult287 = (float2(_TilingOffset.z , _TilingOffset.w));
				float2 texCoord44 = IN.ase_texcoord3.xy * appendResult286 + appendResult287;
				float2 Global_UV170 = texCoord44;
				float2 Parallax_UV178 = Global_UV170;
				float4 tex2DNode17 = tex2D( _MainTex, Parallax_UV178 );
				float4 Albedo_Base195 = tex2DNode17;
				float2 appendResult261 = (float2(_DetailTilingOffset.x , _DetailTilingOffset.y));
				float2 appendResult262 = (float2(_DetailTilingOffset.z , _DetailTilingOffset.w));
				float2 texCoord257 = IN.ase_texcoord3.xy * appendResult261 + appendResult262;
				float4 Detail_Albedo248 = tex2D( _DetailAlbedoMap, texCoord257 );
				float4 tex2DNode22 = tex2D( _BaseMask, Global_UV170 );
				float HEIGHT305 = tex2DNode22.b;
				float2 appendResult256 = (float2(_DetailMaskTiling , _DetailMaskTiling));
				float2 texCoord254 = IN.ase_texcoord3.xy * appendResult256 + float2( 0,0 );
				float HeightMask1341 = saturate(pow(max( (((HEIGHT305*tex2D( _Mask, texCoord254 ).r)*4)+(tex2D( _Mask, texCoord254 ).r*2)), 0 ),_DetailHeightBlendStrength));
				float simpleNoise1239 = SimpleNoise( texCoord254*_DetailProceduralMaskScale );
				simpleNoise1239 = simpleNoise1239*2 - 1;
				float HeightMask1249 = saturate(pow(max( (((HEIGHT305*saturate( ( simpleNoise1239 * _DetailProceduralMaskIntensity ) ))*4)+(saturate( ( simpleNoise1239 * _DetailProceduralMaskIntensity ) )*2)), 0 ),_DetailHeightBlendStrength));
				float4 transform1329 = mul(unity_ObjectToWorld,float4( IN.ase_texcoord4.xyz , 0.0 ));
				float smoothstepResult1323 = smoothstep( ( _DetailHeight - 1.0 ) , ( _DetailHeight + 1.0 ) , transform1329.y);
				float3 ase_worldNormal = IN.ase_texcoord5.xyz;
				float3 ase_worldPos = IN.ase_texcoord6.xyz;
				float4 appendResult935 = (float4(ase_worldPos.x , ase_worldPos.z , 0.0 , 0.0));
				float simpleNoise921 = SimpleNoise( appendResult935.xy*_PuddleCoverageNoise );
				simpleNoise921 = simpleNoise921*2 - 1;
				float density5_g5 = 0.0;
				float3 wpos5_g5 = ase_worldPos;
				float localEnviroZonesFunction5_g5 = EnviroZonesFunction( density5_g5 , wpos5_g5 );
				float RemovalZoneMask1467 = localEnviroZonesFunction5_g5;
				#ifdef _ENVIROREMOVALZONES_ON
				float staticSwitch1456 = ( saturate( ( RemovalZoneMask1467 + _EnviroSnow ) ) * 2.0 );
				#else
				float staticSwitch1456 = ( _EnviroSnow * 2.0 );
				#endif
				float Snow_Amount199 = staticSwitch1456;
				#ifdef _ENVIROREMOVALZONES_ON
				float staticSwitch1464 = saturate( ( RemovalZoneMask1467 + _EnviroWetness ) );
				#else
				float staticSwitch1464 = _EnviroWetness;
				#endif
				float Wetness163 = staticSwitch1464;
				float switchResult1401 = (((ase_vface>0)?(saturate( ( ( ( ase_worldNormal.y - 0.9 ) * ( ( saturate( ( _PuddleIntensity * simpleNoise921 ) ) * saturate( ( 2.0 - Snow_Amount199 ) ) ) * Wetness163 ) ) * 8.0 ) )):(0.0)));
				#ifdef _PUDDLES_ON
				float staticSwitch996 = switchResult1401;
				#else
				float staticSwitch996 = 0.0;
				#endif
				float Puddle_Mask584 = staticSwitch996;
				#ifdef _PUDDLES_ON
				float staticSwitch659 = saturate( ( _BumpScale - Puddle_Mask584 ) );
				#else
				float staticSwitch659 = _BumpScale;
				#endif
				float3 Normal_Base209 = UnpackScaleNormal( tex2D( _BumpMap, Parallax_UV178 ), staticSwitch659 );
				float3 ase_worldTangent = IN.ase_texcoord7.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord8.xyz;
				float3x3 ase_tangentToWorldFast = float3x3(ase_worldTangent.x,ase_worldBitangent.x,ase_worldNormal.x,ase_worldTangent.y,ase_worldBitangent.y,ase_worldNormal.y,ase_worldTangent.z,ase_worldBitangent.z,ase_worldNormal.z);
				float3 tangentToWorldDir1332 = mul( ase_tangentToWorldFast, Normal_Base209 );
				float lerpResult1436 = lerp( 1.0 , tangentToWorldDir1332.y , _DetailNormalInfluence);
				float smoothstepResult1335 = smoothstep( 0.0 , ( 1.0 - _DetailThreshold ) , ( smoothstepResult1323 * lerpResult1436 ));
				float HeightMask1342 = saturate(pow(max( (((HEIGHT305*smoothstepResult1335)*4)+(smoothstepResult1335*2)), 0 ),_DetailHeightBlendStrength));
				#if defined( _DETAILPROCEDURALMASK_OFF )
				float staticSwitch1238 = 0.0;
				#elif defined( _DETAILPROCEDURALMASK_MASK )
				float staticSwitch1238 = HeightMask1341;
				#elif defined( _DETAILPROCEDURALMASK_PROCEDURAL )
				float staticSwitch1238 = HeightMask1249;
				#elif defined( _DETAILPROCEDURALMASK_HEIGHT )
				float staticSwitch1238 = HeightMask1342;
				#else
				float staticSwitch1238 = 0.0;
				#endif
				float Mask253 = saturate( staticSwitch1238 );
				float HeightMask264 = saturate(pow(((HEIGHT305*Mask253)*4)+(Mask253*2),1.0));
				float Detail_Blending277 = HeightMask264;
				float4 lerpResult265 = lerp( ( Albedo_Base195 * _Color ) , ( Detail_Albedo248 * _DetailTint ) , Detail_Blending277);
				float4 lerpResult964 = lerp( float4( 1,1,1,0 ) , _PuddleColor , Puddle_Mask584);
				#ifdef _PUDDLES_ON
				float4 staticSwitch959 = ( lerpResult265 * lerpResult964 );
				#else
				float4 staticSwitch959 = lerpResult265;
				#endif
				float2 temp_cast_2 = (_SnowTiling).xx;
				float2 texCoord1385 = IN.ase_texcoord3.xy * temp_cast_2 + Global_UV170;
				float4 Albedo_Snow198 = tex2D( _SnowAlbedo, texCoord1385 );
				float3 ase_worldViewDir = UnityWorldSpaceViewDir(ase_worldPos);
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 worldSpaceLightDir = UnityWorldSpaceLightDir(ase_worldPos);
				float3 Detail_Normal249 = UnpackScaleNormal( tex2D( _DetailNormalMap, texCoord257 ), _DetailNormalMapScale );
				float3 lerpResult283 = lerp( Normal_Base209 , Detail_Normal249 , Detail_Blending277);
				float3x3 ase_worldToTangent = float3x3(ase_worldTangent,ase_worldBitangent,ase_worldNormal);
				#ifdef _PUDDLES_ON
				float staticSwitch766 = saturate( ( _GlobalNormalIntensity - Puddle_Mask584 ) );
				#else
				float staticSwitch766 = _GlobalNormalIntensity;
				#endif
				float3 triplanar720 = TriplanarSampling720( _GlobalNormal, ase_worldPos, ase_worldNormal, 1.0, _GlobalNormalTiling, staticSwitch766, 0 );
				float3 tanTriplanarNormal720 = mul( ase_worldToTangent, triplanar720 );
				float3 Global_Normal688 = tanTriplanarNormal720;
				#ifdef _GLOBALDETAILNORMAL_ON
				float3 staticSwitch1431 = BlendNormals( lerpResult283 , Global_Normal688 );
				#else
				float3 staticSwitch1431 = lerpResult283;
				#endif
				float3 Normal_Snow211 = UnpackScaleNormal( tex2D( _SnowNormal, texCoord1385 ), _SnowNormalScale );
				float switchResult1311 = (((ase_vface>0)?(( ase_worldNormal.y * Snow_Amount199 )):(0.0)));
				float temp_output_10_0 = saturate( switchResult1311 );
				float3 lerpResult11 = lerp( staticSwitch1431 , Normal_Snow211 , temp_output_10_0);
				#ifdef _SNOW_ON
				float3 staticSwitch1261 = lerpResult11;
				#else
				float3 staticSwitch1261 = staticSwitch1431;
				#endif
				float3 Normal_Combined213 = staticSwitch1261;
				float3 tangentToWorldDir1209 = mul( ase_tangentToWorldFast, Normal_Combined213 );
				float dotResult72 = dot( ase_worldViewDir , -( worldSpaceLightDir + ( tangentToWorldDir1209 * _SSSDistortion ) ) );
				float dotResult82 = dot( dotResult72 , _SSSScale );
				float SSS184 = ( saturate( dotResult82 ) * _SSSIntensity );
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal12 = Normal_Combined213;
				float3 worldNormal12 = float3(dot(tanToWorld0,tanNormal12), dot(tanToWorld1,tanNormal12), dot(tanToWorld2,tanNormal12));
				float switchResult1310 = (((ase_vface>0)?(saturate( ( worldNormal12.y * Snow_Amount199 ) )):(0.0)));
				#ifdef _SNOW_ON
				float staticSwitch1259 = switchResult1310;
				#else
				float staticSwitch1259 = 0.0;
				#endif
				float Snow_Blend_Normal205 = staticSwitch1259;
				float4 lerpResult16 = lerp( staticSwitch959 , ( Albedo_Snow198 + SSS184 ) , Snow_Blend_Normal205);
				#ifdef _SNOW_ON
				float4 staticSwitch1253 = lerpResult16;
				#else
				float4 staticSwitch1253 = staticSwitch959;
				#endif
				float4 temp_output_40_0 = ( staticSwitch1253 + (0.0 + (Wetness163 - 0.0) * (-0.01 - 0.0) / (1.0 - 0.0)) );
				float Opacity1274 = tex2DNode17.a;
				float TintAlpha1273 = _Color.a;
				float temp_output_1277_0 = ( Opacity1274 * TintAlpha1273 );
				#ifdef _SNOW_ON
				float staticSwitch1294 = ( temp_output_1277_0 + ( Snow_Blend_Normal205 * 2.0 ) );
				#else
				float staticSwitch1294 = temp_output_1277_0;
				#endif
				#if defined( _RENDERING_CUTOUT )
				float staticSwitch1478 = temp_output_1277_0;
				#elif defined( _RENDERING_FADE )
				float staticSwitch1478 = staticSwitch1294;
				#elif defined( _RENDERING_TRANSPARENT )
				float staticSwitch1478 = staticSwitch1294;
				#elif defined( _RENDERING_OPAQUE )
				float staticSwitch1478 = staticSwitch1294;
				#else
				float staticSwitch1478 = staticSwitch1294;
				#endif
				float BaseAlpha1283 = saturate( ( staticSwitch1478 + _Opacity ) );
				#if defined( _RENDERING_CUTOUT )
				float4 staticSwitch1284 = temp_output_40_0;
				#elif defined( _RENDERING_FADE )
				float4 staticSwitch1284 = temp_output_40_0;
				#elif defined( _RENDERING_TRANSPARENT )
				float4 staticSwitch1284 = ( temp_output_40_0 * BaseAlpha1283 );
				#elif defined( _RENDERING_OPAQUE )
				float4 staticSwitch1284 = temp_output_40_0;
				#else
				float4 staticSwitch1284 = temp_output_40_0;
				#endif
				float4 Albedo_Final224 = staticSwitch1284;
				
				#ifdef _EMISSION_ON
				float4 staticSwitch1432 = ( tex2D( _EmissionMap, Parallax_UV178 ) * _EmissionColor );
				#else
				float4 staticSwitch1432 = float4(0,0,0,0);
				#endif
				float4 Emission_Final678 = staticSwitch1432;
				
				#if defined( _RENDERING_CUTOUT )
				float staticSwitch1279 = BaseAlpha1283;
				#elif defined( _RENDERING_FADE )
				float staticSwitch1279 = BaseAlpha1283;
				#elif defined( _RENDERING_TRANSPARENT )
				float staticSwitch1279 = BaseAlpha1283;
				#elif defined( _RENDERING_OPAQUE )
				float staticSwitch1279 = 1.0;
				#else
				float staticSwitch1279 = 1.0;
				#endif
				float OpacityFinal1278 = staticSwitch1279;
				
				#if defined( _RENDERING_CUTOUT )
				float staticSwitch1288 = _CutOff;
				#elif defined( _RENDERING_FADE )
				float staticSwitch1288 = 0.0;
				#elif defined( _RENDERING_TRANSPARENT )
				float staticSwitch1288 = 0.0;
				#elif defined( _RENDERING_OPAQUE )
				float staticSwitch1288 = 0.0;
				#else
				float staticSwitch1288 = 0.0;
				#endif
				float OpacityMaskFinal1289 = staticSwitch1288;
				
				o.Albedo = Albedo_Final224.rgb;
				o.Normal = fixed3( 0, 0, 1 );
				o.Emission = Emission_Final678.xyz;
				o.Alpha = OpacityFinal1278;
				float AlphaClipThreshold = OpacityMaskFinal1289;

				#ifdef _ALPHATEST_ON
					clip( o.Alpha - AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
					outputDepth = IN.pos.z;
				#endif

				UnityMetaInput metaIN;
				UNITY_INITIALIZE_OUTPUT(UnityMetaInput, metaIN);
				metaIN.Albedo = o.Albedo;
				metaIN.Emission = o.Emission;
				#ifdef EDITOR_VISUALIZATION
					metaIN.VizUV = IN.vizUV;
					metaIN.LightCoord = IN.lightCoord;
				#endif
				return UnityMetaFragment(metaIN);
			}
			ENDCG
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }
			ZWrite On
			ZTest LEqual
			AlphaToMask Off

			CGPROGRAM
			#define ASE_NEEDS_FRAG_SHADOWCOORDS
			#pragma multi_compile_instancing
			#pragma multi_compile __ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_TESSELLATION 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_DISTANCE_TESSELLATION
			#define _ALPHATEST_ON 1

			#pragma vertex vert
			#pragma fragment frag
			#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
			#pragma multi_compile_shadowcaster
			#ifndef UNITY_PASS_SHADOWCASTER
				#define UNITY_PASS_SHADOWCASTER
			#endif
			#include "HLSLSupport.cginc"
			#ifndef UNITY_INSTANCED_LOD_FADE
				#define UNITY_INSTANCED_LOD_FADE
			#endif
			#ifndef UNITY_INSTANCED_SH
				#define UNITY_INSTANCED_SH
			#endif
			#ifndef UNITY_INSTANCED_LIGHTMAPSTS
				#define UNITY_INSTANCED_LIGHTMAPSTS
			#endif
			#if ( SHADER_API_D3D11 || SHADER_API_GLCORE || SHADER_API_GLES || SHADER_API_GLES3 || SHADER_API_METAL || SHADER_API_VULKAN )
				#define CAN_SKIP_VPOS
			#endif
			#include "UnityShaderVariables.cginc"
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"

			#include "UnityStandardUtils.cginc"
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#pragma shader_feature_local _TESSELLATION_ON
			#pragma shader_feature_local _SNOW_ON
			#pragma shader_feature_local _ENVIROREMOVALZONES_ON
			#pragma shader_feature_local _PUDDLES_ON
			#pragma shader_feature_local _RENDERING_CUTOUT _RENDERING_FADE _RENDERING_TRANSPARENT _RENDERING_OPAQUE
			#pragma shader_feature_local _GLOBALDETAILNORMAL_ON
			#pragma shader_feature_local _DETAILPROCEDURALMASK_OFF _DETAILPROCEDURALMASK_MASK _DETAILPROCEDURALMASK_PROCEDURAL _DETAILPROCEDURALMASK_HEIGHT
			#include "EnviroInclude.hlsl"

			struct appdata {
				float4 vertex : POSITION;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct v2f {
				V2F_SHADOW_CASTER;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			#ifdef UNITY_STANDARD_USE_DITHER_MASK
				sampler3D _DitherMaskLOD;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			uniform int _SrcBlend;
			uniform int _DstBlend;
			uniform int _ZWrite;
			uniform int _CullMode;
			uniform float _TessellationFactor;
			uniform sampler2D _SnowMask;
			uniform float _SnowTiling;
			uniform float4 _TilingOffset;
			uniform float _SnowDisplacementStrength;
			uniform float _EnviroSnow;
			uniform sampler2D _BaseMask;
			uniform float _PuddleIntensity;
			uniform float _PuddleCoverageNoise;
			uniform float _EnviroWetness;
			uniform float _DisplacementStrength;
			uniform sampler2D _MainTex;
			uniform float4 _Color;
			uniform sampler2D _BumpMap;
			uniform float _BumpScale;
			uniform sampler2D _DetailNormalMap;
			uniform float4 _DetailTilingOffset;
			uniform float _DetailNormalMapScale;
			uniform sampler2D _Mask;
			uniform float _DetailMaskTiling;
			uniform float _DetailHeightBlendStrength;
			uniform float _DetailProceduralMaskScale;
			uniform float _DetailProceduralMaskIntensity;
			uniform float _DetailThreshold;
			uniform float _DetailHeight;
			uniform float _DetailNormalInfluence;
			uniform sampler2D _GlobalNormal;
			uniform float2 _GlobalNormalTiling;
			uniform float _GlobalNormalIntensity;
			uniform sampler2D _SnowNormal;
			uniform float _SnowNormalScale;
			uniform float _Opacity;
			uniform float _CutOff;


			inline float EnviroZonesFunction( float density, float3 wpos )
			{
				return EnviroRemoveZones(wpos,density);
			}
			
			inline float noise_randomValue (float2 uv) { return frac(sin(dot(uv, float2(12.9898, 78.233)))*43758.5453); }
			inline float noise_interpolate (float a, float b, float t) { return (1.0-t)*a + (t*b); }
			inline float valueNoise (float2 uv)
			{
				float2 i = floor(uv);
				float2 f = frac( uv );
				f = f* f * (3.0 - 2.0 * f);
				uv = abs( frac(uv) - 0.5);
				float2 c0 = i + float2( 0.0, 0.0 );
				float2 c1 = i + float2( 1.0, 0.0 );
				float2 c2 = i + float2( 0.0, 1.0 );
				float2 c3 = i + float2( 1.0, 1.0 );
				float r0 = noise_randomValue( c0 );
				float r1 = noise_randomValue( c1 );
				float r2 = noise_randomValue( c2 );
				float r3 = noise_randomValue( c3 );
				float bottomOfGrid = noise_interpolate( r0, r1, f.x );
				float topOfGrid = noise_interpolate( r2, r3, f.x );
				float t = noise_interpolate( bottomOfGrid, topOfGrid, f.y );
				return t;
			}
			
			float SimpleNoise(float2 UV)
			{
				float t = 0.0;
				float freq = pow( 2.0, float( 0 ) );
				float amp = pow( 0.5, float( 3 - 0 ) );
				t += valueNoise( UV/freq )*amp;
				freq = pow(2.0, float(1));
				amp = pow(0.5, float(3-1));
				t += valueNoise( UV/freq )*amp;
				freq = pow(2.0, float(2));
				amp = pow(0.5, float(3-2));
				t += valueNoise( UV/freq )*amp;
				return t;
			}
			
			inline float3 TriplanarSampling720( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = tex2D( topTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) );
				yNorm = tex2D( topTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) );
				zNorm = tex2D( topTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) );
				xNorm.xyz  = half3( UnpackScaleNormal( xNorm, normalScale.y ).xy * float2(  nsign.x, 1.0 ) + worldNormal.zy, worldNormal.x ).zyx;
				yNorm.xyz  = half3( UnpackScaleNormal( yNorm, normalScale.x ).xy * float2(  nsign.y, 1.0 ) + worldNormal.xz, worldNormal.y ).xzy;
				zNorm.xyz  = half3( UnpackScaleNormal( zNorm, normalScale.y ).xy * float2( -nsign.z, 1.0 ) + worldNormal.xy, worldNormal.z ).xyz;
				return normalize( xNorm.xyz * projNormal.x + yNorm.xyz * projNormal.y + zNorm.xyz * projNormal.z );
			}
			

			v2f VertexFunction (appdata v  ) {
				UNITY_SETUP_INSTANCE_ID(v);
				v2f o;
				UNITY_INITIALIZE_OUTPUT(v2f,o);
				UNITY_TRANSFER_INSTANCE_ID(v,o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float2 temp_cast_0 = (_SnowTiling).xx;
				float2 appendResult286 = (float2(_TilingOffset.x , _TilingOffset.y));
				float2 appendResult287 = (float2(_TilingOffset.z , _TilingOffset.w));
				float2 texCoord44 = v.ase_texcoord.xy * appendResult286 + appendResult287;
				float2 Global_UV170 = texCoord44;
				float2 texCoord1385 = v.ase_texcoord.xy * temp_cast_0 + Global_UV170;
				float4 tex2DNode1387 = tex2Dlod( _SnowMask, float4( texCoord1385, 0, 0.0) );
				float Height_Snow234 = tex2DNode1387.b;
				float3 ase_worldNormal = UnityObjectToWorldNormal(v.normal);
				float density5_g5 = 0.0;
				float3 ase_worldPos = mul(unity_ObjectToWorld, float4( (v.vertex).xyz, 1 )).xyz;
				float3 wpos5_g5 = ase_worldPos;
				float localEnviroZonesFunction5_g5 = EnviroZonesFunction( density5_g5 , wpos5_g5 );
				float RemovalZoneMask1467 = localEnviroZonesFunction5_g5;
				#ifdef _ENVIROREMOVALZONES_ON
				float staticSwitch1456 = ( saturate( ( RemovalZoneMask1467 + _EnviroSnow ) ) * 2.0 );
				#else
				float staticSwitch1456 = ( _EnviroSnow * 2.0 );
				#endif
				float Snow_Amount199 = staticSwitch1456;
				#ifdef _SNOW_ON
				float3 staticSwitch1257 = ( saturate( ( ( Height_Snow234 + 0.5 ) * _SnowDisplacementStrength ) ) * ( v.normal * saturate( ( ( ase_worldNormal.y - 0.3 ) * Snow_Amount199 ) ) ) );
				#else
				float3 staticSwitch1257 = float3(0,0,0);
				#endif
				float3 Snow_Displacement707 = staticSwitch1257;
				float4 tex2DNode22 = tex2Dlod( _BaseMask, float4( Global_UV170, 0, 1.0) );
				float HEIGHT305 = tex2DNode22.b;
				float3 ase_worldTangent = UnityObjectToWorldDir(v.tangent);
				float ase_vertexTangentSign = v.tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 ase_worldViewDir = UnityWorldSpaceViewDir(ase_worldPos);
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float ase_faceVertex = (dot(ase_tanViewDir,float3(0,0,1)));
				float4 appendResult935 = (float4(ase_worldPos.x , ase_worldPos.z , 0.0 , 0.0));
				float simpleNoise921 = SimpleNoise( appendResult935.xy*_PuddleCoverageNoise );
				simpleNoise921 = simpleNoise921*2 - 1;
				#ifdef _ENVIROREMOVALZONES_ON
				float staticSwitch1464 = saturate( ( RemovalZoneMask1467 + _EnviroWetness ) );
				#else
				float staticSwitch1464 = _EnviroWetness;
				#endif
				float Wetness163 = staticSwitch1464;
				float switchResult1401 = (((ase_faceVertex>0)?(saturate( ( ( ( ase_worldNormal.y - 0.9 ) * ( ( saturate( ( _PuddleIntensity * simpleNoise921 ) ) * saturate( ( 2.0 - Snow_Amount199 ) ) ) * Wetness163 ) ) * 8.0 ) )):(0.0)));
				#ifdef _PUDDLES_ON
				float staticSwitch996 = switchResult1401;
				#else
				float staticSwitch996 = 0.0;
				#endif
				float Puddle_Mask584 = staticSwitch996;
				#ifdef _TESSELLATION_ON
				float3 staticSwitch1362 = ( Snow_Displacement707 + ( v.normal * ( ( HEIGHT305 * ( 1.0 - Puddle_Mask584 ) ) * _DisplacementStrength ) ) );
				#else
				float3 staticSwitch1362 = float3(0,0,0);
				#endif
				
				o.ase_texcoord3.xyz = ase_worldNormal;
				o.ase_texcoord4.xyz = ase_worldPos;
				o.ase_texcoord6.xyz = ase_worldTangent;
				o.ase_texcoord7.xyz = ase_worldBitangent;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				o.ase_texcoord5 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				o.ase_texcoord6.w = 0;
				o.ase_texcoord7.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = staticSwitch1362;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.vertex.w = 1;
				v.normal = v.normal;
				v.tangent = v.tangent;

				TRANSFER_SHADOW_CASTER_NORMALOFFSET(o)
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( appdata v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.tangent = v.tangent;
				o.normal = v.normal;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessellationFactor; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, UNITY_MATRIX_M, _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			v2f DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				appdata o = (appdata) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.tangent = patch[0].tangent * bary.x + patch[1].tangent * bary.y + patch[2].tangent * bary.z;
				o.normal = patch[0].normal * bary.x + patch[1].normal * bary.y + patch[2].normal * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].normal * (dot(o.vertex.xyz, patch[i].normal) - dot(patch[i].vertex.xyz, patch[i].normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			v2f vert ( appdata v )
			{
				return VertexFunction( v );
			}
			#endif

			fixed4 frag (v2f IN , bool ase_vface : SV_IsFrontFace
				#ifdef _DEPTHOFFSET_ON
				, out float outputDepth : SV_Depth
				#endif
				#if !defined( CAN_SKIP_VPOS )
				, UNITY_VPOS_TYPE vpos : VPOS
				#endif
				) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(IN);

				#ifdef LOD_FADE_CROSSFADE
					UNITY_APPLY_DITHER_CROSSFADE(IN.pos.xy);
				#endif

				#if defined(_SPECULAR_SETUP)
					SurfaceOutputStandardSpecular o = (SurfaceOutputStandardSpecular)0;
				#else
					SurfaceOutputStandard o = (SurfaceOutputStandard)0;
				#endif

				float2 appendResult286 = (float2(_TilingOffset.x , _TilingOffset.y));
				float2 appendResult287 = (float2(_TilingOffset.z , _TilingOffset.w));
				float2 texCoord44 = IN.ase_texcoord2.xy * appendResult286 + appendResult287;
				float2 Global_UV170 = texCoord44;
				float2 Parallax_UV178 = Global_UV170;
				float4 tex2DNode17 = tex2D( _MainTex, Parallax_UV178 );
				float Opacity1274 = tex2DNode17.a;
				float TintAlpha1273 = _Color.a;
				float temp_output_1277_0 = ( Opacity1274 * TintAlpha1273 );
				float3 ase_worldNormal = IN.ase_texcoord3.xyz;
				float3 ase_worldPos = IN.ase_texcoord4.xyz;
				float4 appendResult935 = (float4(ase_worldPos.x , ase_worldPos.z , 0.0 , 0.0));
				float simpleNoise921 = SimpleNoise( appendResult935.xy*_PuddleCoverageNoise );
				simpleNoise921 = simpleNoise921*2 - 1;
				float density5_g5 = 0.0;
				float3 wpos5_g5 = ase_worldPos;
				float localEnviroZonesFunction5_g5 = EnviroZonesFunction( density5_g5 , wpos5_g5 );
				float RemovalZoneMask1467 = localEnviroZonesFunction5_g5;
				#ifdef _ENVIROREMOVALZONES_ON
				float staticSwitch1456 = ( saturate( ( RemovalZoneMask1467 + _EnviroSnow ) ) * 2.0 );
				#else
				float staticSwitch1456 = ( _EnviroSnow * 2.0 );
				#endif
				float Snow_Amount199 = staticSwitch1456;
				#ifdef _ENVIROREMOVALZONES_ON
				float staticSwitch1464 = saturate( ( RemovalZoneMask1467 + _EnviroWetness ) );
				#else
				float staticSwitch1464 = _EnviroWetness;
				#endif
				float Wetness163 = staticSwitch1464;
				float switchResult1401 = (((ase_vface>0)?(saturate( ( ( ( ase_worldNormal.y - 0.9 ) * ( ( saturate( ( _PuddleIntensity * simpleNoise921 ) ) * saturate( ( 2.0 - Snow_Amount199 ) ) ) * Wetness163 ) ) * 8.0 ) )):(0.0)));
				#ifdef _PUDDLES_ON
				float staticSwitch996 = switchResult1401;
				#else
				float staticSwitch996 = 0.0;
				#endif
				float Puddle_Mask584 = staticSwitch996;
				#ifdef _PUDDLES_ON
				float staticSwitch659 = saturate( ( _BumpScale - Puddle_Mask584 ) );
				#else
				float staticSwitch659 = _BumpScale;
				#endif
				float3 Normal_Base209 = UnpackScaleNormal( tex2D( _BumpMap, Parallax_UV178 ), staticSwitch659 );
				float2 appendResult261 = (float2(_DetailTilingOffset.x , _DetailTilingOffset.y));
				float2 appendResult262 = (float2(_DetailTilingOffset.z , _DetailTilingOffset.w));
				float2 texCoord257 = IN.ase_texcoord2.xy * appendResult261 + appendResult262;
				float3 Detail_Normal249 = UnpackScaleNormal( tex2D( _DetailNormalMap, texCoord257 ), _DetailNormalMapScale );
				float4 tex2DNode22 = tex2D( _BaseMask, Global_UV170 );
				float HEIGHT305 = tex2DNode22.b;
				float2 appendResult256 = (float2(_DetailMaskTiling , _DetailMaskTiling));
				float2 texCoord254 = IN.ase_texcoord2.xy * appendResult256 + float2( 0,0 );
				float HeightMask1341 = saturate(pow(max( (((HEIGHT305*tex2D( _Mask, texCoord254 ).r)*4)+(tex2D( _Mask, texCoord254 ).r*2)), 0 ),_DetailHeightBlendStrength));
				float simpleNoise1239 = SimpleNoise( texCoord254*_DetailProceduralMaskScale );
				simpleNoise1239 = simpleNoise1239*2 - 1;
				float HeightMask1249 = saturate(pow(max( (((HEIGHT305*saturate( ( simpleNoise1239 * _DetailProceduralMaskIntensity ) ))*4)+(saturate( ( simpleNoise1239 * _DetailProceduralMaskIntensity ) )*2)), 0 ),_DetailHeightBlendStrength));
				float4 transform1329 = mul(unity_ObjectToWorld,float4( IN.ase_texcoord5.xyz , 0.0 ));
				float smoothstepResult1323 = smoothstep( ( _DetailHeight - 1.0 ) , ( _DetailHeight + 1.0 ) , transform1329.y);
				float3 ase_worldTangent = IN.ase_texcoord6.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord7.xyz;
				float3x3 ase_tangentToWorldFast = float3x3(ase_worldTangent.x,ase_worldBitangent.x,ase_worldNormal.x,ase_worldTangent.y,ase_worldBitangent.y,ase_worldNormal.y,ase_worldTangent.z,ase_worldBitangent.z,ase_worldNormal.z);
				float3 tangentToWorldDir1332 = mul( ase_tangentToWorldFast, Normal_Base209 );
				float lerpResult1436 = lerp( 1.0 , tangentToWorldDir1332.y , _DetailNormalInfluence);
				float smoothstepResult1335 = smoothstep( 0.0 , ( 1.0 - _DetailThreshold ) , ( smoothstepResult1323 * lerpResult1436 ));
				float HeightMask1342 = saturate(pow(max( (((HEIGHT305*smoothstepResult1335)*4)+(smoothstepResult1335*2)), 0 ),_DetailHeightBlendStrength));
				#if defined( _DETAILPROCEDURALMASK_OFF )
				float staticSwitch1238 = 0.0;
				#elif defined( _DETAILPROCEDURALMASK_MASK )
				float staticSwitch1238 = HeightMask1341;
				#elif defined( _DETAILPROCEDURALMASK_PROCEDURAL )
				float staticSwitch1238 = HeightMask1249;
				#elif defined( _DETAILPROCEDURALMASK_HEIGHT )
				float staticSwitch1238 = HeightMask1342;
				#else
				float staticSwitch1238 = 0.0;
				#endif
				float Mask253 = saturate( staticSwitch1238 );
				float HeightMask264 = saturate(pow(((HEIGHT305*Mask253)*4)+(Mask253*2),1.0));
				float Detail_Blending277 = HeightMask264;
				float3 lerpResult283 = lerp( Normal_Base209 , Detail_Normal249 , Detail_Blending277);
				float3x3 ase_worldToTangent = float3x3(ase_worldTangent,ase_worldBitangent,ase_worldNormal);
				#ifdef _PUDDLES_ON
				float staticSwitch766 = saturate( ( _GlobalNormalIntensity - Puddle_Mask584 ) );
				#else
				float staticSwitch766 = _GlobalNormalIntensity;
				#endif
				float3 triplanar720 = TriplanarSampling720( _GlobalNormal, ase_worldPos, ase_worldNormal, 1.0, _GlobalNormalTiling, staticSwitch766, 0 );
				float3 tanTriplanarNormal720 = mul( ase_worldToTangent, triplanar720 );
				float3 Global_Normal688 = tanTriplanarNormal720;
				#ifdef _GLOBALDETAILNORMAL_ON
				float3 staticSwitch1431 = BlendNormals( lerpResult283 , Global_Normal688 );
				#else
				float3 staticSwitch1431 = lerpResult283;
				#endif
				float2 temp_cast_2 = (_SnowTiling).xx;
				float2 texCoord1385 = IN.ase_texcoord2.xy * temp_cast_2 + Global_UV170;
				float3 Normal_Snow211 = UnpackScaleNormal( tex2D( _SnowNormal, texCoord1385 ), _SnowNormalScale );
				float switchResult1311 = (((ase_vface>0)?(( ase_worldNormal.y * Snow_Amount199 )):(0.0)));
				float temp_output_10_0 = saturate( switchResult1311 );
				float3 lerpResult11 = lerp( staticSwitch1431 , Normal_Snow211 , temp_output_10_0);
				#ifdef _SNOW_ON
				float3 staticSwitch1261 = lerpResult11;
				#else
				float3 staticSwitch1261 = staticSwitch1431;
				#endif
				float3 Normal_Combined213 = staticSwitch1261;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal12 = Normal_Combined213;
				float3 worldNormal12 = float3(dot(tanToWorld0,tanNormal12), dot(tanToWorld1,tanNormal12), dot(tanToWorld2,tanNormal12));
				float switchResult1310 = (((ase_vface>0)?(saturate( ( worldNormal12.y * Snow_Amount199 ) )):(0.0)));
				#ifdef _SNOW_ON
				float staticSwitch1259 = switchResult1310;
				#else
				float staticSwitch1259 = 0.0;
				#endif
				float Snow_Blend_Normal205 = staticSwitch1259;
				#ifdef _SNOW_ON
				float staticSwitch1294 = ( temp_output_1277_0 + ( Snow_Blend_Normal205 * 2.0 ) );
				#else
				float staticSwitch1294 = temp_output_1277_0;
				#endif
				#if defined( _RENDERING_CUTOUT )
				float staticSwitch1478 = temp_output_1277_0;
				#elif defined( _RENDERING_FADE )
				float staticSwitch1478 = staticSwitch1294;
				#elif defined( _RENDERING_TRANSPARENT )
				float staticSwitch1478 = staticSwitch1294;
				#elif defined( _RENDERING_OPAQUE )
				float staticSwitch1478 = staticSwitch1294;
				#else
				float staticSwitch1478 = staticSwitch1294;
				#endif
				float BaseAlpha1283 = saturate( ( staticSwitch1478 + _Opacity ) );
				#if defined( _RENDERING_CUTOUT )
				float staticSwitch1279 = BaseAlpha1283;
				#elif defined( _RENDERING_FADE )
				float staticSwitch1279 = BaseAlpha1283;
				#elif defined( _RENDERING_TRANSPARENT )
				float staticSwitch1279 = BaseAlpha1283;
				#elif defined( _RENDERING_OPAQUE )
				float staticSwitch1279 = 1.0;
				#else
				float staticSwitch1279 = 1.0;
				#endif
				float OpacityFinal1278 = staticSwitch1279;
				
				#if defined( _RENDERING_CUTOUT )
				float staticSwitch1288 = _CutOff;
				#elif defined( _RENDERING_FADE )
				float staticSwitch1288 = 0.0;
				#elif defined( _RENDERING_TRANSPARENT )
				float staticSwitch1288 = 0.0;
				#elif defined( _RENDERING_OPAQUE )
				float staticSwitch1288 = 0.0;
				#else
				float staticSwitch1288 = 0.0;
				#endif
				float OpacityMaskFinal1289 = staticSwitch1288;
				
				o.Normal = fixed3( 0, 0, 1 );
				o.Occlusion = 1;
				o.Alpha = OpacityFinal1278;
				float AlphaClipThreshold = OpacityMaskFinal1289;
				float AlphaClipThresholdShadow = 0.5;

				#ifdef _ALPHATEST_SHADOW_ON
					if (unity_LightShadowBias.z != 0.0)
						clip(o.Alpha - AlphaClipThresholdShadow);
					#ifdef _ALPHATEST_ON
					else
						clip(o.Alpha - AlphaClipThreshold);
					#endif
				#else
					#ifdef _ALPHATEST_ON
						clip(o.Alpha - AlphaClipThreshold);
					#endif
				#endif

				#if defined( CAN_SKIP_VPOS )
				float2 vpos = IN.pos;
				#endif

				#ifdef UNITY_STANDARD_USE_DITHER_MASK
					half alphaRef = tex3D(_DitherMaskLOD, float3(vpos.xy*0.25,o.Alpha*0.9375)).a;
					clip(alphaRef - 0.01);
				#endif

				#ifdef _DEPTHOFFSET_ON
					outputDepth = IN.pos.z;
				#endif

				SHADOW_CASTER_FRAGMENT(IN)
			}
			ENDCG
		}
		
	}
	CustomEditor "EnviroSurfaceShaderEditor"
	
	Fallback Off
}
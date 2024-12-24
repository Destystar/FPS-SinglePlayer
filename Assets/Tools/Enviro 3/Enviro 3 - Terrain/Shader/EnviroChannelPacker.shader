Shader "Hidden/EnviroChannelPacker"
{
    Properties
    {
        _Metallic ("Texture", 2D) = "black" {}
        _Occlusion ("Texture", 2D) = "black" {}
        _Height ("Texture", 2D) = "black" {}
        _Smoothness ("Texture", 2D) = "black" {}
    }
    SubShader
    {
        // No culling or depth
        Cull Off ZWrite Off ZTest Always

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            sampler2D _Metallic; 
            sampler2D _Occlusion;
            sampler2D _Height;
            sampler2D _Smoothness;

            float4 _SourceChannel;

            float4 frag (v2f i) : SV_Target
            {
                float4 metallic = tex2D(_Metallic, i.uv);
                float4 occlusion = tex2D(_Occlusion, i.uv);
                float4 height = tex2D(_Height, i.uv);
                float4 smoothness = tex2D(_Smoothness, i.uv);

                float mt = 0;

                if(_SourceChannel.x == 0)
                mt = metallic.r;
                else if (_SourceChannel.x == 1)
                mt = metallic.g;
                else if (_SourceChannel.x == 2)
                mt = metallic.b;
                else
                mt = metallic.a;

                float oc = 0; 

                if(_SourceChannel.y == 0)
                oc = occlusion.r;
                else if (_SourceChannel.y == 1)
                oc = occlusion.g;
                else if (_SourceChannel.y == 2)
                oc = occlusion.b;
                else
                oc = occlusion.a;

                float hg = 0;

                if(_SourceChannel.z == 0)
                hg = height.r;
                else if (_SourceChannel.z == 1)
                hg = height.g;
                else if (_SourceChannel.z == 2)
                hg = height.b;
                else
                hg = height.a;

                float sm = 0;

                if(_SourceChannel.w == 0)
                sm = smoothness.r;
                else if (_SourceChannel.w == 1)
                sm = smoothness.g;
                else if (_SourceChannel.w == 2)
                sm = smoothness.b;
                else
                sm = smoothness.a;


                return float4(mt, oc, hg, sm);
            }
            ENDCG
        }
    }
}

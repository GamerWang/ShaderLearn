﻿Shader "_Unity Shaders Book/Chapter 10/Chapter10_1_Fresnel"
{
	Properties
	{
		_Color ("Color Tint", Color) = (1, 1, 1, 1)
		_FresnelScale("Fresnel Scale", Range(0, 1)) = 0.5
		_Cubemap("Reflection Cubemap", Cube) = "_Skybox" {}
	}
	SubShader
	{
		Tags { "RenderType"="Opaque" "Queue"="Geometry" }

		Pass
		{
			Tags { "Lightmode"="ForwardBase" }
			
			CGPROGRAM

			#pragma multi_compile_fwdbase

			#pragma vertex vert
			#pragma fragment frag

			#include "Lighting.cginc"
			#include "AutoLight.cginc"

			fixed4 _Color;
			fixed _FresnelScale;
			samplerCUBE _Cubemap;

			struct VertexInput {
				float4 vertex : POSITION;
				float3 normal : NORMAL;
			};

			struct VertexOutput {
				float4 pos : SV_POSITION;
				float3 worldPos : TEXCOORD0;
				fixed3 worldNormal : TEXCOORD1;
				fixed3 worldViewDir : TEXCOORD2;
				fixed3 worldRefl : TEXCOORD3;
				SHADOW_COORDS(4)
			};

			VertexOutput vert(VertexInput v) {
				VertexOutput o;

				o.pos = UnityObjectToClipPos(v.vertex);
				o.worldNormal = UnityObjectToWorldNormal(v.normal);
				o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				o.worldViewDir = UnityWorldSpaceViewDir(o.worldPos);
				o.worldRefl = reflect(-o.worldViewDir, o.worldNormal);

				TRANSFER_SHADOW(o);

				return o;
			}

			fixed4 frag(VertexOutput i) : SV_Target {
				fixed3 worldNormal = normalize(i.worldNormal);
				fixed3 worldLightDir = normalize(UnityWorldSpaceLightDir(i.worldPos));
				fixed3 worldViewDir = normalize(i.worldViewDir);

				fixed3 ambient = UNITY_LIGHTMODEL_AMBIENT.xyz;

				UNITY_LIGHT_ATTENUATION(atten, i, i.worldPos);

				fixed3 reflection = texCUBE(_Cubemap, i.worldRefl).rgb;

				fixed fresnel = _FresnelScale + (1 - _FresnelScale) * 
					pow(1 - dot(worldViewDir, worldNormal), 5);
				
				fixed3 diffuse = _LightColor0.rgb * 
					_Color.rgb * max(0, dot(worldNormal, worldLightDir));

				fixed3 color = ambient + lerp(diffuse, reflection, saturate(fresnel)) * atten;

				return fixed4(color, 1.0);
			}
			
			ENDCG
		}
	}

	Fallback "Reflective/VertexLit"
}

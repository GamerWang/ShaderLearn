// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'
// Upgrade NOTE: replaced '_World2Object' with 'unity_WorldToObject'
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'
Shader "_Unity Shaders Book/Chapter 14/Chapter14_ToonShading" {
	Properties {
		_Color("Color Tint", Color) = (1, 1, 1, 1)
		_MainTex("Main Tex", 2D) = "white" {}
		_Ramp("Ramp Texture", 2D) = "white" {}
		_Outline ("Outline", Range(0, 1)) = 0.1		// defines the width of outline
		_OutlineColor("Outline Color", Color) = (0, 0, 0, 1)
		_OutlineNormalZ ("Outline Normal Z", range(-1,1)) = -0.5
		_DiffuseScale("Diffuse Scale", range(0,1)) = 0.5
		_Specular("Specular", Color) = (1, 1, 1, 1)
		_SpecularScale("Specular Scale", Range(0, 0.1)) = 0.01
	}
	SubShader {
		// new keywords: RenderType, Geometry
		Tags { "RenderType"="Opaque" "Queue"="Geometry"}
	
		Pass {
			// new keyword: Name
			// named pass could be referenced by its name
			Name "OUTLINE"

			// new keyword: Cull
			// *** important here
			// *** because front surfaces were culled back surfaces will look like outline
			Cull Front

			CGPROGRAM

			#pragma vertex vert
			#pragma fragment frag

			//#include "UnityCG.cginc"		// this line could be ignored	

			float _Outline;
			fixed4 _OutlineColor;
			float _OutlineNormalZ;

			struct a2v{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
			};

			struct v2f{
				float4 pos : SV_POSITION;
			};

			v2f vert(a2v v){
				v2f o;

				float4 pos = mul(UNITY_MATRIX_MV, v.vertex);
				float3 normal = mul((float3x3)UNITY_MATRIX_IT_MV, v.normal); 
				normal.z = _OutlineNormalZ;
				pos = pos + float4(normalize(normal), 0) * _Outline;	// push every vertex towards normal direction
				// if value of _Outline is too large faces will overlap with each other
				o.pos = mul(UNITY_MATRIX_P, pos);

				return o;
			}

			float4 frag(v2f i) : SV_Target {
				return float4(_OutlineColor.rgb, 1);
			}

			ENDCG
		}

		Pass {
			Tags { "LightMode"="ForwardBase" }

			Cull Back

			CGPROGRAM

			#pragma vertex vert
			#pragma fragment frag

			#pragma multi_compile_fwdbase

			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "AutoLight.cginc"
			#include "UnityShaderVariables.cginc"

			fixed3 _Color;
			sampler2D _MainTex;
			float4 _MainTex_ST;
			sampler2D _Ramp;
			float _DiffuseScale;
			fixed4 _Specular;
			fixed _SpecularScale;

			struct a2v{
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				float4 texcoord : TEXCOORD0;
				float4 tangent : TANGENT;
			};

			struct v2f {
				float4 pos : POSITION;
				float2 uv : TEXCOORD0;
				float3 worldNormal : TEXCOORD1;
				float3 worldPos : TEXCOORD2;
				SHADOW_COORDS(3)
			};

			v2f vert(a2v v){
				v2f o;

				o.pos = UnityObjectToClipPos(v.vertex);
				o.uv = TRANSFORM_TEX (v.texcoord, _MainTex);
				o.worldNormal = UnityObjectToWorldNormal(v.normal);
				o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;

				TRANSFER_SHADOW(o);

				return o;
			}

			float4 frag(v2f i) : SV_Target {
				fixed3 worldNormal = normalize(i.worldNormal);
				fixed3 worldLightDir = normalize(UnityWorldSpaceLightDir(i.worldPos));
				fixed3 worldViewDir = normalize(UnityWorldSpaceViewDir(i.worldPos));
				fixed3 worldHalfDir = normalize(worldLightDir + worldViewDir);

				fixed4 c = tex2D(_MainTex, i.uv);
				fixed3 albedo = c.rgb * _Color.rgb;

				fixed3 ambient = UNITY_LIGHTMODEL_AMBIENT.xyz * albedo;

				UNITY_LIGHT_ATTENUATION(atten, i, i.worldPos);		// calculate shadow on this point

				fixed diff = dot(worldNormal, worldLightDir);
				//diff = (diff * 0.5 + 0.5) * atten;
				diff = (diff * _DiffuseScale + 1 - _DiffuseScale);
				//diff = (diff * _DiffuseScale + 1 - _DiffuseScale) * 0.5 + 0.5 * atten;
				

				fixed3 diffuse = _LightColor0.rgb * albedo * tex2D(_Ramp, float2(diff, diff)).rgb;

				fixed spec = dot(worldNormal, worldHalfDir);

				fixed w = fwidth(spec) * 2.0; // nearby 

				//fixed3 specular = _Specular.rgb * lerp(0, 1, smoothstep(-w, w, spec + _SpecularScale - 1))
				//	* step(0.0001, _SpecularScale) * atten;
				fixed3 specular = _Specular.rgb * step(1 - _SpecularScale, spec) * atten;	// unsmooth specular

				return fixed4(ambient + diffuse + specular, 1.0);
				//return fixed4(ambient + diffuse, 1.0);
			}

			ENDCG
		}
	}
	FallBack "Diffuse"
}

Shader "_Unity Shaders Book/Chapter 10/Chapter10_2_Monitor"
{
	Properties
	{
		_MainTex("Main Tex", 2D) = "white" {}
	}
	SubShader
	{
		Tags { "RenderType"="Opaque" "Queue"="Geometry" }

		Pass
		{
			CGPROGRAM

			#pragma vertex vert
			#pragma fragment frag

			sampler2D _MainTex;

			struct VertexInput {
				float4 vertex : POSITION;
				float3 texcoord : TEXCOORD0;
			};

			struct VertexOutput {
				float4 pos : SV_POSITION;
				float2 uv : TEXCOORD0;
			};

			VertexOutput vert(VertexInput v) {
				VertexOutput o;

				o.pos = UnityObjectToClipPos(v.vertex);
				o.uv = v.texcoord;
				// Mirror needs to flip x
				//o.uv.x = 1 - o.uv.x;

				return o;
			}

			fixed4 frag(VertexOutput i) : SV_Target {
				return tex2D(_MainTex, i.uv);
			}

			ENDCG
		}
	}

	FallBack "Reflective/VertexLit"
}

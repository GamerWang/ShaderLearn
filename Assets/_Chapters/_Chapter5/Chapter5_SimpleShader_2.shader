Shader "_Unity Shaders Book/Chapter 5/Simple Shader 5.2.2-3" {
	SubShader{
		Pass {
			CGPROGRAM
 
			#pragma vertex vert
			#pragma fragment frag

			// use a struct to define input of vertex shader
			// 'a2v' means 'Application to vertex shader'
			struct a2v {
				// 'POSITION' semantic tells unity get vertex position in model space
				float4 vertex : POSITION;
				// 'NORMAL' semantic tells unity get vertex normal in model space
				float3 normal : NORMAL;
				// 'TEXCOORD0' semantic tells unity get texture position of first set of texture
				float4 texcoord : TEXCOORD0;
			};			// never miss the ';' symbol

			// use a struct to let vertex shader output custom data to fragment shader
			// 'v2f' means 'Vertex shader to fragment shader'
			struct v2f {
				// 'SV_POSITION' semantic means vertex position in clip space
				float4 pos : SV_POSITION;
				// 'COLOR0' semantic means color information
				fixed3 color : COLOR0;
			};

			v2f vert(a2v v) {
				v2f o;
				o.pos = UnityObjectToClipPos (v.vertex);
				// value range of v.normal's axis is [-1,1]
				// this formula mapped it to [0,1]
				// output this color to fragment shader
				o.color = v.normal * 0.5 + fixed3(0.5, 0.5, 0.5);
				return o;
			}

			fixed4 frag(v2f i) : SV_Target {
				// display interpolated color on the screen
				return fixed4(i.color, 1.0);
			}

			ENDCG
		}
	}
}
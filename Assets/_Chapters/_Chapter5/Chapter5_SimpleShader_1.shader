Shader "_Unity Shaders Book/Chapter 5/Simple Shader 5.2.1" {
	SubShader{
		Pass {
			CGPROGRAM
			// tells compiler which two functions handles vertex shading and fragment shading
			// common syntax:
			// #pragma vertex name
			// #pragma fragment name
			#pragma vertex vert
			#pragma fragment frag

			// vertex shader
			// input variable 'v' contains the position of this vertex
			// this is defined by a Cg/HLSL semantic 'POSITION'
			// semantic 'SV_POSITION' tells compiler what is the output
			// here means this function outputs the position in the clip space
			float4 vert(float4 v : POSITION) : SV_POSITION {
				// 'UNITY_MATRIX_MVP' turn world space position into clip space position
				return UnityObjectToClipPos(v);		// older version: return mul(UNITY_MATRIX_MVP, v);
			}

			// fragment shader
			// 'HLSL' semantic 'SV_Target' means function outputs a color and store it into a rendder target 
			fixed4 frag() : SV_Target {
				// RGB value of a color
				// value range is [0, 1]
				return fixed4(1.0, 1.0, 1.0, 1.0);
			}

			ENDCG
		}
	}
}
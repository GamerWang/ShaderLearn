Shader "Custom/MyBasicShader"{
	Properties{
		// 属性
	}
	SubShader{
		// 针对显卡 A 的 SubShader
		Pass{
			// 设置渲染状态和标签
			
			// 开始 CG 代码片段
			CGPROGRAM
			// 该代码片段的编译指令，例如：
			#pragma vertex vert
			#pragma fragment frag
			
			// CG 代码写在这里
			
			ENDCG
			
			// 其它设置
		}
		// 其它需要的 Pass
	}
	SubShader{
		// 针对显卡 B 的 SubShader
	}

	// 上述 SubShader 都失败后用于回调的 Unity Shader
	Fallback "VertexLit"
}
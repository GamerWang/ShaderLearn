// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33093,y:32765,varname:node_3138,prsc:2|emission-4000-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:32327,y:32582,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_NormalVector,id:6836,x:32398,y:32925,prsc:2,pt:False;n:type:ShaderForge.SFN_LightVector,id:2353,x:32398,y:33102,varname:node_2353,prsc:2;n:type:ShaderForge.SFN_Dot,id:7406,x:32666,y:33001,varname:node_7406,prsc:2,dt:1|A-6836-OUT,B-2353-OUT;n:type:ShaderForge.SFN_LightColor,id:6000,x:32398,y:32760,varname:node_6000,prsc:2;n:type:ShaderForge.SFN_Multiply,id:4000,x:32895,y:32864,varname:node_4000,prsc:2|A-1541-OUT,B-7406-OUT;n:type:ShaderForge.SFN_Multiply,id:1541,x:32666,y:32690,varname:node_1541,prsc:2|A-8945-OUT,B-6000-RGB;n:type:ShaderForge.SFN_Tex2d,id:1190,x:32079,y:32299,ptovrint:False,ptlb:node_1190,ptin:_node_1190,varname:node_1190,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_LightAttenuation,id:8602,x:32775,y:32393,varname:node_8602,prsc:2;n:type:ShaderForge.SFN_AmbientLight,id:6159,x:32752,y:32526,varname:node_6159,prsc:2;n:type:ShaderForge.SFN_Slider,id:9539,x:32933,y:32531,ptovrint:False,ptlb:node_9539,ptin:_node_9539,varname:node_9539,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.4502632,max:1;n:type:ShaderForge.SFN_Vector1,id:4075,x:32991,y:32687,varname:node_4075,prsc:2,v1:0;n:type:ShaderForge.SFN_Tex2dAsset,id:8972,x:32233,y:32283,ptovrint:False,ptlb:node_8972,ptin:_node_8972,varname:node_8972,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:694a020602858294bbfa2776ffb1739c,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:7701,x:32432,y:32330,varname:node_7701,prsc:2,tex:694a020602858294bbfa2776ffb1739c,ntxv:0,isnm:False|TEX-8972-TEX;n:type:ShaderForge.SFN_TexCoord,id:3446,x:33246,y:32622,varname:node_3446,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_ComponentMask,id:7670,x:33437,y:32707,varname:node_7670,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-3446-U;n:type:ShaderForge.SFN_ComponentMask,id:8940,x:33437,y:32877,varname:node_8940,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-3446-V;n:type:ShaderForge.SFN_Bitangent,id:3369,x:32163,y:32480,varname:node_3369,prsc:2;n:type:ShaderForge.SFN_Fresnel,id:3427,x:32187,y:32673,varname:node_3427,prsc:2;n:type:ShaderForge.SFN_Multiply,id:8945,x:32517,y:32510,varname:node_8945,prsc:2|A-7701-RGB,B-7241-RGB;proporder:7241-1190-8972;pass:END;sub:END;*/

Shader "_Unity Shaders Book/Chapter 6/Chapter6_4 Diffuse SF" {
    Properties {
        _Color ("Color", Color) = (1,1,1,1)
        _node_1190 ("node_1190", 2D) = "white" {}
        _node_8972 ("node_8972", 2D) = "white" {}
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _Color;
            uniform sampler2D _node_8972; uniform float4 _node_8972_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
////// Emissive:
                float4 node_7701 = tex2D(_node_8972,TRANSFORM_TEX(i.uv0, _node_8972));
                float3 emissive = (((node_7701.rgb*_Color.rgb)*_LightColor0.rgb)*max(0,dot(i.normalDir,lightDirection)));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _Color;
            uniform sampler2D _node_8972; uniform float4 _node_8972_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float3 finalColor = 0;
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

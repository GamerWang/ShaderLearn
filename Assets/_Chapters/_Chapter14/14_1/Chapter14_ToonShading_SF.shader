// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:0,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33209,y:32712,varname:node_9361,prsc:2|emission-526-OUT,custl-5085-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:8068,x:32465,y:33063,varname:node_8068,prsc:2;n:type:ShaderForge.SFN_LightColor,id:3406,x:32158,y:32760,varname:node_3406,prsc:2;n:type:ShaderForge.SFN_LightVector,id:6869,x:31069,y:32383,varname:node_6869,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:9684,x:31069,y:32537,prsc:2,pt:True;n:type:ShaderForge.SFN_HalfVector,id:9471,x:31418,y:32907,varname:node_9471,prsc:2;n:type:ShaderForge.SFN_Dot,id:7782,x:31318,y:32438,cmnt:Lambert,varname:node_7782,prsc:2,dt:0|A-6869-OUT,B-9684-OUT;n:type:ShaderForge.SFN_Dot,id:3269,x:31618,y:32847,cmnt:Blinn-Phong,varname:node_3269,prsc:2,dt:1|A-9684-OUT,B-9471-OUT;n:type:ShaderForge.SFN_Multiply,id:2746,x:32465,y:32921,cmnt:Specular Contribution,varname:node_2746,prsc:2|A-3734-OUT,B-4865-RGB;n:type:ShaderForge.SFN_Tex2d,id:851,x:32157,y:32195,varname:node_851,prsc:2,tex:d6a0b8afb54b99c4380b20059d60c9da,ntxv:0,isnm:False|UVIN-7075-OUT,TEX-6050-TEX;n:type:ShaderForge.SFN_Color,id:5927,x:31993,y:32655,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_5927,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9411765,c2:0.6352941,c3:0.6352941,c4:1;n:type:ShaderForge.SFN_Slider,id:5328,x:31354,y:33069,ptovrint:False,ptlb:Gloss,ptin:_Gloss,varname:node_5328,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.01623932,max:0.1;n:type:ShaderForge.SFN_Multiply,id:5085,x:32708,y:32970,cmnt:Attenuate and Color,varname:node_5085,prsc:2|A-2746-OUT,B-8068-OUT;n:type:ShaderForge.SFN_Color,id:4865,x:31986,y:33115,ptovrint:False,ptlb:Spec Color,ptin:_SpecColor,varname:node_4865,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.4627451,c2:0.1529412,c3:0.1529412,c4:1;n:type:ShaderForge.SFN_Multiply,id:544,x:32519,y:32626,cmnt:Diffuse Color,varname:node_544,prsc:2|A-851-RGB,B-3406-RGB,C-3781-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:6050,x:31929,y:32100,ptovrint:False,ptlb:RampTex,ptin:_RampTex,varname:node_6050,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d6a0b8afb54b99c4380b20059d60c9da,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Append,id:7075,x:31929,y:32273,varname:node_7075,prsc:2|A-3607-OUT,B-3607-OUT;n:type:ShaderForge.SFN_Step,id:3734,x:31974,y:32917,varname:node_3734,prsc:2|A-3318-OUT,B-3269-OUT;n:type:ShaderForge.SFN_OneMinus,id:3318,x:31717,y:33062,varname:node_3318,prsc:2|IN-5328-OUT;n:type:ShaderForge.SFN_Slider,id:2976,x:31069,y:32278,ptovrint:False,ptlb:DiffuseScale,ptin:_DiffuseScale,varname:node_2976,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.36,max:1;n:type:ShaderForge.SFN_Multiply,id:6213,x:31513,y:32397,varname:node_6213,prsc:2|A-2976-OUT,B-7782-OUT;n:type:ShaderForge.SFN_OneMinus,id:3637,x:31513,y:32257,varname:node_3637,prsc:2|IN-2976-OUT;n:type:ShaderForge.SFN_Add,id:3607,x:31722,y:32314,varname:node_3607,prsc:2|A-3637-OUT,B-6213-OUT;n:type:ShaderForge.SFN_AmbientLight,id:4700,x:32427,y:32213,varname:node_4700,prsc:2;n:type:ShaderForge.SFN_Add,id:526,x:32861,y:32443,varname:node_526,prsc:2|A-1197-OUT,B-544-OUT;n:type:ShaderForge.SFN_Tex2dAsset,id:5280,x:31669,y:32633,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_5280,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:6371,x:31993,y:32493,varname:node_6371,prsc:2,ntxv:0,isnm:False|UVIN-2087-UVOUT,TEX-5280-TEX;n:type:ShaderForge.SFN_TexCoord,id:2087,x:31669,y:32452,varname:node_2087,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:3781,x:32240,y:32584,varname:node_3781,prsc:2|A-6371-RGB,B-5927-RGB;n:type:ShaderForge.SFN_Multiply,id:1197,x:32634,y:32273,varname:node_1197,prsc:2|A-4700-RGB,B-3781-OUT;proporder:5280-5927-6050-2976-5328-4865;pass:END;sub:END;*/

Shader "_Unity Shaders Book/Chapter 14/Chapter14_ToonShading_SF" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _Color ("Color", Color) = (0.9411765,0.6352941,0.6352941,1)
        _RampTex ("RampTex", 2D) = "white" {}
        _DiffuseScale ("DiffuseScale", Range(0, 1)) = 0.36
        _Gloss ("Gloss", Range(0, 0.1)) = 0.01623932
        _SpecColor ("Spec Color", Color) = (0.4627451,0.1529412,0.1529412,1)
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
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _Color;
            uniform float _Gloss;
            uniform sampler2D _RampTex; uniform float4 _RampTex_ST;
            uniform float _DiffuseScale;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
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
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
////// Emissive:
                float4 node_6371 = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float3 node_3781 = (node_6371.rgb*_Color.rgb);
                float node_3607 = ((1.0 - _DiffuseScale)+(_DiffuseScale*dot(lightDirection,normalDirection)));
                float2 node_7075 = float2(node_3607,node_3607);
                float4 node_851 = tex2D(_RampTex,TRANSFORM_TEX(node_7075, _RampTex));
                float3 emissive = ((UNITY_LIGHTMODEL_AMBIENT.rgb*node_3781)+(node_851.rgb*_LightColor0.rgb*node_3781));
                float3 finalColor = emissive + ((step((1.0 - _Gloss),max(0,dot(normalDirection,halfDirection)))*_SpecColor.rgb)*attenuation);
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}

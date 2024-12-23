using UnityEditor;
using UnityEngine; 
using System;

public class EnviroSurfaceShaderEditor : ShaderGUI 
{
    public static bool showBase, showDetail, showGlobalNormal, showSnow, showWetness,showPuddles;

    private bool showCutOff, showOpacity;

    private MaterialEditor editor;
	private MaterialProperty[] properties;
    private Material target;
    private Shader normalShader, tessShader;

    public GUIStyle boxStyle;
    public GUIStyle boxStyleModified;
    public GUIStyle wrapStyle;
    public GUIStyle headerStyle;
    public GUIStyle headerStyleMid;
    public GUIStyle headerFoldout;
    public GUIStyle popUpStyle;
    public GUIStyle integrationBox;
    public GUIStyle helpButton; 
    public bool showHelpBox;

    public Color baseModuleColor = new Color(0.0f,0.0f,0.5f,1f);
    public Color categoryModuleColor = new Color(0.5f,0.5f,0.0f,1f);
    public Color thirdPartyModuleColor = new Color(0.0f,0.5f,0.5f,1f);

    public void SetupGUIStyles ()
    {
        if (boxStyle == null)
        {
            boxStyle = new GUIStyle(GUI.skin.box);
            boxStyle.normal.textColor = GUI.skin.label.normal.textColor;
            boxStyle.fontStyle = FontStyle.Bold;
            boxStyle.alignment = TextAnchor.UpperLeft;
        }

        if (boxStyleModified == null)
        {
            boxStyleModified = new GUIStyle(EditorStyles.helpBox);
            boxStyleModified.normal.textColor = GUI.skin.label.normal.textColor;
            boxStyleModified.fontStyle = FontStyle.Bold;
            boxStyleModified.fontSize = 11;
            boxStyleModified.alignment = TextAnchor.UpperLeft;
        }

        if (integrationBox == null)
        {
            integrationBox = new GUIStyle(EditorStyles.helpBox);
            integrationBox.fontStyle = FontStyle.Bold;
            integrationBox.fontSize = 11;
        }

        if (wrapStyle == null)
        {
            wrapStyle = new GUIStyle(GUI.skin.label);
            wrapStyle.fontStyle = FontStyle.Normal;
            wrapStyle.wordWrap = true;
        }

        if (headerStyle == null)
        {
            headerStyle = new GUIStyle(GUI.skin.label);
            headerStyle.fontStyle = FontStyle.Bold;
            headerStyle.alignment = TextAnchor.UpperLeft;
        }

        if (headerStyleMid == null)
        {
            headerStyleMid = new GUIStyle(GUI.skin.label);
            headerStyleMid.fontStyle = FontStyle.Bold;
            headerStyleMid.alignment = TextAnchor.MiddleCenter;
        }

        if (headerFoldout == null)
        {
            headerFoldout = new GUIStyle(EditorStyles.foldout);
            headerFoldout.fontStyle = FontStyle.Bold;
        }

        if (popUpStyle == null)
        {
            popUpStyle = new GUIStyle(EditorStyles.popup);
            popUpStyle.alignment = TextAnchor.MiddleCenter;
            popUpStyle.fixedHeight = 20f;
            popUpStyle.fontStyle = FontStyle.Bold;
        }

        if (helpButton == null)
        {
            helpButton = new GUIStyle(EditorStyles.miniButtonRight);
            //helpButton.alignment = TextAnchor.UpperRight;
            helpButton.margin = new RectOffset(100,0,0,0);
        }
    }

    public static GUIContent albedoText = EditorGUIUtility.TrTextContent("Albedo", "Albedo");
    public static GUIContent detailText = EditorGUIUtility.TrTextContent("Detail Albedo", "Detail Albedo");
    public static GUIContent normalMapText = EditorGUIUtility.TrTextContent("Normal Map", "Normal Map");
    public static GUIContent detailNormalMapText = EditorGUIUtility.TrTextContent("Detail Normal Map", "Detail Normal Map");
    public static GUIContent globalNormalMapText = EditorGUIUtility.TrTextContent("Global Normal Map", "Triplanar Normals for Details");
    public static GUIContent snowNormalMapText = EditorGUIUtility.TrTextContent("Snow Normal Map", "Snow Normal Map");

    static GUIContent staticLabel = new GUIContent();
	
	static GUIContent MakeLabel (string text, string tooltip = null) 
    {
		staticLabel.text = text;
		staticLabel.tooltip = tooltip;
		return staticLabel;
	}

  	void SetKeyword (string keyword, bool state) {
		if (state) {
			foreach (Material m in editor.targets) {
				m.EnableKeyword(keyword);
			}
		}
		else {
			foreach (Material m in editor.targets) {
				m.DisableKeyword(keyword);
			}
		}
	}

    bool IsKeywordEnabled (string keyword) 
    {
		return target.IsKeywordEnabled(keyword);
	}

    void RecordAction (string label) {
		editor.RegisterPropertyChangeUndo(label);
	}

    enum RenderingMode {
		Opaque, Cutout, Fade, Transparent
	}

	struct RenderingSettings {
		public UnityEngine.Rendering.RenderQueue queue;
		public string renderType;
		public UnityEngine.Rendering.BlendMode srcBlend, dstBlend;
		public bool zWrite;

		public static RenderingSettings[] modes = {
			new RenderingSettings() {
				queue = UnityEngine.Rendering.RenderQueue.Geometry,
				renderType = "Opaque",
				srcBlend = UnityEngine.Rendering.BlendMode.One,
				dstBlend = UnityEngine.Rendering.BlendMode.Zero,
				zWrite = true
			},
			new RenderingSettings() {
				queue = UnityEngine.Rendering.RenderQueue.AlphaTest,
				renderType = "TransparentCutout",
				srcBlend = UnityEngine.Rendering.BlendMode.One,
				dstBlend = UnityEngine.Rendering.BlendMode.Zero,
				zWrite = true
			},
			new RenderingSettings() {
				queue = UnityEngine.Rendering.RenderQueue.Transparent,
				renderType = "Transparent",
				srcBlend = UnityEngine.Rendering.BlendMode.SrcAlpha,
				dstBlend = UnityEngine.Rendering.BlendMode.OneMinusSrcAlpha,
				zWrite = false
			},
			new RenderingSettings() {
				queue = UnityEngine.Rendering.RenderQueue.Transparent,
				renderType = "Transparent",
				srcBlend = UnityEngine.Rendering.BlendMode.One,
				dstBlend = UnityEngine.Rendering.BlendMode.OneMinusSrcAlpha,
				zWrite = false
			}
		};
	}

  void DoRenderingMode () 
  {
		RenderingMode mode = RenderingMode.Opaque;
		showCutOff = false;
        showOpacity = false;
		if (IsKeywordEnabled("_RENDERING_CUTOUT")) {
			mode = RenderingMode.Cutout;
			showCutOff = true;
		}
		else if (IsKeywordEnabled("_RENDERING_FADE")) {
			mode = RenderingMode.Fade;
		}
        else if (IsKeywordEnabled("_RENDERING_TRANSPARENT")) {
			mode = RenderingMode.Transparent;
            showOpacity = true;
		}
        else if (IsKeywordEnabled("_RENDERING_OPAQUE")) {
			mode = RenderingMode.Opaque;
		}
		
       // EditorGUI.BeginChangeCheck();

		 mode = (RenderingMode)EditorGUILayout.EnumPopup(MakeLabel("Rendering Mode"), mode);

		//if (EditorGUI.EndChangeCheck()) 
       // {
			//RecordAction("Rendering Mode");

            SetKeyword("_RENDERING_OPAQUE", mode == RenderingMode.Opaque);
			SetKeyword("_RENDERING_CUTOUT", mode == RenderingMode.Cutout);
			SetKeyword("_RENDERING_FADE", mode == RenderingMode.Fade);
            SetKeyword("_RENDERING_TRANSPARENT", mode == RenderingMode.Transparent);

            
            //Needed for HDRP
            if(mode == RenderingMode.Transparent || mode == RenderingMode.Fade || mode == RenderingMode.Cutout)
            SetKeyword("_SURFACE_TYPE_TRANSPARENT", true);
            else
            SetKeyword("_SURFACE_TYPE_TRANSPARENT", false);
            
            SetKeyword("_ALPHATEST_ON", mode == RenderingMode.Cutout);


            if(mode == RenderingMode.Transparent || mode == RenderingMode.Fade)
            SetKeyword("_ENABLE_FOG_ON_TRANSPARENT", true);
            else
			SetKeyword("_ENABLE_FOG_ON_TRANSPARENT", true);

			RenderingSettings settings = RenderingSettings.modes[(int)mode];
			
            foreach (Material m in editor.targets) {
				m.renderQueue = (int)settings.queue;
				m.SetOverrideTag("RenderType", settings.renderType);
				m.SetInt("_SrcBlend", (int)settings.srcBlend);
				m.SetInt("_DstBlend", (int)settings.dstBlend);
                m.SetInt("_AlphaSrcBlend", (int)settings.srcBlend);
				m.SetInt("_AlphaDstBlend", (int)settings.dstBlend);
				m.SetInt("_ZWrite", settings.zWrite ? 1 : 0);
			}
		//}
	}


    public override void OnGUI (MaterialEditor materialEditor, MaterialProperty[] properties)
    {
        SetupGUIStyles ();

        this.editor = materialEditor;
		this.properties = properties;
        this.target = editor.target as Material;

        //base.OnGUI (materialEditor, properties);
        EditorGUIUtility.labelWidth = 0f;

        normalShader = Shader.Find("Enviro3/UBER");
        tessShader = Shader.Find("Hidden/UBER - Tessellation");

        //Base     
        MaterialProperty _CullMode = ShaderGUI.FindProperty("_CullMode", properties);
        MaterialProperty _TilingOffset = ShaderGUI.FindProperty("_TilingOffset", properties);
        MaterialProperty _CutOff = ShaderGUI.FindProperty("_CutOff", properties);
        MaterialProperty _MainTex = ShaderGUI.FindProperty("_MainTex", properties);
        MaterialProperty _Color = ShaderGUI.FindProperty("_Color", properties);
        MaterialProperty _BumpMap = ShaderGUI.FindProperty("_BumpMap", properties);
        MaterialProperty _BumpScale = ShaderGUI.FindProperty("_BumpScale", properties);
        MaterialProperty _BaseMask = ShaderGUI.FindProperty("_BaseMask", properties);
        MaterialProperty _Glossiness = ShaderGUI.FindProperty("_Smoothness", properties);  
        MaterialProperty _OcclusionStrength = ShaderGUI.FindProperty("_OcclusionStrength", properties);
        MaterialProperty _Emission = ShaderGUI.FindProperty("_Emission", properties); 
        MaterialProperty _EmissionMap = ShaderGUI.FindProperty("_EmissionMap", properties);
        MaterialProperty _EmissionColor = ShaderGUI.FindProperty("_EmissionColor", properties);
        MaterialProperty _MetallicBase = ShaderGUI.FindProperty("_MetallicBase", properties); 
        MaterialProperty _Opacity = ShaderGUI.FindProperty("_Opacity", properties); 
        MaterialProperty _ENVIROREMOVALZONES = ShaderGUI.FindProperty("_ENVIROREMOVALZONES", properties);    
        
        //Detail
        MaterialProperty _DetailTilingOffset = ShaderGUI.FindProperty("_DetailTilingOffset", properties);
        MaterialProperty _DetailProceduralMask = ShaderGUI.FindProperty("_DetailProceduralMask", properties);
        MaterialProperty _Mask = ShaderGUI.FindProperty("_Mask", properties);  
        MaterialProperty _DetailMask = ShaderGUI.FindProperty("_DetailMask", properties);      
        MaterialProperty _DetailHeightBlendStrength = ShaderGUI.FindProperty("_DetailHeightBlendStrength", properties);
        MaterialProperty _DetailProceduralMaskIntensity = ShaderGUI.FindProperty("_DetailProceduralMaskIntensity", properties);
        MaterialProperty _DetailProceduralMaskScale = ShaderGUI.FindProperty("_DetailProceduralMaskScale", properties);
        MaterialProperty _DetailAlbedoMap = ShaderGUI.FindProperty("_DetailAlbedoMap", properties);
        MaterialProperty _DetailTint = ShaderGUI.FindProperty("_DetailTint", properties);
        MaterialProperty _DetailHeight = ShaderGUI.FindProperty("_DetailHeight", properties);
        MaterialProperty _DetailThreshold = ShaderGUI.FindProperty("_DetailThreshold", properties);
        MaterialProperty _DetailNormalMap = ShaderGUI.FindProperty("_DetailNormalMap", properties);
        MaterialProperty _DetailNormalMapScale = ShaderGUI.FindProperty("_DetailNormalMapScale", properties);
        MaterialProperty _MetallicDetail = ShaderGUI.FindProperty("_MetallicDetail", properties);
        MaterialProperty _SmoothnessDetail = ShaderGUI.FindProperty("_SmoothnessDetail", properties);    
        MaterialProperty _Tessellation = ShaderGUI.FindProperty("_Tessellation", properties);
        MaterialProperty _TessellationFactor = ShaderGUI.FindProperty("_TessellationFactor", properties);
        MaterialProperty _DisplacementStrength = ShaderGUI.FindProperty("_DisplacementStrength", properties);
        MaterialProperty _DetailNormalInfluence = ShaderGUI.FindProperty("_DetailNormalInfluence", properties);

        //GlobalNormal     
        MaterialProperty _GlobalDetailNormal = ShaderGUI.FindProperty("_GlobalDetailNormal", properties);
        MaterialProperty _GlobalNormal = ShaderGUI.FindProperty("_GlobalNormal", properties);
        MaterialProperty _GlobalNormalIntensity = ShaderGUI.FindProperty("_GlobalNormalIntensity", properties);
        MaterialProperty _GlobalNormalTiling = ShaderGUI.FindProperty("_GlobalNormalTiling", properties);

        //Snow  
        MaterialProperty _Snow = ShaderGUI.FindProperty("_Snow", properties);
        MaterialProperty _SnowTiling = ShaderGUI.FindProperty("_SnowTiling", properties);
        MaterialProperty _SnowAlbedo = ShaderGUI.FindProperty("_SnowAlbedo", properties);
        MaterialProperty _SnowNormal = ShaderGUI.FindProperty("_SnowNormal", properties);
        MaterialProperty _SnowMask = ShaderGUI.FindProperty("_SnowMask", properties);
        MaterialProperty _SnowNormalScale = ShaderGUI.FindProperty("_SnowNormalScale", properties);
        MaterialProperty _SnowDisplacementStrength = ShaderGUI.FindProperty("_SnowDisplacementStrength", properties);
        MaterialProperty _SSSIntensity = ShaderGUI.FindProperty("_SSSIntensity", properties);
        MaterialProperty _SSSScale = ShaderGUI.FindProperty("_SSSScale", properties);
        MaterialProperty _SSSDistortion = ShaderGUI.FindProperty("_SSSDistortion", properties);

        //Wetness
        MaterialProperty _SmoothnessWet = ShaderGUI.FindProperty("_SmoothnessWet", properties);
        MaterialProperty _Rain = ShaderGUI.FindProperty("_Rain", properties);
        MaterialProperty _RainDistanceFade = ShaderGUI.FindProperty("_RainDistanceFade", properties);
        MaterialProperty _RainDropTiling = ShaderGUI.FindProperty("_RainDropTiling", properties);
        MaterialProperty _RainDropSpeed = ShaderGUI.FindProperty("_RainDropSpeed", properties);
        MaterialProperty _RainDropIntensity = ShaderGUI.FindProperty("_RainDropIntensity", properties);
        MaterialProperty _RainFlowStrength = ShaderGUI.FindProperty("_RainFlowStrength", properties);
        MaterialProperty _RainFlowTiling = ShaderGUI.FindProperty("_RainFlowTiling", properties);
        MaterialProperty _RainFlowIntensity = ShaderGUI.FindProperty("_RainFlowIntensity", properties);
        MaterialProperty _RainFlowDistortionScale = ShaderGUI.FindProperty("_RainFlowDistortionScale", properties);
        MaterialProperty _RainFlowDistortionStrenght = ShaderGUI.FindProperty("_RainFlowDistortionStrenght", properties);
        MaterialProperty _RainFlowSmoothnessBoost = ShaderGUI.FindProperty("_RainFlowSmoothnessBoost", properties);

        //Puddles
        MaterialProperty _Puddles = ShaderGUI.FindProperty("_Puddles", properties);
        MaterialProperty _WaveNormal = ShaderGUI.FindProperty("_WaveNormal", properties);
        MaterialProperty _PuddleColor = ShaderGUI.FindProperty("_PuddleColor", properties);
        MaterialProperty _PuddleIntensity = ShaderGUI.FindProperty("_PuddleIntensity", properties);
        MaterialProperty _PuddleCoverageNoise = ShaderGUI.FindProperty("_PuddleCoverageNoise", properties);
        MaterialProperty _PuddleWaveIntensity = ShaderGUI.FindProperty("_PuddleWaveIntensity", properties);
        MaterialProperty _PuddleWaveTiling = ShaderGUI.FindProperty("_PuddleWaveTiling", properties);
 
        EditorGUILayout.BeginVertical(boxStyleModified);
        GUILayout.Label("Enviro - UBER Shader 1.1.1", headerStyle);
        GUILayout.Space(5);

        DoRenderingMode ();

        if(showCutOff)
        materialEditor.ShaderProperty(_CutOff,"Alpha Cut Off");

        materialEditor.ShaderProperty(_CullMode,"Cull");
        GUILayout.Space(5);
        materialEditor.ShaderProperty(_ENVIROREMOVALZONES,"Effect Removal Zone Support");
        
        //Base
        EditorGUILayout.BeginVertical(boxStyleModified);
        GUILayout.Space(2);
        showBase = GUILayout.Toggle(showBase, "Base", headerFoldout);

        if(showBase)
        {   
            materialEditor.ShaderProperty(_TilingOffset,"Tiling / Offset");  
            GUILayout.Space(10);
            materialEditor.TexturePropertySingleLine(albedoText,_MainTex,_Color);
            materialEditor.TexturePropertySingleLine(normalMapText,_BumpMap,_BumpScale);
            materialEditor.ShaderProperty(_BaseMask,"Base Mask (MT/AO/HG/SM)");
            GUILayout.Space(10);

            if(showOpacity)
            materialEditor.ShaderProperty(_Opacity,"Opacity");  
            
            materialEditor.ShaderProperty(_MetallicBase,"Metallic");  
            materialEditor.ShaderProperty(_Glossiness,"Smoothness");

            if(_BaseMask.textureValue == null)
               target.SetFloat("_SmoothnessAdd",_Glossiness.floatValue);
            else
               target.SetFloat("_SmoothnessAdd",0f);
 
            materialEditor.ShaderProperty(_OcclusionStrength,"Occlusion Strength");
            GUILayout.Space(10);    
 
            GUILayout.Label("Tessellation Displacement", headerStyle);
            materialEditor.ShaderProperty(_Tessellation,"Tessellation");
            if(_Tessellation.floatValue == 1f)
            {
                materialEditor.ShaderProperty(_TessellationFactor,"Tessellation Factor");
                materialEditor.ShaderProperty(_DisplacementStrength,"Tessellation Displacement");  
            }

                if(tessShader != null && normalShader != null)
                {
                    foreach (Material m in editor.targets) 
                    {
                        if(m.GetFloat("_Tessellation") == 1f)
                        {
                            if(m.shader == normalShader)
                                m.shader = tessShader;
                        }
                        else
                        {
                            if(m.shader == tessShader)
                                m.shader = normalShader;
                        }
                    }  
                }       

            GUILayout.Space(10);
            
            materialEditor.ShaderProperty(_Emission,"Enable Emission");
            if(_Emission.floatValue > 0f)
            {
            materialEditor.ShaderProperty(_EmissionMap,"Emission");
            materialEditor.ShaderProperty(_EmissionColor,"Emission Color");
            }
        }
        GUILayout.Space(2);
        EditorGUILayout.EndVertical();     
        GUILayout.Space(5);
        
        //Detail
        EditorGUILayout.BeginVertical(boxStyleModified);
        GUILayout.Space(2);
        showDetail = GUILayout.Toggle(showDetail, "Detail", headerFoldout);
    
        if(showDetail)
        {
            
            materialEditor.ShaderProperty(_DetailTilingOffset,"Tiling / Offset"); 

            GUILayout.Space(10);
            materialEditor.ShaderProperty(_DetailProceduralMask,"Procedural Mask"); 
            if(_DetailProceduralMask.floatValue == 0f)
            {

            }     
            else if(_DetailProceduralMask.floatValue == 1f)
            {
            materialEditor.ShaderProperty(_Mask,"Mask");         
            } 
            else if(_DetailProceduralMask.floatValue == 2f)
            {
                materialEditor.ShaderProperty(_DetailProceduralMaskScale,"Procedural Mask Scale"); 
                materialEditor.ShaderProperty(_DetailProceduralMaskIntensity,"Procedural Mask Intensity"); 
            }
            else
            {
                materialEditor.ShaderProperty(_DetailHeight,"Detail Height");
                materialEditor.ShaderProperty(_DetailThreshold,"Detail Threshold");
                materialEditor.ShaderProperty(_DetailNormalInfluence,"Detail Normal Influence");
                
            }
            
            materialEditor.ShaderProperty(_DetailHeightBlendStrength,"Detail Height Blending Strength");
            
            GUILayout.Space(10);
            materialEditor.TexturePropertySingleLine(detailText,_DetailAlbedoMap,_DetailTint);
            materialEditor.TexturePropertySingleLine(detailNormalMapText,_DetailNormalMap,_DetailNormalMapScale);
            materialEditor.ShaderProperty(_DetailMask,"Detail Mask (MT/AO/HG/SM)");     
            GUILayout.Space(5);    
            materialEditor.ShaderProperty(_MetallicDetail,"Metallic"); 
            materialEditor.ShaderProperty(_SmoothnessDetail,"Smoothness"); 

            if(_DetailMask.textureValue == null)
               target.SetFloat("_SmoothnessDetailAdd",_SmoothnessDetail.floatValue);
            else
               target.SetFloat("_SmoothnessDetailAdd",0f);
            
        }
        GUILayout.Space(2);
        EditorGUILayout.EndVertical();
        GUILayout.Space(5);

        //Global Normal
        EditorGUILayout.BeginVertical(boxStyleModified);
        GUILayout.Space(2);
        showGlobalNormal = GUILayout.Toggle(showGlobalNormal, "Global Normal Details", headerFoldout);
    
        if(showGlobalNormal)
        {
            materialEditor.ShaderProperty(_GlobalDetailNormal,"Enable Triplanar Normal");
            if(_GlobalDetailNormal.floatValue > 0)
            {
            materialEditor.TexturePropertySingleLine(globalNormalMapText,_GlobalNormal,_GlobalNormalIntensity);
            materialEditor.ShaderProperty(_GlobalNormalTiling,"Global Normal Tiling"); 
            }
        }
        GUILayout.Space(2);
        EditorGUILayout.EndVertical();
        GUILayout.Space(5);
        
        //Snow
        EditorGUILayout.BeginVertical(boxStyleModified);
        GUILayout.Space(2);
        showSnow = GUILayout.Toggle(showSnow, "Snow", headerFoldout);
    
        if(showSnow)
        {
            materialEditor.ShaderProperty(_Snow,"Snow");
            materialEditor.ShaderProperty(_SnowTiling,"Snow Tiling");
            GUILayout.Label("Texture", headerStyle);
            materialEditor.ShaderProperty(_SnowAlbedo,"Snow Albedo");
            materialEditor.TexturePropertySingleLine(snowNormalMapText,_SnowNormal,_SnowNormalScale); 
            materialEditor.ShaderProperty(_SnowMask,"Snow Mask (MT/AO/HG/SM)"); 
            GUILayout.Space(5);
            GUILayout.Label("Snow Displacement", headerStyle);

            if(target.shader.name.Contains("Tessellation"))
            { 
               if(_Tessellation.floatValue == 1f)
                {
                    materialEditor.ShaderProperty(_SnowDisplacementStrength,"Snow Displacement Strength"); 
                }
                else
                {
                    GUILayout.Label("Please activate Tessellation for snow displacement.", wrapStyle);
                }
            }
            else
            {
                materialEditor.ShaderProperty(_Tessellation,"Snow Displacement");
                materialEditor.ShaderProperty(_SnowDisplacementStrength,"Snow Displacement Strength"); 

            }
    
            
            GUILayout.Space(5);
            GUILayout.Label("Subsurface Scattering", headerStyle);
            materialEditor.ShaderProperty(_SSSIntensity,"Subsurface Scattering Intensity"); 
            materialEditor.ShaderProperty(_SSSScale,"Subsurface Scattering Scale"); 
            materialEditor.ShaderProperty(_SSSDistortion,"Subsurface Scattering Distortion"); 

        }
        GUILayout.Space(2);
        EditorGUILayout.EndVertical();
        GUILayout.Space(5);

        //Wetness
        EditorGUILayout.BeginVertical(boxStyleModified);
        GUILayout.Space(2);
        showWetness = GUILayout.Toggle(showWetness, "Rain", headerFoldout);
    
        if(showWetness)
        {
           GUILayout.Label("Wetness", headerStyle);
           materialEditor.ShaderProperty(_SmoothnessWet,"Smoothness Boost");
           GUILayout.Space(10);
           materialEditor.ShaderProperty(_Rain,"Rain Effects");
           materialEditor.ShaderProperty(_RainDistanceFade,"Rain Distance Fade");
           GUILayout.Space(10);
           GUILayout.Label("Rain Drops", headerStyle);
           materialEditor.ShaderProperty(_RainDropTiling,"Rain Drop Tiling");
           materialEditor.ShaderProperty(_RainDropSpeed,"Rain Drop Speed");
           materialEditor.ShaderProperty(_RainDropIntensity,"Rain Drop Intensity");
           GUILayout.Space(10);
           GUILayout.Label("Rain Flow", headerStyle);
           materialEditor.ShaderProperty(_RainFlowTiling,"Rain Flow Tiling");
           materialEditor.ShaderProperty(_RainFlowStrength,"Rain Flow Strength");
           materialEditor.ShaderProperty(_RainFlowIntensity,"Rain Flow Intensity");
           materialEditor.ShaderProperty(_RainFlowSmoothnessBoost,"Rain Flow Smoothness");
           materialEditor.ShaderProperty(_RainFlowDistortionScale,"Rain Flow Distortion Scale");
           materialEditor.ShaderProperty(_RainFlowDistortionStrenght,"Rain Flow Distortion Strength");


        }
        GUILayout.Space(2);
        EditorGUILayout.EndVertical();
        GUILayout.Space(5);

        //Puddles
        EditorGUILayout.BeginVertical(boxStyleModified);
        GUILayout.Space(2);
        showPuddles = GUILayout.Toggle(showPuddles, "Puddles", headerFoldout);
    
        if(showPuddles)
        {
            materialEditor.ShaderProperty(_Puddles,"Puddles");
            GUILayout.Space(5);
            materialEditor.ShaderProperty(_PuddleCoverageNoise,"Puddle Coverage");
            materialEditor.ShaderProperty(_PuddleIntensity,"Puddle Intensity");
            materialEditor.ShaderProperty(_PuddleColor,"Puddle Color");
            GUILayout.Space(5);
            materialEditor.ShaderProperty(_WaveNormal,"Puddle Wave Normal");
            materialEditor.ShaderProperty(_PuddleWaveTiling,"Puddle Wave Tiling");
            materialEditor.ShaderProperty(_PuddleWaveIntensity,"Puddle Wave Scale");
        }
        GUILayout.Space(2);
        EditorGUILayout.EndVertical();
        GUILayout.Space(5);
        materialEditor.RenderQueueField();
        materialEditor.EnableInstancingField();
        materialEditor.DoubleSidedGIField();
        EditorGUILayout.EndVertical();
    }
}  
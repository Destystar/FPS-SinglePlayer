using UnityEditor;
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace EnviroUBER
{
    [Serializable]
    public class MaterialConvert
    {
        public bool convert = true;
        public MeshRenderer renderer;
        public Material origMat;
        public Material newMat;
    }
    
    public class EnviroMaterialConverter : EditorWindow
    {
        ////////////////// GUI ///////////////////////////////
        private Vector2 scrollPosition = Vector2.zero;
        private GUIStyle boxStyle;
        private GUIStyle boxStyleModified;
        private GUIStyle wrapStyle;
        private GUIStyle headerStyle;
        private GUIStyle headerStyleMid;
        private GUIStyle headerFoldout;
        private GUIStyle popUpStyle;
        private GUIStyle integrationBox;
        //////////////////////////////////////////////////

        private GameObject rootObject;
        private string dataPath = "Assets/Enviro 3 - UBER Shader/CustomData";
        private Material templateMat;
        private List <MaterialConvert> materials = new List<MaterialConvert>();
        private Material myMat;
 
        struct RenderingSettings 
        {
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

        [MenuItem("Window/Enviro - UBER Shader/Material Converter")]
        public static void ShowWindow()
        {
            //Show existing window instance. If one doesn't exist, make one.
            EditorWindow.GetWindow(typeof(EnviroMaterialConverter));
        } 

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

    }
        
        void OnGUI()
        {
            SetupGUIStyles ();
            GUILayout.Label ("Enviro Material Converter", EditorStyles.boldLabel);
            GUILayout.BeginVertical(); 
           // rootObject = (GameObject)EditorGUI.ObjectField(new Rect(3, 3, position.width - 6, 20), "Root Object", rootObject, typeof(GameObject),true);
           // templateMat = (Material)EditorGUI.ObjectField(new Rect(3, 3, position.width - 6, 20), "Template Material", templateMat, typeof(Material),true);
            rootObject = (GameObject)EditorGUILayout.ObjectField("Root Object", rootObject,typeof(GameObject), true);  
            dataPath = EditorGUILayout.TextField("Save Data Path", dataPath);  
            templateMat = (Material)EditorGUILayout.ObjectField("Template Material", templateMat,typeof(Material), true);  

            EditorGUILayout.LabelField("(OPTIONAL) Assign a template material using the Enviro UBER shader. All converted materials will use the template settings as defaults!",  EditorStyles.helpBox);
            GUILayout.Space(3);
            GUILayout.EndVertical();
            
            if(rootObject != null)
            {
                GUILayout.BeginVertical(); 
                if (GUILayout.Button("Initialize Converter"))
                {
                    Initialize();
                } 

                if(materials.Count == 0)
                EditorGUILayout.LabelField("Click on 'Initialize' to scan your object to find all materials that can be converted.",  EditorStyles.helpBox);
                
                GUILayout.Space(10);
                scrollPosition = GUILayout.BeginScrollView(scrollPosition, false, false,  GUILayout.Width(position.width - 6),  GUILayout.Height(200)); 
                for (int i = 0; i < materials.Count; i++)
                {
                    GUILayout.BeginVertical("",boxStyleModified); 
                    if(materials[i] != null)
                    //EditorGUILayout.LabelField(materials[i].origMat.name,  EditorStyles.boldLabel); 
                    materials[i].origMat = (Material)EditorGUILayout.ObjectField("Material", materials[i].origMat,typeof(Material), true);  
                    materials[i].convert = EditorGUILayout.Toggle("Convert",materials[i].convert) ;
                    GUILayout.Space(2);
                    GUILayout.EndVertical();
                }
                GUILayout.EndScrollView();
                if(materials.Count > 0)
                {
                    if (GUILayout.Button("Convert"))
                    {
                        Convert();
                    } 
                }
                GUILayout.EndVertical();
            }
            else
            {
                EditorGUILayout.LabelField("Assign your root object you want to convert to Enviro UBER shader.",  EditorStyles.helpBox); 
            }
        }


        private void Initialize()
        {
            if(rootObject != null) 
            {
                //GameObject newRoot = GameObject.Instantiate(rootObject) as GameObject;

                materials = new List<MaterialConvert>();
                MeshRenderer [] meshRenderers = rootObject.GetComponentsInChildren<MeshRenderer>();

                for(int i = 0; i < meshRenderers.Length; i++)
                {
                    for (int m = 0; m < meshRenderers[i].sharedMaterials.Length; m++)
                    {
                        string shaderName = meshRenderers[i].sharedMaterials[m].shader.name;
                        if((shaderName == "Standard" || shaderName == "Universal Render Pipeline/Complex Lit" || shaderName == "Universal Render Pipeline/Lit" || shaderName == "Universal Render Pipeline/Simple Lit" || shaderName == "HDRP/Lit" || shaderName == "HDRP/LitTessellation") && !alreadyAdded(meshRenderers[i].sharedMaterials[m]))
                           {
                            MaterialConvert mc = new MaterialConvert();
                            mc.renderer = meshRenderers[i];
                            mc.origMat = meshRenderers[i].sharedMaterials[m];
                            materials.Add(mc);
                           } 
                    }
                }
            }
        }

        private void Convert()
        {
            for (int i = 0; i < materials.Count; i++)
            {
               if(materials[i].convert)
               {
                    string folderPath = CreateFolder(materials[i].origMat.name);
                    Material material = new Material(Shader.Find("Enviro3/UBER"));

                    if(templateMat != null)
                       material.CopyPropertiesFromMaterial(templateMat);

                    string newAssetPath = folderPath + "/";
                    AssetDatabase.CreateAsset(material, newAssetPath + materials[i].origMat.name + "_Enviro.mat");
                    materials[i].newMat = material;

                    if(materials[i].origMat.shader.name == "Standard")
                       SetupMaterialStandard(newAssetPath, i);

                    if(materials[i].origMat.shader.name == "Universal Render Pipeline/Complex Lit" || materials[i].origMat.shader.name == "Universal Render Pipeline/Lit" || materials[i].origMat.shader.name == "Universal Render Pipeline/Simple Lit")
                       SetupMaterialURP(newAssetPath, i);

                    if(materials[i].origMat.shader.name == "HDRP/Lit" || materials[i].origMat.shader.name == "HDRP/LitTessellation")
                       SetupMaterialHDRP(newAssetPath, i);
               }
            }
            ChangeMaterials();
        }
 

        private string CreateFolder(string FolderName)
        {
            string guid = AssetDatabase.CreateFolder(dataPath, FolderName);
            return AssetDatabase.GUIDToAssetPath(guid);
        }


        private void SetupMaterialHDRP(string path, int i)
        {
            int mode = 0;

            if(materials[i].origMat.GetFloat("_SurfaceType") == 0 && materials[i].origMat.GetFloat("_AlphaCutoffEnable") ==  0)
            {
                    mode = 0;
                    materials[i].newMat.EnableKeyword("_RENDERING_OPAQUE");
                    materials[i].newMat.DisableKeyword("_RENDERING_CUTOUT");
                    materials[i].newMat.DisableKeyword("_RENDERING_FADE");
                    materials[i].newMat.DisableKeyword("_RENDERING_TRANSPARENT");      
            } 
            else if(materials[i].origMat.GetFloat("_SurfaceType") == 0 && materials[i].origMat.GetFloat("_AlphaCutoffEnable") >  0)
            {
                    mode = 1;
                    materials[i].newMat.EnableKeyword("_RENDERING_CUTOUT");
                    materials[i].newMat.DisableKeyword("_RENDERING_FADE");
                    materials[i].newMat.DisableKeyword("_RENDERING_TRANSPARENT");
                    materials[i].newMat.DisableKeyword("_RENDERING_OPAQUE");
            }
            else if(materials[i].origMat.GetFloat("_SurfaceType") == 1 && materials[i].origMat.GetFloat("_BlendMode") == 0)
            {
                    mode = 2;
                    materials[i].newMat.EnableKeyword("_RENDERING_FADE");
                    materials[i].newMat.DisableKeyword("_RENDERING_TRANSPARENT");
                    materials[i].newMat.DisableKeyword("_RENDERING_OPAQUE");
                    materials[i].newMat.DisableKeyword("_RENDERING_CUTOUT");
            }
            else
            {
                    mode = 3;
                    materials[i].newMat.EnableKeyword("_RENDERING_TRANSPARENT");
                    materials[i].newMat.DisableKeyword("_RENDERING_OPAQUE");
                    materials[i].newMat.DisableKeyword("_RENDERING_CUTOUT");
                    materials[i].newMat.DisableKeyword("_RENDERING_FADE");

            }



            //Main
            if(materials[i].origMat.GetTexture("_BaseColorMap") != null)
               materials[i].newMat.SetTexture("_MainTex", materials[i].origMat.GetTexture("_BaseColorMap"));

            materials[i].newMat.SetColor("_BaseColor", materials[i].origMat.GetColor("_BaseColor"));
            materials[i].newMat.SetVector("_TilingOffset", new Vector4 (materials[i].origMat.GetTextureScale("_BaseColorMap").x,materials[i].origMat.GetTextureScale("_BaseColorMap").y,materials[i].origMat.GetTextureOffset("_BaseColorMap").x,materials[i].origMat.GetTextureOffset("_BaseColorMap").y));

            //Normal
            if(materials[i].origMat.GetTexture("_NormalMap") != null)
               materials[i].newMat.SetTexture("_BumpMap", materials[i].origMat.GetTexture("_NormalMap"));
            
            materials[i].newMat.SetFloat("_BumpScale", materials[i].origMat.GetFloat("_NormalScale"));
            
            Texture2D metallicTex= null;
            Texture2D occlusionTex= null;
            Texture2D heightTex= null;
            Texture2D smoothnessTex = null;

            if(materials[i].origMat.GetTexture("_MaskMap") != null)
            {
                metallicTex = (Texture2D)materials[i].origMat.GetTexture("_MaskMap");
                occlusionTex = (Texture2D)materials[i].origMat.GetTexture("_MaskMap");
                smoothnessTex = (Texture2D)materials[i].origMat.GetTexture("_MaskMap");

                if(materials[i].origMat.GetTexture("_HeightMap") != null)
                    heightTex = (Texture2D)materials[i].origMat.GetTexture("_HeightMap");
                else
                    heightTex = Texture2D.blackTexture;

            Texture2D mask = CreateMaskTexture(path, metallicTex, occlusionTex, heightTex, smoothnessTex, new Vector4(0,1,0,4));

            if(mask != null)
               materials[i].newMat.SetTexture("_BaseMask", mask);
            }


            // Details 
            /*if(materials[i].origMat.GetTexture("_DetailMask") != null)
            {
            materials[i].newMat.SetTexture("_Mask", materials[i].origMat.GetTexture("_DetailMask"));
                
            if(materials[i].origMat.GetTexture("_DetailAlbedoMap") != null)
            {
                materials[i].newMat.SetVector("_DetailMaskTiling", new Vector4(materials[i].origMat.GetTextureScale("_DetailAlbedoMap").x,materials[i].origMat.GetTextureScale("_DetailAlbedoMap").y,materials[i].origMat.GetTextureOffset("_DetailAlbedoMap").x,materials[i].origMat.GetTextureOffset("_DetailAlbedoMap").y));
                materials[i].newMat.SetTexture("_DetailAlbedoMap", materials[i].origMat.GetTexture("_DetailAlbedoMap"));
            }

            if(materials[i].origMat.GetTexture("_DetailNormalMap") != null)
                materials[i].newMat.SetTexture("_DetailNormalMap", materials[i].origMat.GetTexture("_DetailNormalMap"));
            
            materials[i].newMat.SetFloat("_DetailNormalMapScale", materials[i].origMat.GetFloat("_DetailNormalMapScale"));
            materials[i].newMat.SetFloat("_DetailProceduralMask", 1);
            }*/


            if(materials[i].origMat.GetTexture("_EmissiveColorMap") != null)
            {
                materials[i].newMat.SetFloat("_Emission", 1f);
                materials[i].newMat.SetTexture("_EmissionMap", materials[i].origMat.GetTexture("_EmissiveColorMap"));
                materials[i].newMat.SetColor("_EmissionColor", materials[i].origMat.GetColor("_EmissiveColor"));
            }

            if(materials[i].origMat.GetTexture("_MaskMap") != null)
            {
                float MetallicMin =  materials[i].origMat.GetFloat("_MetallicRemapMin");
                float MetallicMax =  materials[i].origMat.GetFloat("_MetallicRemapMax");

                float SmoothnessMin =  materials[i].origMat.GetFloat("SmoothnessRemapMin");
                float SmoothnessMax =  materials[i].origMat.GetFloat("_SmoothnessRemapMax");

                float OcclusionsMin =  materials[i].origMat.GetFloat("AORemapMin");
                float OcclusionMax =  materials[i].origMat.GetFloat("_AORemapMax");

                materials[i].newMat.SetFloat("_Glossiness", SmoothnessMax);
                materials[i].newMat.SetFloat("_MetallicBase", MetallicMin);
                materials[i].newMat.SetFloat("_OcclusionStrength", OcclusionMax);
            }
            else
            {
                materials[i].newMat.SetFloat("_Glossiness", materials[i].origMat.GetFloat("_Smoothness"));
                materials[i].newMat.SetFloat("_MetallicBase", materials[i].origMat.GetFloat("_Metallic"));
                materials[i].newMat.SetFloat("_OcclusionStrength", 1f);
            }
            
            materials[i].newMat.SetFloat("_CutOff", materials[i].origMat.GetFloat("_AlphaCutoff"));
            //materials[i].newMat.SetFloat("_DisplacementStrength", materials[i].origMat.GetFloat("_Parallax"));  
            materials[i].newMat.SetFloat("_CullMode", materials[i].origMat.GetFloat("_CullMode"));

            RenderingSettings settings = RenderingSettings.modes[(int)mode];

            materials[i].newMat.renderQueue = (int)settings.queue;
			materials[i].newMat.SetOverrideTag("RenderType", settings.renderType);
			materials[i].newMat.SetInt("_SrcBlend", (int)settings.srcBlend);
			materials[i].newMat.SetInt("_DstBlend", (int)settings.dstBlend); 
            materials[i].newMat.SetInt("_AlphaSrcBlend", (int)settings.srcBlend);
			materials[i].newMat.SetInt("_AlphaDstBlend", (int)settings.dstBlend);
			materials[i].newMat.SetInt("_ZWrite", settings.zWrite ? 1 : 0);          
        }

        private void SetupMaterialURP(string path, int i)
        {
            int mode = 0;

            for(int k = 0; k < materials[i].origMat.shaderKeywords.Length; k++)
            {
                if(materials[i].origMat.shaderKeywords[k] == "_ALPHATEST_ON")
                {
                    mode = 1;
                    materials[i].newMat.EnableKeyword("_RENDERING_CUTOUT");
                    materials[i].newMat.DisableKeyword("_RENDERING_FADE");
                    materials[i].newMat.DisableKeyword("_RENDERING_TRANSPARENT");
                    materials[i].newMat.DisableKeyword("_RENDERING_OPAQUE");
                    break;
                }
                else if(materials[i].origMat.shaderKeywords[k] == "_SURFACE_TYPE_TRANSPARENT") 
                {
                    mode = 2;
                    materials[i].newMat.EnableKeyword("_RENDERING_FADE");
                    materials[i].newMat.DisableKeyword("_RENDERING_TRANSPARENT");
                    materials[i].newMat.DisableKeyword("_RENDERING_OPAQUE");
                    materials[i].newMat.DisableKeyword("_RENDERING_CUTOUT");
                    break;
                }
                else if(materials[i].origMat.shaderKeywords[k] == "_ALPHAPREMULTIPLY_ON") 
                {
                    mode = 3;
                    materials[i].newMat.EnableKeyword("_RENDERING_TRANSPARENT");
                    materials[i].newMat.DisableKeyword("_RENDERING_OPAQUE");
                    materials[i].newMat.DisableKeyword("_RENDERING_CUTOUT");
                    materials[i].newMat.DisableKeyword("_RENDERING_FADE");
                    break;
                }
                else
                {
                    mode = 0;
                    materials[i].newMat.EnableKeyword("_RENDERING_OPAQUE");
                    materials[i].newMat.DisableKeyword("_RENDERING_CUTOUT");
                    materials[i].newMat.DisableKeyword("_RENDERING_FADE");
                    materials[i].newMat.DisableKeyword("_RENDERING_TRANSPARENT"); 
                    break;        
                 }
            }

            //Main
            if(materials[i].origMat.GetTexture("_BaseMap") != null)
               materials[i].newMat.SetTexture("_MainTex", materials[i].origMat.GetTexture("_BaseMap"));

            materials[i].newMat.SetColor("_Color", materials[i].origMat.GetColor("_BaseColor"));
            materials[i].newMat.SetVector("_TilingOffset", new Vector4 (materials[i].origMat.GetTextureScale("_BaseMap").x,materials[i].origMat.GetTextureScale("_BaseMap").y,materials[i].origMat.GetTextureOffset("_BaseMap").x,materials[i].origMat.GetTextureOffset("_BaseMap").y));

            //Normal
            if(materials[i].origMat.GetTexture("_BumpMap") != null)
               materials[i].newMat.SetTexture("_BumpMap", materials[i].origMat.GetTexture("_BumpMap"));
            
            materials[i].newMat.SetFloat("_BumpScale", materials[i].origMat.GetFloat("_BumpScale"));
            
            Texture2D metallicTex= null;
            Texture2D occlusionTex= null;
            Texture2D heightTex= null;
            Texture2D smoothnessTex = null;

            if(materials[i].origMat.GetTexture("_MetallicGlossMap") != null)
               metallicTex = (Texture2D)materials[i].origMat.GetTexture("_MetallicGlossMap");
            else
               metallicTex = Texture2D.blackTexture;

            if(materials[i].origMat.GetTexture("_OcclusionMap") != null)
               occlusionTex =  (Texture2D)materials[i].origMat.GetTexture("_OcclusionMap");
            else
               occlusionTex = Texture2D.blackTexture;
              
            if(materials[i].origMat.GetTexture("_ParallaxMap") != null)
               heightTex = (Texture2D)materials[i].origMat.GetTexture("_ParallaxMap");
            else
               heightTex = Texture2D.blackTexture;

            float sChannel = materials[i].origMat.GetFloat("_SmoothnessTextureChannel");

            if(sChannel == 0) 
            {
            if(materials[i].origMat.GetTexture("_MetallicGlossMap") != null)
               smoothnessTex =  (Texture2D)materials[i].origMat.GetTexture("_MetallicGlossMap");
            }
            else
            {
            if(materials[i].origMat.GetTexture("_BaseMap") != null)
               smoothnessTex =  (Texture2D)materials[i].origMat.GetTexture("_BaseMap");
            }
          
            Texture2D mask = CreateMaskTexture(path, metallicTex, occlusionTex, heightTex, smoothnessTex, new Vector4(0,0,0,4));

            if(mask != null)
               materials[i].newMat.SetTexture("_BaseMask", mask);

            if(materials[i].origMat.GetTexture("_DetailMask") != null)
            {
            materials[i].newMat.SetTexture("_Mask", materials[i].origMat.GetTexture("_DetailMask"));
                
            if(materials[i].origMat.GetTexture("_DetailAlbedoMap") != null)
            {
                materials[i].newMat.SetVector("_DetailMaskTiling", new Vector4(materials[i].origMat.GetTextureScale("_DetailAlbedoMap").x,materials[i].origMat.GetTextureScale("_DetailAlbedoMap").y,materials[i].origMat.GetTextureOffset("_DetailAlbedoMap").x,materials[i].origMat.GetTextureOffset("_DetailAlbedoMap").y));
                materials[i].newMat.SetTexture("_DetailAlbedoMap", materials[i].origMat.GetTexture("_DetailAlbedoMap"));
            }

            if(materials[i].origMat.GetTexture("_DetailNormalMap") != null)
                materials[i].newMat.SetTexture("_DetailNormalMap", materials[i].origMat.GetTexture("_DetailNormalMap"));
            
            materials[i].newMat.SetFloat("_DetailNormalMapScale", materials[i].origMat.GetFloat("_DetailNormalMapScale"));
            materials[i].newMat.SetFloat("_DetailProceduralMask", 1);     
            }

            if(materials[i].origMat.GetTexture("_EmissionMap") != null)
            {
                 materials[i].newMat.SetFloat("_Emission", 1f);
                materials[i].newMat.SetTexture("_EmissionMap", materials[i].origMat.GetTexture("_EmissionMap"));
                materials[i].newMat.SetColor("_EmissionColor", materials[i].origMat.GetColor("_EmissionColor"));
            }

            materials[i].newMat.SetFloat("_Glossiness", materials[i].origMat.GetFloat("_Glossiness"));
            materials[i].newMat.SetFloat("_MetallicBase", materials[i].origMat.GetFloat("_Metallic"));
            materials[i].newMat.SetFloat("_CutOff", materials[i].origMat.GetFloat("_Cutoff"));
            materials[i].newMat.SetFloat("_OcclusionStrength", materials[i].origMat.GetFloat("_OcclusionStrength"));
            materials[i].newMat.SetFloat("_DisplacementStrength", materials[i].origMat.GetFloat("_Parallax"));  
            materials[i].newMat.SetFloat("_CullMode", materials[i].origMat.GetFloat("_Cull"));

            RenderingSettings settings = RenderingSettings.modes[(int)mode];

            materials[i].newMat.renderQueue = (int)settings.queue;
			materials[i].newMat.SetOverrideTag("RenderType", settings.renderType);
			materials[i].newMat.SetInt("_SrcBlend", (int)settings.srcBlend);
			materials[i].newMat.SetInt("_DstBlend", (int)settings.dstBlend); 
            materials[i].newMat.SetInt("_AlphaSrcBlend", (int)settings.srcBlend);
			materials[i].newMat.SetInt("_AlphaDstBlend", (int)settings.dstBlend);
			materials[i].newMat.SetInt("_ZWrite", settings.zWrite ? 1 : 0);          
        }


        private void SetupMaterialStandard(string path, int i)
        {
            int mode = 0;

            for(int k = 0; k < materials[i].origMat.shaderKeywords.Length; k++)
            {
                if(materials[i].origMat.shaderKeywords[k] == "_ALPHATEST_ON")
                {
                    mode = 1;
                    materials[i].newMat.EnableKeyword("_RENDERING_CUTOUT");
                    materials[i].newMat.DisableKeyword("_RENDERING_FADE");
                    materials[i].newMat.DisableKeyword("_RENDERING_TRANSPARENT");
                    materials[i].newMat.DisableKeyword("_RENDERING_OPAQUE");
                    break;
                }
                else if(materials[i].origMat.shaderKeywords[k] == "_ALPHABLEND_ON") 
                {
                    mode = 2;
                    materials[i].newMat.EnableKeyword("_RENDERING_FADE");
                    materials[i].newMat.DisableKeyword("_RENDERING_TRANSPARENT");
                    materials[i].newMat.DisableKeyword("_RENDERING_OPAQUE");
                    materials[i].newMat.DisableKeyword("_RENDERING_CUTOUT");
                    break;
                }
                else if(materials[i].origMat.shaderKeywords[k] == "_ALPHAPREMULTIPLY_ON") 
                {
                    mode = 3;
                    materials[i].newMat.EnableKeyword("_RENDERING_TRANSPARENT");
                    materials[i].newMat.DisableKeyword("_RENDERING_OPAQUE");
                    materials[i].newMat.DisableKeyword("_RENDERING_CUTOUT");
                    materials[i].newMat.DisableKeyword("_RENDERING_FADE");
                    break;
                }
                else
                {
                    mode = 0;
                    materials[i].newMat.EnableKeyword("_RENDERING_OPAQUE");
                    materials[i].newMat.DisableKeyword("_RENDERING_CUTOUT");
                    materials[i].newMat.DisableKeyword("_RENDERING_FADE");
                    materials[i].newMat.DisableKeyword("_RENDERING_TRANSPARENT"); 
                    break;        
                 }
            }

            //Main
            if(materials[i].origMat.GetTexture("_MainTex") != null)
               materials[i].newMat.SetTexture("_MainTex", materials[i].origMat.GetTexture("_MainTex"));

            materials[i].newMat.SetColor("_Color", materials[i].origMat.GetColor("_Color"));
            materials[i].newMat.SetVector("_TilingOffset", new Vector4 (materials[i].origMat.GetTextureScale("_MainTex").x,materials[i].origMat.GetTextureScale("_MainTex").y,materials[i].origMat.GetTextureOffset("_MainTex").x,materials[i].origMat.GetTextureOffset("_MainTex").y));

            //Normal
            if(materials[i].origMat.GetTexture("_BumpMap") != null)
               materials[i].newMat.SetTexture("_BumpMap", materials[i].origMat.GetTexture("_BumpMap"));
            
            materials[i].newMat.SetFloat("_BumpScale", materials[i].origMat.GetFloat("_BumpScale"));
            
            Texture2D metallicTex= null;
            Texture2D occlusionTex= null;
            Texture2D heightTex= null;
            Texture2D smoothnessTex = null;

            if(materials[i].origMat.GetTexture("_MetallicGlossMap") != null)
               metallicTex = (Texture2D)materials[i].origMat.GetTexture("_MetallicGlossMap");
            else
               metallicTex = Texture2D.blackTexture;

            if(materials[i].origMat.GetTexture("_OcclusionMap") != null)
               occlusionTex =  (Texture2D)materials[i].origMat.GetTexture("_OcclusionMap");
            else
               occlusionTex = Texture2D.blackTexture;
              
            if(materials[i].origMat.GetTexture("_ParallaxMap") != null)
               heightTex = (Texture2D)materials[i].origMat.GetTexture("_ParallaxMap");
            else
               heightTex = Texture2D.blackTexture;

            float sChannel = materials[i].origMat.GetFloat("_SmoothnessTextureChannel");

            if(sChannel == 0) 
            {
            if(materials[i].origMat.GetTexture("_MetallicGlossMap") != null)
               smoothnessTex =  (Texture2D)materials[i].origMat.GetTexture("_MetallicGlossMap");
            }
            else
            {
            if(materials[i].origMat.GetTexture("_MainTex") != null)
               smoothnessTex =  (Texture2D)materials[i].origMat.GetTexture("_MainTex");
            }
          
            Texture2D mask = CreateMaskTexture(path, metallicTex, occlusionTex, heightTex, smoothnessTex, new Vector4(0,0,0,4));

            if(mask != null)
               materials[i].newMat.SetTexture("_BaseMask", mask);

            if(materials[i].origMat.GetTexture("_DetailMask") != null)
            {
            materials[i].newMat.SetTexture("_Mask", materials[i].origMat.GetTexture("_DetailMask"));
                
            if(materials[i].origMat.GetTexture("_DetailAlbedo") != null)
            {
                materials[i].newMat.SetVector("_DetailMaskTiling", new Vector4(materials[i].origMat.GetTextureScale("_DetailAlbedo").x,materials[i].origMat.GetTextureScale("_DetailAlbedo").y,materials[i].origMat.GetTextureOffset("_DetailAlbedo").x,materials[i].origMat.GetTextureOffset("_DetailAlbedo").y));
                materials[i].newMat.SetTexture("_DetailAlbedoMap", materials[i].origMat.GetTexture("_DetailAlbedo"));
            }

            if(materials[i].origMat.GetTexture("_DetailNormalMap") != null)
                materials[i].newMat.SetTexture("_DetailNormalMap", materials[i].origMat.GetTexture("_DetailNormalMap"));
            
            materials[i].newMat.SetFloat("_DetailNormalMapScale", materials[i].origMat.GetFloat("_DetailNormalMapScale"));
            materials[i].newMat.SetFloat("_DetailProceduralMask", 1);     
            }

            if(materials[i].origMat.GetTexture("_EmissionMap") != null)
            {
                 materials[i].newMat.SetFloat("_Emission", 1f);
                materials[i].newMat.SetTexture("_EmissionMap", materials[i].origMat.GetTexture("_EmissionMap"));
                materials[i].newMat.SetColor("_EmissionColor", materials[i].origMat.GetColor("_EmissionColor"));
            }



            materials[i].newMat.SetFloat("_Glossiness", materials[i].origMat.GetFloat("_Glossiness"));
            materials[i].newMat.SetFloat("_MetallicBase", materials[i].origMat.GetFloat("_Metallic"));
            materials[i].newMat.SetFloat("_CutOff", materials[i].origMat.GetFloat("_Cutoff"));
            materials[i].newMat.SetFloat("_OcclusionStrength", materials[i].origMat.GetFloat("_OcclusionStrength"));
            materials[i].newMat.SetFloat("_DisplacementStrength", materials[i].origMat.GetFloat("_Parallax"));  

            RenderingSettings settings = RenderingSettings.modes[(int)mode];

            materials[i].newMat.renderQueue = (int)settings.queue;
			materials[i].newMat.SetOverrideTag("RenderType", settings.renderType);
			materials[i].newMat.SetInt("_SrcBlend", (int)settings.srcBlend);
			materials[i].newMat.SetInt("_DstBlend", (int)settings.dstBlend); 
            materials[i].newMat.SetInt("_AlphaSrcBlend", (int)settings.srcBlend);
			materials[i].newMat.SetInt("_AlphaDstBlend", (int)settings.dstBlend);
			materials[i].newMat.SetInt("_ZWrite", settings.zWrite ? 1 : 0);
        }

        private void ChangeMaterials()
        {
            
            GameObject newRoot = GameObject.Instantiate(rootObject) as GameObject;
            rootObject.SetActive(false);

            MeshRenderer[] renderer = newRoot.GetComponentsInChildren<MeshRenderer>();

            for(int i = 0; i < renderer.Length; i++)
            {
                Material[] mats = renderer[i].sharedMaterials;

                for(int m = 0; m < mats.Length; m++)
                { 
                    for (int k = 0; k < materials.Count; k++)
                    {
                        if(mats[m] == materials[k].origMat && materials[k].convert)
                        { 
                            mats[m] = materials[k].newMat;
                            renderer[i].sharedMaterials = mats;
                            break;
                        }
                    }
                }
            }
        }


        bool alreadyAdded(Material m)
        {
            for (int i = 0; i < materials.Count; i++)
            {
                if(materials[i].origMat == m)
                    return true;
            }
            return false;
        }
 
        Texture2D CreateMaskTexture(string folderPath, Texture2D metallicTex, Texture2D occlusionTex, Texture2D heightTex, Texture2D smoothnessTex, Vector4 channels)
        {
            if(myMat == null)
               myMat = new Material(Shader.Find("Hidden/EnviroChannelPacker"));

            if(metallicTex != null)
                myMat.SetTexture("_Metallic", metallicTex);

            if(occlusionTex != null)
                myMat.SetTexture("_Occlusion", occlusionTex);

            if(heightTex != null)
                myMat.SetTexture("_Height", heightTex);

            if(smoothnessTex != null)
                myMat.SetTexture("_Smoothness", smoothnessTex);
        
            //myMat.SetVector("_SourceChannel", new Vector4((float)metallicChannel,(float)occlusionChannel,(float)heightChannel,(float)smoothnessChannel));
            myMat.SetVector("_SourceChannel", channels);

            int width = 1024;
            int height = 1024;

            RenderTexture tempRT = RenderTexture.GetTemporary(width, height);
            Graphics.Blit(Texture2D.blackTexture, tempRT, myMat);

            Texture2D output = new Texture2D(tempRT.width, tempRT.height, UnityEngine.TextureFormat.RGBA32, false);
            RenderTexture.active = tempRT;

            output.ReadPixels(new Rect(0, 0, tempRT.width, tempRT.height), 0, 0);
            output.Apply();
            output.filterMode = FilterMode.Bilinear;

            RenderTexture.ReleaseTemporary(tempRT);
            RenderTexture.active = null;

            string path = AssetDatabase.GenerateUniqueAssetPath(folderPath + "mask.png");
           
            if (string.IsNullOrEmpty(path))
                return null;

            byte[] bytes = output.EncodeToPNG(); 
        
            System.IO.File.WriteAllBytes(path, bytes);    
            AssetDatabase.Refresh();
            return (Texture2D)AssetDatabase.LoadAssetAtPath(path, typeof (Texture2D));
        }
}
}

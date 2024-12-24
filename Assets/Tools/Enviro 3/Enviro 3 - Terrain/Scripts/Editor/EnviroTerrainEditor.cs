using System.Collections;
using System.Collections.Generic;
using UnityEngine; 
using UnityEditor;

namespace Enviro
{
    [CustomEditor(typeof(EnviroTerrainManager))]
    public class EnviroTerrainEditor : Editor
    {
        private EnviroTerrainManager myTarget;

        public SerializedObject serializedObj;
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


        private SerializedProperty myTerrain, myMaterial, syncWithEnviro, snowIntensity, rainIntensity, wetnessIntensity, autoUpdateArrays;

        private SerializedProperty blendQuality,heightBlendStrength,mipDistanceBlending,heightBlend,antiTileSampling, tessellation, tessFactor, tessMinDistance, tessMaxDistance, displacementStrength, heightBlending;
        private SerializedProperty snowEffects,snowTiling, snowDisplacement, snowAlbedo, snowNormal, snowMask, snowNormalScale, snowSmoothness, snowMetallic, snowSlope, snowHeightBlending, SSSIntensity, SSSScale, SSSDistortion;
        private SerializedProperty rainEffects, wetnessBoost, rainDropTiling, rainDropSpeed, rainDropIntensity, rainDistanceFade;
       private SerializedProperty rainFlowIntensity, rainFlowDistortionScale, rainFlowDistortionStrength, rainFlowTiling, rainFlowStrength, rainFlowSmoothnessBoost;

       
        private SerializedProperty puddleEffects, puddleWaveNormal, puddleIntensity, puddleColor, puddleCoverage, puddleWaveTiling,puddleWaveIntensity; 
        void OnEnable()
        {
            myTarget = (EnviroTerrainManager)target;
            serializedObj = new SerializedObject(myTarget);
            myTerrain = serializedObj.FindProperty("terrain");
            myMaterial = serializedObj.FindProperty("material");

            autoUpdateArrays= serializedObj.FindProperty("autoUpdateArrays");


            syncWithEnviro = serializedObj.FindProperty("Settings.syncWithEnviro");
            snowIntensity = serializedObj.FindProperty("Settings.snowIntensity");
            rainIntensity = serializedObj.FindProperty("Settings.rainIntensity");
            wetnessIntensity = serializedObj.FindProperty("Settings.wetnessIntensity");

            tessellation = serializedObj.FindProperty("Settings.tessellation");
            antiTileSampling = serializedObj.FindProperty("Settings.antiTileSampling");
            tessFactor = serializedObj.FindProperty("Settings.tessFactor");
            tessMinDistance = serializedObj.FindProperty("Settings.tessMinDistance");
            tessMaxDistance = serializedObj.FindProperty("Settings.tessMaxDistance");
            displacementStrength = serializedObj.FindProperty("Settings.displacementStrength");
            heightBlend = serializedObj.FindProperty("Settings.heightBlend"); 
            heightBlending = serializedObj.FindProperty("Settings.heightBlending"); 
            mipDistanceBlending = serializedObj.FindProperty("Settings.mipDistanceBlending"); 
            heightBlendStrength = serializedObj.FindProperty("Settings.heightBlendStrength"); 
            blendQuality = serializedObj.FindProperty("Settings.blendQuality"); 
 

            snowEffects= serializedObj.FindProperty("Settings.snowEffects");
            snowAlbedo = serializedObj.FindProperty("snowAlbedo");
            snowNormal = serializedObj.FindProperty("snowNormal");
            snowMask = serializedObj.FindProperty("snowMask");  
            snowTiling = serializedObj.FindProperty("Settings.snowTiling");
            snowNormalScale = serializedObj.FindProperty("Settings.snowNormalScale");
            snowSmoothness = serializedObj.FindProperty("Settings.snowSmoothness");
            snowMetallic = serializedObj.FindProperty("Settings.snowMetallic");
            snowSlope = serializedObj.FindProperty("Settings.snowSlope");
            snowHeightBlending = serializedObj.FindProperty("Settings.snowHeightBlending");
            snowDisplacement = serializedObj.FindProperty("Settings.snowDisplacement");
            SSSIntensity = serializedObj.FindProperty("Settings.SSSIntensity");
            SSSScale = serializedObj.FindProperty("Settings.SSSScale");
            SSSDistortion = serializedObj.FindProperty("Settings.SSSDistortion");

            rainEffects = serializedObj.FindProperty("Settings.rainEffects");
            wetnessBoost = serializedObj.FindProperty("Settings.wetnessBoost");
            rainDropTiling = serializedObj.FindProperty("Settings.rainDropTiling");
            rainDropSpeed = serializedObj.FindProperty("Settings.rainDropSpeed");
            rainDropIntensity = serializedObj.FindProperty("Settings.rainDropIntensity");
            rainDistanceFade = serializedObj.FindProperty("Settings.rainDistanceFade");
            rainFlowIntensity  = serializedObj.FindProperty("Settings.rainFlowIntensity");
            rainFlowDistortionScale  = serializedObj.FindProperty("Settings.rainFlowDistortionScale");
            rainFlowDistortionStrength  = serializedObj.FindProperty("Settings.rainFlowDistortionStrength");
            rainFlowTiling  = serializedObj.FindProperty("Settings.rainFlowTiling");
            rainFlowStrength  = serializedObj.FindProperty("Settings.rainFlowStrength");
            rainFlowSmoothnessBoost = serializedObj.FindProperty("Settings.rainFlowSmoothnessBoost");


            puddleEffects = serializedObj.FindProperty("Settings.puddleEffects");
            puddleWaveNormal = serializedObj.FindProperty("puddleWaveNormal");
            puddleIntensity = serializedObj.FindProperty("Settings.puddleIntensity");
            puddleColor = serializedObj.FindProperty("Settings.puddleColor");
            puddleCoverage = serializedObj.FindProperty("Settings.puddleCoverage");
            puddleWaveTiling = serializedObj.FindProperty("Settings.puddleWaveTiling");
            puddleWaveIntensity = serializedObj.FindProperty("Settings.puddleWaveIntensity");
        
        } 

        public override void OnInspectorGUI()
        {
            SetupGUIStyles();
    

            GUILayout.BeginVertical("", boxStyle);
            GUILayout.Label("Enviro - Terrain Manager",headerStyleMid);
            GUILayout.Space(5);
            GUILayout.Label("Version: 1.1.1", headerStyleMid);

            serializedObj.UpdateIfRequiredOrScript ();
            EditorGUI.BeginChangeCheck();
            EditorGUILayout.PropertyField(myTerrain);
            EditorGUILayout.PropertyField(myMaterial);
            
            if (myTarget.material == null && GUILayout.Button("Create Material"))
            {
                string path = EditorUtility.SaveFilePanelInProject("Save your new Material.", "EnviroTerrainMaterial", "mat", "");

                if (string.IsNullOrEmpty(path))
                return;

                myTarget.CreateMaterial(path);
            }

            if(myTarget.material == null)
            {
                if(EditorGUI.EndChangeCheck())
                {
                    serializedObj.ApplyModifiedProperties ();
                }
                GUILayout.EndVertical();
                return;
            }
            EditorGUILayout.PropertyField(autoUpdateArrays);
 
            if (GUILayout.Button("Update Arrays"))
            {
                myTarget.CreateTextureArrays();
            }

            if(myTarget.Settings.tessellation)
               GUILayout.Label("Tessellation enabled. Instanced rendering is not supported with tessellation and will be deactivated!",headerStyle);

            GUILayout.BeginVertical("", boxStyle);
            myTarget.showGeneral = GUILayout.Toggle(myTarget.showGeneral, "General", headerFoldout);
            if(myTarget.showGeneral)
            {
                EditorGUILayout.PropertyField(syncWithEnviro);
                EditorGUILayout.Space(5f);
                EditorGUILayout.PropertyField(snowIntensity);
                EditorGUILayout.PropertyField(rainIntensity);
                EditorGUILayout.PropertyField(wetnessIntensity);
                EditorGUILayout.Space(5f);     
                GUILayout.Label("Blending and Sampling",headerStyle); 
                EditorGUILayout.PropertyField(blendQuality); 
                EditorGUILayout.PropertyField(heightBlend);
                EditorGUILayout.PropertyField(heightBlending);
                EditorGUILayout.PropertyField(heightBlendStrength);
                EditorGUILayout.Space(5f); 
                EditorGUILayout.PropertyField(mipDistanceBlending);
                EditorGUILayout.Space(5f);
                EditorGUILayout.PropertyField(antiTileSampling);
                
            }
            GUILayout.EndVertical();

            
            GUILayout.BeginVertical("", boxStyle);
            myTarget.showLayers = GUILayout.Toggle(myTarget.showLayers, "Layers", headerFoldout);
            if(myTarget.showLayers)
            {
                EditorGUI.BeginChangeCheck();

                for(int i = 0; i < myTarget.layers.Count; i++)
                {
                    GUILayout.BeginVertical("", boxStyle);
                 
                   
                    myTarget.layers[i].show = GUILayout.Toggle(myTarget.layers[i].show, myTarget.layers[i].layer.name, headerFoldout);
                    EditorGUILayout.LabelField("", EditorStyles.boldLabel);
                    Rect lastRect = GUILayoutUtility.GetLastRect();
                    Rect rec = new Rect(lastRect.x, lastRect.y, 100, 30);
                    if(myTarget.layers[i].layer.diffuseTexture != null)
                    EditorGUI.DrawPreviewTexture(rec,myTarget.layers[i].layer.diffuseTexture);
                    EditorGUILayout.Space(10f); 
                              
                    if(myTarget.layers[i].show)
                    {
                    myTarget.layers[i].samplingType = (EnviroTerrainLayer.SamplingType)EditorGUILayout.EnumPopup("Sampling Type", myTarget.layers[i].samplingType);
                    EditorGUILayout.Space(5f); 
                    myTarget.layers[i].tintColor = EditorGUILayout.ColorField("Tint Color", myTarget.layers[i].tintColor);
                    EditorGUILayout.Space(5f); 
                    myTarget.layers[i].normalScale = EditorGUILayout.Slider("Normal Scale",myTarget.layers[i].normalScale, 0f,2f); 
                    EditorGUILayout.Space(5f);         
                    myTarget.layers[i].metallic = EditorGUILayout.Slider("Metallic",myTarget.layers[i].metallic, 0f,1f); 
                    myTarget.layers[i].smoothness = EditorGUILayout.Slider("Smoothness",myTarget.layers[i].smoothness, 0f,1f); 
                    myTarget.layers[i].occlusion = EditorGUILayout.Slider("Occlusion",myTarget.layers[i].occlusion, 0f,1f);
                    EditorGUILayout.Space(5f); 
                    myTarget.layers[i].heightContrast = EditorGUILayout.Slider("Height Contrast",myTarget.layers[i].heightContrast, 0f,10f);
                    myTarget.layers[i].displacementModifier = EditorGUILayout.Slider("Displacement Modifier (Multiplier)",myTarget.layers[i].displacementModifier, 0f,2f);
                    EditorGUILayout.Space(5f);  
                    }
                    GUILayout.EndVertical();
                }

                if(EditorGUI.EndChangeCheck())
                {
                    serializedObj.ApplyModifiedProperties ();
                }            
            }
            GUILayout.EndVertical();

            
            GUILayout.BeginVertical("", boxStyle);
            myTarget.showTess = GUILayout.Toggle(myTarget.showTess, "Tessellation", headerFoldout);
            if(myTarget.showTess)
            {    
            EditorGUILayout.PropertyField(tessellation);
            EditorGUILayout.PropertyField(tessFactor);
            EditorGUILayout.PropertyField(tessMinDistance);
            EditorGUILayout.PropertyField(tessMaxDistance);
            EditorGUILayout.Space(5f);
            EditorGUILayout.PropertyField(displacementStrength);
            
            }
            GUILayout.EndVertical();


            GUILayout.BeginVertical("", boxStyle);
            myTarget.showSnow = GUILayout.Toggle(myTarget.showSnow, "Snow", headerFoldout);
            if(myTarget.showSnow)
            { 
                EditorGUILayout.PropertyField(snowEffects);
                EditorGUILayout.Space(5f);
                EditorGUILayout.PropertyField(snowTiling);
                EditorGUILayout.PropertyField(snowAlbedo);
                EditorGUILayout.PropertyField(snowNormal);
                EditorGUILayout.PropertyField(snowMask);
                EditorGUILayout.Space(5f);
                EditorGUILayout.PropertyField(snowNormalScale);
                EditorGUILayout.PropertyField(snowSmoothness);
                EditorGUILayout.PropertyField(snowMetallic);
                EditorGUILayout.PropertyField(snowDisplacement);  
                EditorGUILayout.Space(5f);           
                EditorGUILayout.PropertyField(snowSlope);
                EditorGUILayout.PropertyField(snowHeightBlending);
                EditorGUILayout.Space(5f);  
                EditorGUILayout.PropertyField(SSSIntensity);
                EditorGUILayout.PropertyField(SSSScale);
                EditorGUILayout.PropertyField(SSSDistortion);
            }
            GUILayout.EndVertical();

            GUILayout.BeginVertical("", boxStyle);
            myTarget.showRain = GUILayout.Toggle(myTarget.showRain, "Rain", headerFoldout);
            if(myTarget.showRain)
            {
                EditorGUILayout.PropertyField(wetnessBoost);
                EditorGUILayout.PropertyField(rainDistanceFade);
                EditorGUILayout.Space(5f);
                EditorGUILayout.PropertyField(rainEffects);
                EditorGUILayout.Space(5f);
                EditorGUILayout.PropertyField(rainDropTiling);
                EditorGUILayout.PropertyField(rainDropIntensity);
                EditorGUILayout.PropertyField(rainDropSpeed);
                EditorGUILayout.Space(10f);
                EditorGUILayout.PropertyField(rainFlowTiling);
                EditorGUILayout.PropertyField(rainFlowIntensity);
                EditorGUILayout.PropertyField(rainFlowStrength);
                EditorGUILayout.PropertyField(rainFlowDistortionScale);
                EditorGUILayout.PropertyField(rainFlowDistortionStrength);
                EditorGUILayout.PropertyField(rainFlowSmoothnessBoost);
            }
            GUILayout.EndVertical();

            GUILayout.BeginVertical("", boxStyle);
            myTarget.showPuddles = GUILayout.Toggle(myTarget.showPuddles, "Puddles", headerFoldout);
            if(myTarget.showPuddles)
            {
                EditorGUILayout.PropertyField(puddleEffects);
                EditorGUILayout.Space(5f);
                EditorGUILayout.PropertyField(puddleCoverage);
                EditorGUILayout.PropertyField(puddleIntensity);
                EditorGUILayout.PropertyField(puddleColor);
                EditorGUILayout.Space(5f);
                EditorGUILayout.PropertyField(puddleWaveNormal);
                EditorGUILayout.PropertyField(puddleWaveTiling);
                EditorGUILayout.PropertyField(puddleWaveIntensity);
            }
            GUILayout.EndVertical();


            if(EditorGUI.EndChangeCheck())
            {
                serializedObj.ApplyModifiedProperties ();
            }

            GUILayout.EndVertical();
        }

    }
}

using System.Collections;
using System.Collections.Generic;
using System;
using UnityEngine;

namespace Enviro
{
[Serializable]
public class EnviroTerrainSettings 
{  

    public enum BlendQuality
    {
        Fast,
        Balanced,
        Quality
    }
    //General
    public bool syncWithEnviro = true;
    [Range(0f,1f)]
    public float snowIntensity = 0f;
    [Range(0f,1f)]
    public float rainIntensity = 0f;
    [Range(0f,1f)]  
    public float wetnessIntensity = 0f;
    public bool antiTileSampling = false;
    public BlendQuality blendQuality = BlendQuality.Balanced;

    //Tesselation
    public bool tessellation = false;
    [Range(1f,32f)]
    public float tessFactor = 10f;
    public float tessMinDistance = 10f;
    public float tessMaxDistance = 30f;
     [Range(0f,1f)]
    public float displacementStrength = 0.5f;
    public bool heightBlend = false;
    [Range(0.01f,0.2f)]
    public float heightBlendStrength = 0.15f;
    
    [Range(0.01f,1f)]
    public float heightBlending = 0.25f;

    [Range(0.0f,100f)]
    public float mipDistanceBlending = 30f;


    //Snow 
    public bool snowEffects = true;

    public float snowTiling = 100f;
    [Range(0f,2f)]    
    public float snowNormalScale = 1f;
    [Range(0f,1f)]    
    public float snowDisplacement = 0.25f;
    
    [Range(0f,1f)]    
    public float snowSmoothness = 1f;
    [Range(0f,1f)]    
    public float snowMetallic = 0f;
    public float snowSlope = 20f;
    public float snowHeightBlending = 4f;
    
    [Range(0f,5f)]    
    public float SSSIntensity = 3f;
    [Range(0f,1f)]    
    public float SSSScale = 0.5f;
    [Range(0f,1f)]    
    public float SSSDistortion = 0.9f;
    
    
    //Rain 
    [Range(0f,1f)]
    public float wetnessBoost = 0.3f;
    public bool rainEffects = true;
    public float rainDropTiling = 0.5f;
    [Range(0f,2f)] 
    public float rainDropSpeed = 1f;
    [Range(0f,10f)]
    public float rainDropIntensity = 5f;
    [Range(0f,20f)]
    public float rainDistanceFade = 10f;

    [Range(0f,5f)]
    public float rainFlowIntensity = 2f;
    public float rainFlowDistortionScale = 1000f;
    
    [Range(0f,0.25f)]
    public float rainFlowDistortionStrength = 0.15f;
    public float rainFlowTiling = 0.5f;
    [Range(0f,1f)]
    public float rainFlowStrength = 1f;
    
    [Range(0f,5f)]
    public float rainFlowSmoothnessBoost = 2f;


    //Puddles
    public bool puddleEffects = true;

    [Range(0f,5f)]    
    public float puddleIntensity = 2f;
    public Color puddleColor = Color.white;
    public float puddleCoverage = 0.25f;
    public float puddleWaveTiling = 0.1f;
    [Range(0f,2f)]    
    public float puddleWaveIntensity = 1f;
}

[Serializable]
public class EnviroTerrainLayer 
{ 
    public enum SamplingType
    {
        Planar,
        Stochastic
    }
    public bool show = false;
    public TerrainLayer layer;
    public SamplingType samplingType;
    public Color tintColor = Color.white; 
    public float occlusion = 0f;
    public float normalScale = 1f;
    public float metallic = 0.0f;
    public float smoothness = 0.5f;
    public float heightContrast = 0f;
    public float displacementModifier = 1.0f;
}
 

[ExecuteInEditMode]
public class EnviroTerrainManager : MonoBehaviour
{ 
    public Terrain terrain;
    public Material material;
 
    public EnviroTerrainSettings Settings;

    public bool showGeneral, showLayers, showTess, showSnow, showRain, showWetnes, showPuddles;

    public List <EnviroTerrainLayer> layers = new List <EnviroTerrainLayer>();
    public List <Texture2D> albedoTextures = new List<Texture2D>();
    public List <Texture2D> normalTextures = new List<Texture2D>(); 
    public List <Texture2D> maskTextures = new List<Texture2D>();
    
    public Texture2D snowAlbedo; 
    public Texture2D snowNormal;
    public Texture2D snowMask;

    public Texture2D puddleWaveNormal;

    public Texture2DArray albedoArray;
    public Texture2DArray normalArray;
    public Texture2DArray maskArray;
    public bool autoUpdateArrays = true;

    //Cache
    private int terrainLayers;
    private TerrainLayer[] terrainLayer;
    private Shader normalShader;
    private Shader tessellationShader;


    void OnEnable()
    {
        if(terrain == null)
           terrain = GetComponent<Terrain>();

        //Cache
        if(normalShader == null)
           normalShader = Shader.Find("Enviro3/EnviroTerrain");

        if(tessellationShader == null)
           tessellationShader = Shader.Find("Enviro3/EnviroTerrainTessellation");

        UpdateCache();
    }

    void OnDisable()
    {

    }


    void Update()
    {
        if(terrain != null)
        {
            if(!Application.isPlaying)
            {
                UpdateCache();
            }

            terrainLayers = terrainLayer.Length + 1;

            UpdateLayers();

            if(autoUpdateArrays)
            {           
                bool update = false;      
                
                for(int i = 0; i < terrainLayer.Length; i++)
                {   
                    if (terrainLayer[i] == null)
                        break;

                    if(terrainLayer[i].diffuseTexture != null)
                    {
                        if(albedoTextures.Count > i)
                        {
                            if(terrainLayer[i].diffuseTexture != albedoTextures[i])
                            {
                                update = true;
                            }
                        }
                    }

                    if(terrainLayer[i].normalMapTexture != null)
                    {
                        if(normalTextures.Count > i)
                        {
                            if(terrainLayer[i].normalMapTexture != normalTextures[i])
                            {
                                update = true;
                            }
                        }
                    }

                    if(terrainLayer[i].maskMapTexture != null)
                    {
                        if(maskTextures.Count > i)
                        {
                            if(terrainLayer[i].maskMapTexture != maskTextures[i])
                            {
                                update = true;
                            }
                        }
                    }
                }   

                if(terrainLayer.Length != albedoTextures.Count)
                {
                    update = true;
                }
                    
                if(update)
                   CreateTextureArrays();
 
            }
        }

        if(Settings.syncWithEnviro)
           SyncWithEnviro();

        UpdateShader();
    }

    void CleanUp()
    {
        if(albedoArray != null)
            DestroyImmediate(albedoArray);

        if(normalArray != null)
            DestroyImmediate(normalArray);

        if(maskArray != null)
            DestroyImmediate(maskArray);
    }

    public void SetShaderLayerCount()
    {
        if(terrainLayer.Length <= 4)
        {
            material.DisableKeyword("_SPLATCOUNT__12");
            material.DisableKeyword("_SPLATCOUNT__8");
            material.EnableKeyword("_SPLATCOUNT__4");
        }
        else if (terrainLayer.Length >= 5 && terrainLayer.Length <= 8)
        {
            material.DisableKeyword("_SPLATCOUNT__4");
            material.DisableKeyword("_SPLATCOUNT__12");
            material.EnableKeyword("_SPLATCOUNT__8");
        }
        else if (terrainLayer.Length > 8)
        {
            material.DisableKeyword("_SPLATCOUNT__4");
            material.DisableKeyword("_SPLATCOUNT__8");
            material.EnableKeyword("_SPLATCOUNT__12");
        }
    }

    public void SetBlendQuality()
    {
        if(Settings.blendQuality == EnviroTerrainSettings.BlendQuality.Fast)
        {
            material.DisableKeyword("_QUALITY_BALANCE");
            material.DisableKeyword("_QUALITY_QUALITY");
            material.EnableKeyword("_QUALITY_FAST");
        }
        else if (Settings.blendQuality == EnviroTerrainSettings.BlendQuality.Balanced)
        {
            material.DisableKeyword("_QUALITY_FAST");
            material.DisableKeyword("_QUALITY_QUALITY");
            material.EnableKeyword("_QUALITY_BALANCE");
        }
        else
        {
            material.DisableKeyword("_QUALITY_BALANCE");
            material.DisableKeyword("_QUALITY_FAST");
            material.EnableKeyword("_QUALITY_QUALITY");
        }
    }

    private void UpdateLayers()
    {
        //Layer Removed
        if(layers.Count > terrainLayer.Length) 
        {        
            for(int l = 0; l < layers.Count; l++)
            {
                bool layerExist = false;

                for(int t = 0; t < terrainLayer.Length; t++)
                {
                    if(layers[l].layer == terrainLayer[t])
                    {
                        layerExist = true;
                    }
                }    

                if(!layerExist)
                {
                    layers.RemoveAt(l);  
                }
        
            }    
        }

        for(int i = 0; i < terrainLayer.Length; i++)
        { 
            //New Layer
            if(layers.Count < i + 1) 
            {
                EnviroTerrainLayer newLayer = new EnviroTerrainLayer(); 
                newLayer.layer = terrainLayer[i];
                newLayer.normalScale = terrainLayer[i].normalScale;
                newLayer.smoothness = terrainLayer[i].smoothness;
                newLayer.metallic = terrainLayer[i].metallic;
                layers.Add(newLayer);
            }

            if(layers[i].layer != terrainLayer[i])
            {
                bool changed = false;
                //We have a change here!
                for(int l = 0; l < layers.Count; l++)
                {
                    if(layers[l].layer == terrainLayer[i] && !changed)
                    {
                        //Layer was reorderd
                        layers[i] = layers[l];
                        changed = true;
                    }
                }
                //Layer was replaced.
                if(!changed)
                {
                    EnviroTerrainLayer newLayer = new EnviroTerrainLayer(); 
                    newLayer.layer = terrainLayer[i];
                    layers[i] = newLayer;
                }
            }   
        }
    }


    public void UpdateCache()
    {
        if(terrain != null)
        {
           terrainLayer = terrain.terrainData.terrainLayers;
        }
    }

    public void CreateTextureArrays()
    {
        if(terrain == null)
        {
            Debug.Log("Please assign a Terrain!");
            return;
        }

        UpdateCache();       
        CleanUp();

        albedoTextures = new List<Texture2D>();
        normalTextures = new List<Texture2D>();
        maskTextures   = new List<Texture2D>();

        for(int i = 0; i < terrainLayer.Length; i++)
        {
            if (terrainLayer[i].diffuseTexture != null)
            {
                albedoTextures.Add(terrainLayer[i].diffuseTexture);
            }
            
            if (terrainLayer[i].normalMapTexture != null)
            {
                normalTextures.Add(terrainLayer[i].normalMapTexture);
            }
            else
            {
                normalTextures.Add(Texture2D.normalTexture);
            }
            
            if (terrainLayer[i].maskMapTexture != null) 
            {
                 maskTextures.Add(terrainLayer[i].maskMapTexture);
            }
            else
            {
                maskTextures.Add(Texture2D.blackTexture);
            }
        }
       
        if(albedoTextures.Count > 0)
            albedoArray = CreateArray(albedoTextures,TextureFormat.DXT5,true);

        if(normalTextures.Count > 0)
            normalArray = CreateArray(normalTextures,TextureFormat.DXT5,true);

        if(maskTextures.Count > 0)
            maskArray = CreateArray(maskTextures,TextureFormat.DXT5,true);
    }
  
    public void CreateMaterial(string path)
    {
        if(material == null)
        { 

            if(normalShader == null)
            normalShader = Shader.Find("Enviro3/EnviroTerrain");

            if(tessellationShader == null)
            tessellationShader = Shader.Find("Enviro3/EnviroTerrainTessellation");

            if(Settings.tessellation)
               material = new Material(tessellationShader);
            else
               material = new Material(normalShader);
 
            #if UNITY_EDITOR 
            UnityEditor.AssetDatabase.CreateAsset(material, path);
            UnityEditor.AssetDatabase.SaveAssets();
            #endif
        }
    }

    private Texture2DArray CreateArray(List <Texture2D> textures, TextureFormat format, bool linear)
    {

        Texture2DArray texture2DArray = new Texture2DArray(textures[0].width,textures[0].height, textures.Count, format, true, linear);
        texture2DArray.filterMode = FilterMode.Bilinear;
        texture2DArray.wrapMode = TextureWrapMode.Repeat;

        
        RenderTexture cache = RenderTexture.active;
		RenderTexture rt = new RenderTexture( textures[0].width, textures[0].height, 0, RenderTextureFormat.ARGBFloat, RenderTextureReadWrite.Default );
		rt.Create();

        for (int i = 0; i < textures.Count; i++)
        {
            RenderTexture.active = rt;
            Graphics.Blit( textures[i], rt);
            int mips = 0;

            Texture2D t2d = new Texture2D(rt.width, rt.height, TextureFormat.RGBAFloat, mips, true);
            t2d.ReadPixels( new Rect( 0, 0,rt.width, rt.height ), 0, 0, true); 
 
            RenderTexture.active = null;
//#if UNITY_EDITOR 
            //UnityEditor.EditorUtility.CompressTexture(t2d, format, 1 );
            t2d.Compress(true);
//#endif 
            t2d.Apply( false );

            int maxSize = Mathf.Max( rt.width, rt.height );
            int numLevels = 1 + (int)Mathf.Floor( Mathf.Log( maxSize, 2 ) );
            
            for( int mip = 0; mip < numLevels; mip++ )
            {
                CopyToArray( ref t2d, ref texture2DArray, i, mip, true );
            }
    }
    
        texture2DArray.Apply(false);
        
        rt.Release();
        RenderTexture.active = cache;
  

        return texture2DArray;
    }


    private void CopyToArray( ref Texture2D from, ref Texture2DArray to, int arrayIndex, int mipLevel, bool compressed = true )
    {
        if(compressed)
        {
            Graphics.CopyTexture(from, 0, mipLevel, to, arrayIndex, mipLevel);
        }
        else
        {
            to.SetPixels(from.GetPixels(), arrayIndex, mipLevel);
            to.Apply();
        }
    }

    private void SyncWithEnviro()
    { 
    #if ENVIRO_3
        if( EnviroManager.instance != null && EnviroManager.instance.Environment != null)
        {
            Settings.snowIntensity = EnviroManager.instance.Environment.Settings.snow;
            Settings.wetnessIntensity = EnviroManager.instance.Environment.Settings.wetness;
        }

        if( EnviroManager.instance != null && EnviroManager.instance.Effects != null)
        {
            for (int i = 0; i < EnviroManager.instance.Effects.Settings.effectTypes.Count; i++)
            {
                if(EnviroManager.instance.Effects.Settings.effectTypes[i].name.Contains("Rain"))
                   Settings.rainIntensity = EnviroManager.instance.Effects.Settings.effectTypes[i].emissionRate;
            }
        }

    #endif
    }
    private void UpdateWeatherStateSettings(Material myMaterial) 
    {
        myMaterial.SetFloat("_EnviroSnow", Settings.snowIntensity);
        myMaterial.SetFloat("_EnviroRainIntensity", Settings.rainIntensity);
        myMaterial.SetFloat("_EnviroWetness", Settings.wetnessIntensity);
    }

    private void UpdateSnowSettings(Material myMaterial)
    {
        myMaterial.SetTexture("_SnowAlbedo", snowAlbedo);
        myMaterial.SetTexture("_SnowNormal", snowNormal);
        myMaterial.SetTexture("_SnowMask", snowMask);
        myMaterial.SetFloat("_SnowTiling", Settings.snowTiling);
        myMaterial.SetFloat("_SnowDisplacement", Settings.snowDisplacement);
        myMaterial.SetFloat("_SnowMetallic", Settings.snowMetallic);
        myMaterial.SetFloat("_SnowSmoothness", Settings.snowSmoothness);
        myMaterial.SetFloat("_SnowNormalScale", Settings.snowNormalScale);
        myMaterial.SetFloat("_SnowHeightBlending", Settings.snowHeightBlending);   
        myMaterial.SetFloat("_SnowSlopePower", Settings.snowSlope);

        myMaterial.SetFloat("_SSSIntensity", Settings.SSSIntensity);
        myMaterial.SetFloat("_SSSDistortion", Settings.SSSDistortion);
        myMaterial.SetFloat("_SSSScale", Settings.SSSScale);
    }

    private void UpdateRainSettings(Material myMaterial)
    {
        myMaterial.SetFloat("_WetnessBoost", Settings.wetnessBoost);
        myMaterial.SetFloat("_RainDropTiling", Settings.rainDropTiling);
        myMaterial.SetFloat("_RainDropSpeed", Settings.rainDropSpeed);
        myMaterial.SetFloat("_RainDropIntensity", Settings.rainDropIntensity);
        myMaterial.SetFloat("_RainDistanceFade", Settings.rainDistanceFade);

        myMaterial.SetFloat("_RainFlowIntensity", Settings.rainFlowIntensity);
        myMaterial.SetFloat("_RainFlowDistortionScale", Settings.rainFlowDistortionScale);
        myMaterial.SetFloat("_RainFlowTiling", Settings.rainFlowTiling);
        myMaterial.SetFloat("_RainFlowStrength", Settings.rainFlowStrength);
        myMaterial.SetFloat("_RainFlowSmoothnessBoost", Settings.rainFlowSmoothnessBoost);
        myMaterial.SetFloat("_RainFlowDistortionStrenght", Settings.rainFlowDistortionStrength);
    }


    private void UpdatePuddleSettings(Material myMaterial)
    {
        myMaterial.SetFloat("_PuddleIntensity", Settings.puddleIntensity);
        myMaterial.SetColor("_PuddleColor", Settings.puddleColor);
        myMaterial.SetFloat("_PuddleCoverageNoise", Settings.puddleCoverage);
        myMaterial.SetFloat("_PuddleWaveTiling", Settings.puddleWaveTiling);
        myMaterial.SetFloat("_PuddleWaveIntensity", Settings.puddleWaveIntensity);
        myMaterial.SetTexture("_WaveNormal", puddleWaveNormal);
    }

    private void UpdateTessellationSettings(Material myMaterial)
    {
        myMaterial.SetFloat("_TessellationFactor", Settings.tessFactor);
        myMaterial.SetFloat("_TessellationMinDistance", Settings.tessMinDistance);
        myMaterial.SetFloat("_TessellationMaxDistance", Settings.tessMaxDistance);
        myMaterial.SetFloat("_DisplacementStrength", Settings.displacementStrength);
    }

    private void UpdateShader()
    {

        if(material == null)
           return;

        if(terrain == null)
           return;

        if(terrain.materialTemplate != material)
           terrain.materialTemplate = material;

        if(Settings.tessellation)
            terrain.drawInstanced = false;
        else
            terrain.drawInstanced = true;

        if(material.shader == normalShader && Settings.tessellation)
        { 
            material.shader = tessellationShader;
        }
        else if(material.shader == tessellationShader && !Settings.tessellation)
        {
            material.shader = normalShader;
        } 

        SetShaderLayerCount();
        SetBlendQuality();
        UpdateWeatherStateSettings(material);
        UpdateSnowSettings(material);    
        UpdateRainSettings(material);  
        UpdatePuddleSettings(material);
        UpdateTessellationSettings(material);

        if(albedoArray != null)
            material.SetTexture("_AlbedoArray", albedoArray);
 
        if(normalArray != null)
            material.SetTexture("_NormalArray", normalArray);

        if(maskArray != null)
            material.SetTexture("_MaskArray", maskArray);  

        material.SetFloat("_HeightBlending", Settings.heightBlending);
        material.SetFloat("_MipDistanceBlending", Settings.mipDistanceBlending);
        material.SetFloat("_HeightBlendStrength", Settings.heightBlendStrength);


        if(Settings.rainEffects)
            material.EnableKeyword("_RAIN_ON");
        else
            material.DisableKeyword("_RAIN_ON");

        if(Settings.puddleEffects)
            material.EnableKeyword("_PUDDLES_ON");
        else
            material.DisableKeyword("_PUDDLES_ON");

        
        if(Settings.snowEffects)
            material.EnableKeyword("_SNOW_ON");
        else
            material.DisableKeyword("_SNOW_ON");


        if(Settings.antiTileSampling)
            material.EnableKeyword("_STOCHASTIC_ON");
        else
            material.DisableKeyword("_STOCHASTIC_ON");
 

        if(Settings.heightBlend)
            material.EnableKeyword("_HEIGHTBLEND_ON");
        else
            material.DisableKeyword("_HEIGHTBLEND_ON");
   
        material.EnableKeyword("_TERRAIN_INSTANCED_PERPIXEL_NORMAL");

        Vector4 smoothness0 = Vector4.zero;
        Vector4 smoothness1 = Vector4.zero;
        Vector4 smoothness2 = Vector4.zero;
        Vector4 metallic0 = Vector4.zero;
        Vector4 metallic1 = Vector4.zero;
        Vector4 metallic2 = Vector4.zero;
        Vector4 normal0 = Vector4.zero;
        Vector4 normal1 = Vector4.zero;
        Vector4 normal2 = Vector4.zero;
        Vector4 occlusion0 = Vector4.zero;
        Vector4 occlusion1 = Vector4.zero;
        Vector4 occlusion2 = Vector4.zero;
        Vector4 heightContrast0 = Vector4.zero;
        Vector4 heightContrast1 = Vector4.zero;
        Vector4 heightContrast2 = Vector4.zero; 
        Vector4 sampling0 = Vector4.zero;
        Vector4 sampling1 = Vector4.zero;
        Vector4 sampling2 = Vector4.zero; 
        Vector4 displacement0 = Vector4.zero;
        Vector4 displacement1 = Vector4.zero;
        Vector4 displacement2 = Vector4.zero;



        if(terrainLayer.Length > 0 && terrainLayer[0] != null)
        {
            material.SetVector("_LayerScaleOffset0", new Vector4(1/terrainLayer[0].tileSize.x,1/terrainLayer[0].tileSize.y,terrainLayer[0].tileOffset.x,terrainLayer[0].tileOffset.y));
   
            if(layers.Count > 0 && layers[0] != null)
            {
               sampling0.x = (int)layers[0].samplingType;
               smoothness0.x = layers[0].smoothness;
               metallic0.x = layers[0].metallic;
               normal0.x = layers[0].normalScale;
               heightContrast0.x = layers[0].heightContrast;
               occlusion0.x = 1f-layers[0].occlusion;
               displacement0.x = layers[0].displacementModifier;
               material.SetColor("_ColorTint0", layers[0].tintColor);
            }
        
        } 
        if(terrainLayer.Length > 1 && terrainLayer[1] != null)
        {
            material.SetVector("_LayerScaleOffset1", new Vector4(1/terrainLayer[1].tileSize.x ,1/terrainLayer[1].tileSize.y,terrainLayer[1].tileOffset.x,terrainLayer[1].tileOffset.y));
            material.SetFloat("_NormalScale1", terrainLayer[1].normalScale);

            if(layers.Count > 1 && layers[1] != null)
            {
               sampling0.y = (int)layers[1].samplingType;
               smoothness0.y = layers[1].smoothness;
               heightContrast0.y = layers[1].heightContrast;
               metallic0.y = layers[1].metallic;
                normal0.y = layers[1].normalScale;
               occlusion0.y = 1f-layers[1].occlusion;
               displacement0.y = layers[1].displacementModifier;
               material.SetColor("_ColorTint1", layers[1].tintColor);
            }
        }
        if(terrainLayer.Length > 2 && terrainLayer[2] != null)
        {
            material.SetVector("_LayerScaleOffset2", new Vector4(1/terrainLayer[2].tileSize.x,1/terrainLayer[2].tileSize.y,terrainLayer[2].tileOffset.x,terrainLayer[2].tileOffset.y));
            material.SetFloat("_NormalScale2", terrainLayer[2].normalScale);
 
            if(layers.Count > 2 && layers[2] != null)
            {
               sampling0.z = (int)layers[2].samplingType;
               smoothness0.z = layers[2].smoothness;
               heightContrast0.z = layers[2].heightContrast;
               metallic0.z = layers[2].metallic;
                normal0.z = layers[2].normalScale;
               occlusion0.z = 1f-layers[2].occlusion;
               displacement0.z = layers[2].displacementModifier;
               material.SetColor("_ColorTint2", layers[2].tintColor);
            }
        }
        if(terrainLayer.Length > 3 && terrainLayer[3] != null)
        { 
            material.SetVector("_LayerScaleOffset3", new Vector4(1/terrainLayer[3].tileSize.x,1/terrainLayer[3].tileSize.y,terrainLayer[3].tileOffset.x,terrainLayer[3].tileOffset.y));
            material.SetFloat("_NormalScale3", terrainLayer[3].normalScale);

            if(layers.Count > 3 && layers[3] != null)
            {
               sampling0.w = (int)layers[3].samplingType;
               occlusion0.w = 1f-layers[3].occlusion;
               heightContrast0.w = layers[3].heightContrast;
               metallic0.w = layers[3].metallic;
                normal0.w = layers[3].normalScale;
               smoothness0.w = layers[3].smoothness;
               displacement0.w = layers[3].displacementModifier;
               material.SetColor("_ColorTint3", layers[3].tintColor);
            }
        }
        if(terrainLayer.Length > 4 && terrainLayer[4] != null)
        { 
            material.SetVector("_LayerScaleOffset4", new Vector4(1/terrainLayer[4].tileSize.x,1/terrainLayer[4].tileSize.y,terrainLayer[4].tileOffset.x,terrainLayer[4].tileOffset.y));
            material.SetFloat("_NormalScale4", terrainLayer[4].normalScale);
            
            if(layers.Count > 4 && layers[4] != null)
            {
               sampling1.x = (int)layers[4].samplingType;
               smoothness1.x = layers[4].smoothness;
               heightContrast1.x = layers[4].heightContrast;
               metallic1.x = layers[4].metallic;
                normal1.x = layers[4].normalScale;
               occlusion1.x = 1f-layers[4].occlusion;
               displacement1.x = layers[4].displacementModifier;
               material.SetColor("_ColorTint4", layers[4].tintColor);
            }
        }
        if(terrainLayer.Length > 5 && terrainLayer[5] != null)
        { 
            material.SetVector("_LayerScaleOffset5", new Vector4(1/terrainLayer[5].tileSize.x,1/terrainLayer[5].tileSize.y,terrainLayer[5].tileOffset.x,terrainLayer[5].tileOffset.y));
            material.SetFloat("_NormalScale5", terrainLayer[5].normalScale);

            if(layers.Count > 5 && layers[5] != null)
            { 
               sampling1.y = (int)layers[5].samplingType;
               smoothness1.y = layers[5].smoothness;
               heightContrast1.y = layers[5].heightContrast;
               metallic1.y = layers[5].metallic;
                normal1.y = layers[5].normalScale;
               occlusion1.y = 1f-layers[5].occlusion;
                displacement1.y = layers[5].displacementModifier;
               material.SetColor("_ColorTint5", layers[5].tintColor);
            }
            
        }
        if(terrainLayer.Length > 6 && terrainLayer[6] != null)
        { 
            material.SetVector("_LayerScaleOffset6", new Vector4(1/terrainLayer[6].tileSize.x,1/terrainLayer[6].tileSize.y,terrainLayer[6].tileOffset.x,terrainLayer[6].tileOffset.y));
            material.SetFloat("_NormalScale6", terrainLayer[6].normalScale);

            if(layers.Count > 6 && layers[6] != null)
            {
               sampling1.z = (int)layers[6].samplingType;
               smoothness1.z = layers[6].smoothness;
               heightContrast1.z = layers[6].heightContrast;
               metallic1.z = layers[6].metallic;
               normal1.z = layers[6].normalScale;
               occlusion1.z = 1f-layers[6].occlusion;
                displacement1.z = layers[6].displacementModifier;
               material.SetColor("_ColorTint6", layers[6].tintColor);
            }
        }
        if(terrainLayer.Length > 7 && terrainLayer[7] != null)
        { 
            material.SetVector("_LayerScaleOffset7", new Vector4(1/terrainLayer[7].tileSize.x,1/terrainLayer[7].tileSize.y,terrainLayer[7].tileOffset.x,terrainLayer[7].tileOffset.y));
            material.SetFloat("_NormalScale7", terrainLayer[7].normalScale);

            if(layers.Count > 7 && layers[7] != null)
            {
               sampling1.w = (int)layers[7].samplingType;
               smoothness1.w = layers[7].smoothness;
               heightContrast1.w = layers[7].heightContrast;
               metallic1.w = layers[7].metallic;
               normal1.w = layers[7].normalScale;
               occlusion1.w = 1f-layers[7].occlusion;
               displacement1.w = layers[7].displacementModifier;
               material.SetColor("_ColorTint7", layers[7].tintColor);
            }
        }   
        if(terrainLayer.Length > 8 && terrainLayer[8] != null)
        { 
            material.SetVector("_LayerScaleOffset8", new Vector4(1/terrainLayer[8].tileSize.x,1/terrainLayer[8].tileSize.y,terrainLayer[8].tileOffset.x,terrainLayer[8].tileOffset.y));
            material.SetFloat("_NormalScale8", terrainLayer[8].normalScale);
  
            if(layers.Count > 8 && layers[8] != null)
            {
               sampling2.x = (int)layers[8].samplingType;
               smoothness2.x = layers[8].smoothness;
               metallic2.x = layers[8].metallic;
               normal2.x = layers[8].normalScale;
               occlusion2.x = 1f-layers[8].occlusion;
               displacement2.x = layers[8].displacementModifier;
               material.SetColor("_ColorTint8", layers[8].tintColor);
            }
        }        
        if(terrainLayer.Length > 9 && terrainLayer[9] != null)
        { 
            material.SetVector("_LayerScaleOffset9", new Vector4(1/terrainLayer[9].tileSize.x,1/terrainLayer[9].tileSize.y,terrainLayer[9].tileOffset.x,terrainLayer[9].tileOffset.y));
            material.SetFloat("_NormalScale9", terrainLayer[9].normalScale);

            if(layers.Count > 9 && layers[9] != null)
            {
               sampling2.y = (int)layers[9].samplingType;
               smoothness2.y = layers[9].smoothness;
               metallic2.y = layers[9].metallic;
                 normal2.y = layers[9].normalScale;
               occlusion2.y = 1f-layers[9].occlusion;
                 displacement2.y = layers[9].displacementModifier;
               material.SetColor("_ColorTint9", layers[9].tintColor);
            }
        }
        if(terrainLayer.Length > 10 && terrainLayer[10] != null)
        { 
            material.SetVector("_LayerScaleOffset10", new Vector4(1/terrainLayer[10].tileSize.x,1/terrainLayer[10].tileSize.y,terrainLayer[10].tileOffset.x,terrainLayer[10].tileOffset.y));
            material.SetFloat("_NormalScale10", terrainLayer[10].normalScale);

            if(layers.Count > 10 && layers[10] != null)
            {
               sampling2.z = (int)layers[10].samplingType;
               smoothness2.z = layers[10].smoothness;
               metallic2.z = layers[10].metallic;
                 normal2.z = layers[10].normalScale;
               occlusion2.z = 1f-layers[10].occlusion;
                 displacement2.z = layers[10].displacementModifier;
               material.SetColor("_ColorTint10", layers[10].tintColor);
            }
        }
        if(terrainLayer.Length > 11 && terrainLayer[11] != null)
        { 
            material.SetVector("_LayerScaleOffset11", new Vector4(1/terrainLayer[11].tileSize.x,1/terrainLayer[11].tileSize.y,terrainLayer[11].tileOffset.x,terrainLayer[11].tileOffset.y));
            material.SetFloat("_NormalScale11", terrainLayer[11].normalScale);

            if(layers.Count > 11 && layers[11] != null)
            {
               sampling2.w = (int)layers[11].samplingType;
               smoothness2.w = layers[11].smoothness;
               metallic2.w = layers[11].metallic;
               normal2.w = layers[11].normalScale;
               occlusion2.w = 1f-layers[11].occlusion;
               displacement2.w = layers[11].displacementModifier;
               material.SetColor("_ColorTint11", layers[11].tintColor);
            }
        }
        material.SetVector("_SamplingType0", sampling0);
        material.SetVector("_SamplingType1", sampling1);
        material.SetVector("_SamplingType2", sampling2);

        material.SetVector("_Smoothness00", smoothness0);
        material.SetVector("_Smoothness01", smoothness1);
        material.SetVector("_Smoothness02", smoothness2);
   
        material.SetVector("_Metallic00", metallic0);
        material.SetVector("_Metallic01", metallic1);
        material.SetVector("_Metallic02", metallic2);

        material.SetVector("_NormalScale00", normal0);
        material.SetVector("_NormalScale01", normal1);
        material.SetVector("_NormalScale02", normal2);

        material.SetVector("_Occlusion0", occlusion0);
        material.SetVector("_Occlusion1", occlusion1);
        material.SetVector("_Occlusion2", occlusion2);

        material.SetVector("_HeightContrast0", heightContrast0);
        material.SetVector("_HeightContrast1", heightContrast1);
        material.SetVector("_HeightContrast2", heightContrast2);

        material.SetVector("_DisplacementMod0", displacement0);
        material.SetVector("_DisplacementMod1", displacement1);
        material.SetVector("_DisplacementMod2", displacement2);
    }
}
}

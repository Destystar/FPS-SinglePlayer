using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using UnityEngine.Rendering;

namespace Enviro
{
    [ExecuteInEditMode] 
    public class EnviroShaderManager : MonoBehaviour
    {
        private static EnviroShaderManager _instance; 
        public static EnviroShaderManager instance
        { 
            get
            {
                if (_instance == null)
                    _instance = GameObject.FindObjectOfType<EnviroShaderManager>();

                return _instance;
            }
        }

        public bool updateFromEnviro = true;
        [Range(0f,1f)]
        public float rain;   
        [Range(0f,1f)]
        public float wetness;
        [Range(0f,1f)]
        public float snow;

  
        void OnEnable()
        {

        }

        private void UpdateShaders()
        {
            Shader.SetGlobalFloat("_EnviroRainIntensity", rain);
            Shader.SetGlobalFloat("_EnviroWetness", wetness);
            Shader.SetGlobalFloat("_EnviroSnow", snow);
        }

        private void GetRainIntensity()
        {
            if( EnviroManager.instance != null && EnviroManager.instance.Effects != null)
            {
                for (int i = 0; i < EnviroManager.instance.Effects.Settings.effectTypes.Count; i++)
                {
                    if(EnviroManager.instance.Effects.Settings.effectTypes[i].name.Contains("Rain"))
                       rain = EnviroManager.instance.Effects.Settings.effectTypes[i].emissionRate;
                }
            }
        }

        private void GetWetness()
        {
            if( EnviroManager.instance != null && EnviroManager.instance.Environment != null)
            {
                wetness = EnviroManager.instance.Environment.Settings.wetness;
            }
        }

        private void GetSnow()
        {
            if(EnviroManager.instance != null && EnviroManager.instance.Environment != null)
            {
                snow = EnviroManager.instance.Environment.Settings.snow;
            }
        }

    
        void Update()    
        {   
            if(updateFromEnviro)
            {
                GetRainIntensity();
                GetWetness();
                GetSnow();
            }
            
            UpdateShaders();
        }
    }
}

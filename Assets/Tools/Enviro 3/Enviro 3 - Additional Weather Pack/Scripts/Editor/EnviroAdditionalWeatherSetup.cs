using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
namespace Enviro
{
    public class EnviroAdditionalWeatherSetup : EditorWindow
    {
        [MenuItem("Window/Enviro/Additional Weather Setup")]
        public static void ShowWindow()
        {
            //Show existing window instance. If one doesn't exist, make one.
            EditorWindow.GetWindow(typeof(EnviroAdditionalWeatherSetup));
        }

        void OnGUI()
        {
            GUILayout.Label ("Enviro 3 Additional Weather Setup", EditorStyles.boldLabel);
            GUILayout.Space(10f);
            GUILayout.Label ("Click on the button to add all data for the weather types to your current scene Enviro instance.", EditorStyles.label);
            GUILayout.Space(10f);
            if(GUILayout.Button("Add Additional Weather Types"))
            {
                AddAll();
            }
        }


        void AddAll()
        {
            EnviroEffectsModule effects = EnviroManager.instance.Effects;
            EnviroAudioModule audio = EnviroManager.instance.Audio;
            EnviroWeatherModule weather = EnviroManager.instance.Weather;

            EnviroEffectsModule effectsAdd = (EnviroEffectsModule)EnviroHelper.GetDefaultPreset("Additional Effects");
            EnviroAudioModule audioAdd = (EnviroAudioModule)EnviroHelper.GetDefaultPreset("Additional Audio");
            EnviroWeatherModule weatherAdd = (EnviroWeatherModule)EnviroHelper.GetDefaultPreset("Additional Weather");

            if(effectsAdd != null && effects != null)
            {
                for (int i = 0; i < effectsAdd.Settings.effectTypes.Count; i++)
                {
                    bool hasEntry = false;

                    for (int a = 0; a < effects.Settings.effectTypes.Count; a++)
                    {
                        if(effectsAdd.Settings.effectTypes[i].name == effects.Settings.effectTypes[a].name)
                           hasEntry = true;
                    }

                    if(!hasEntry)
                    {
                        effects.Settings.effectTypes.Add(effectsAdd.Settings.effectTypes[i]);
                    }
                }
            }

            if(audioAdd != null && audio != null)
            {
                for (int i = 0; i < audioAdd.Settings.weatherClips.Count; i++)
                {
                    bool hasEntry = false;

                    for (int a = 0; a < audio.Settings.weatherClips.Count; a++)
                    {
                        if(audioAdd.Settings.weatherClips[i].name == audio.Settings.weatherClips[a].name)
                           hasEntry = true;
                    }

                    if(!hasEntry)
                    {
                        audio.Settings.weatherClips.Add(audioAdd.Settings.weatherClips[i]);
                    }
                }

                for (int i = 0; i < audioAdd.Settings.ambientClips.Count; i++)
                {
                    bool hasEntry = false;

                    for (int a = 0; a < audio.Settings.ambientClips.Count; a++)
                    {
                        if(audioAdd.Settings.ambientClips[i].name == audio.Settings.ambientClips[a].name)
                           hasEntry = true;
                    }

                    if(!hasEntry)
                    {
                        audio.Settings.ambientClips.Add(audioAdd.Settings.ambientClips[i]);
                    }
                }
            }

            if(weatherAdd != null && weather != null)
            {
                for (int i = 0; i < weatherAdd.Settings.weatherTypes.Count; i++)
                {
                    bool hasEntry = false;

                    for (int a = 0; a < weather.Settings.weatherTypes.Count; a++)
                    {
                        if(weatherAdd.Settings.weatherTypes[i].name == weather.Settings.weatherTypes[a].name)
                           hasEntry = true;
                    }

                    if(!hasEntry)
                    {
                        weather.Settings.weatherTypes.Add(weatherAdd.Settings.weatherTypes[i]);
                    }
                }
            }
        }
    }
}

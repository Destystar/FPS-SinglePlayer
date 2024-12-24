using UnityEditor;
using UnityEngine;
namespace EnviroTerrain
{
public class EnviroChannelPacker : EditorWindow
{
    private enum Resolution
    {
        r128,
        r256,
        r512,
        r1024,
        r2048,
        r4096
    }

    private enum Channel
    {
        R,
        G,
        B,
        A
    }

    private Resolution resolution = (Resolution)4;
    private Texture2D metallicTex;

    private Channel metallicChannel = (Channel)0;
    private Texture2D occlusionTex;
    private Channel occlusionChannel = (Channel)0;
    private Texture2D heightTex;
    private Channel heightChannel = (Channel)0;
    private Texture2D smoothnessTex;
    private Channel smoothnessChannel = (Channel)3;
    private Material myMat;
    private RenderTexture renderTexture;


    [MenuItem("Window/Enviro - Terrain Shader/Channel Packer")]
    public static void ShowWindow()
    {
        //Show existing window instance. If one doesn't exist, make one.
        EditorWindow.GetWindow(typeof(EnviroChannelPacker));
    }
    
    void OnGUI()
    {
        GUILayout.Label ("      Enviro Terrain Channel Packer", EditorStyles.boldLabel);
        GUILayout.BeginHorizontal();
        metallicTex = TextureField("Metallic", metallicTex);
        occlusionTex = TextureField("Occlusion", occlusionTex);
        heightTex = TextureField("Height", heightTex);
        smoothnessTex = TextureField("Smoothness", smoothnessTex);
        GUILayout.EndHorizontal();
        GUILayout.BeginHorizontal();
        metallicChannel = ChannelField("", metallicChannel);
        occlusionChannel = ChannelField("", occlusionChannel);
        heightChannel = ChannelField("", heightChannel);
        smoothnessChannel = ChannelField("", smoothnessChannel);
        GUILayout.EndHorizontal();
        GUILayout.BeginVertical(); 
        GUILayout.Space(10);
        resolution = (Resolution)EditorGUILayout.EnumPopup("Resolution", resolution);
        if (GUILayout.Button("Create Texture"))
        {
            CreateTexture();
        }

        GUILayout.EndVertical();
    }

    private static Texture2D TextureField(string name, Texture2D texture)
    {
        GUILayout.BeginVertical();
        var style = new GUIStyle(GUI.skin.label);
        style.alignment = TextAnchor.UpperCenter;
        style.fixedWidth = 70;
        GUILayout.Label(name, style);
        var result = (Texture2D)EditorGUILayout.ObjectField(texture, typeof(Texture2D), false, GUILayout.Width(70), GUILayout.Height(70));
        GUILayout.EndVertical();
        return result;
    }

    private static Channel ChannelField(string name, Channel channel)
    {
        GUILayout.BeginVertical();
        //var style = new GUIStyle(GUI.skin.label);
        //style.alignment = TextAnchor.UpperCenter;
        //style.fixedWidth = 70;
        //GUILayout.Label(name, style);
        var result = (Channel)EditorGUILayout.EnumPopup("", channel,GUILayout.Width(70), GUILayout.Height(70));
        //var result = (Texture2D)EditorGUILayout.ObjectField(texture, typeof(Texture2D), false, GUILayout.Width(70), GUILayout.Height(70));
        GUILayout.EndVertical();
        return result;
    }


    private void CreateTexture()
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
    
        myMat.SetVector("_SourceChannel", new Vector4((float)metallicChannel,(float)occlusionChannel,(float)heightChannel,(float)smoothnessChannel));

        int res = 2048;

        switch (resolution)
        {
            case Resolution.r128:
            res = 128;
            break;
            case Resolution.r256:
            res = 256;
            break;
            case Resolution.r512:
            res = 512;
            break;
            case Resolution.r1024:
            res = 1024;
            break;
            case Resolution.r2048:
            res = 2048;
            break;
            case Resolution.r4096:
            res = 4096;
            break;
        }

        RenderTexture tempRT = RenderTexture.GetTemporary(res, res);
        Graphics.Blit(Texture2D.blackTexture, tempRT, myMat);

        Texture2D output = new Texture2D(tempRT.width, tempRT.height, UnityEngine.TextureFormat.RGBA32, false);
        RenderTexture.active = tempRT;

        output.ReadPixels(new Rect(0, 0, tempRT.width, tempRT.height), 0, 0);
        output.Apply();
        output.filterMode = FilterMode.Bilinear;

        RenderTexture.ReleaseTemporary(tempRT);
        RenderTexture.active = null;

        string path = EditorUtility.SaveFilePanelInProject("Save your packed texture.", "packedTex", "png", "");

        if (string.IsNullOrEmpty(path))
            return;

        byte[] bytes = output.EncodeToPNG(); 
    
        System.IO.File.WriteAllBytes(path, bytes);
        AssetDatabase.Refresh();
    }

}
}

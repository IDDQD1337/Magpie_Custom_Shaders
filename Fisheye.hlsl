//Shader from https://www.shadertoy.com/view/4sSSzz
//Code Blinue (Original code) and IDDQD_1337 (Edit to be to control the strength)

//!MAGPIE EFFECT
//!VERSION 3
//!OUTPUT_WIDTH INPUT_WIDTH
//!OUTPUT_HEIGHT INPUT_HEIGHT

//!PARAMETER
//!LABEL Strength
//!DEFAULT 0.0452
//!MIN -0.5
//!MAX 0.5
//!STEP 0.0001
float strengthoption;

//!TEXTURE
Texture2D INPUT;

//!SAMPLER
//!FILTER LINEAR
SamplerState sam;

//!PASS 1
//!STYLE PS
//!IN INPUT

float4 Pass1(float2 pos) {
    float strength = strengthoption;

    float2 inputSize = GetInputSize();
    float aspectRatio = inputSize.x / inputSize.y;
    float intensity = strength * aspectRatio;

    float2 coords = (pos - 0.5) * 2.0;
		
    float2 realCoordOffs = (1.0 - coords.yx * coords.yx) * intensity * coords;
    return INPUT.SampleLevel(sam, pos - realCoordOffs, 0);
}
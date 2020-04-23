#version 130

uniform sampler2D gcolor;
uniform float viewWidth;
uniform float viewHeight;

varying vec2 texcoord;

#include "/lib/settings.glsl"
#include "/lib/xbrz.glsl"

void main() {
    /* DRAWBUFFERS:0 */
    #ifdef UPSCALE_SCREEN
	gl_FragData[0] = four_xBRZ(vec2(viewWidth, viewHeight), texcoord, gcolor, vec2(0.0), vec2(1.0)); //gcolor
    #else
    gl_FragData[0] = vec4(texture2D(gcolor, texcoord).rgb, 1.0); //gcolor
    #endif
}
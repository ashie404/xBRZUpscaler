#version 130

uniform sampler2D lightmap;
uniform sampler2D texture;

varying vec2 lmcoord;
varying vec2 texcoord;
varying vec4 glcolor;

#include "/lib/settings.glsl"
#include "/lib/xbrz.glsl"

void main() {
	/* DRAWBUFFERS:0 */
	#ifdef UPSCALE_ENTITIES
	// get atlas texture size
	vec2 textureResolution = textureSize(texture, 0);
	gl_FragData[0] = four_xBRZ(textureResolution, texcoord, texture, vec2(0.0), vec2(1.0)) * glcolor * texture2D(lightmap, lmcoord); //gcolor
	#else
	gl_FragData[0] = texture2D(texture, texcoord) * glcolor * texture2D(lightmap, lmcoord); // gcolor
	#endif
}

#version 130

varying vec2 lmcoord;
varying vec2 texcoord;
varying vec2 mintex;
varying vec2 maxtex;
varying vec4 glcolor;

attribute vec2 mc_midTexCoord;

void main() {
	gl_Position = ftransform();

	texcoord = (gl_TextureMatrix[0] * gl_MultiTexCoord0).xy;
	lmcoord  = (gl_TextureMatrix[1] * gl_MultiTexCoord1).xy;
	vec2 textureSize = abs(texcoord - mc_midTexCoord.xy);
	mintex = mc_midTexCoord.xy - textureSize;
	maxtex = mc_midTexCoord.xy + textureSize;
	
	glcolor = gl_Color;
}
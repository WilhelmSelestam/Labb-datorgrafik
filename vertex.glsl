#version 330 core

uniform float time;

uniform mat4 T;

layout(location=0) in vec3 Position;
layout(location=1) in vec3 Normal;
layout(location=2) in vec2 TexCoord;

out vec3 interpolatedNormal;
out vec2 st;

uniform mat4 MV;
uniform mat4 P;

uniform vec3 lightDirection;
uniform mat4 rotateLight;

out vec3 transformedNormal;
out vec3 L;

void main() {

	L = mat3(rotateLight) * vec3(0.0, 0.1, 1.0);

	gl_Position = P * MV * vec4(Position, 1.0); // Special, required output

	interpolatedNormal = Normal; // Will be interpolated across the triangle
	st = TexCoord; // Will also be interpolated across the triangle
	


	vec3 transformedNormal = mat3(MV) * Normal;
    interpolatedNormal = normalize(transformedNormal);


}
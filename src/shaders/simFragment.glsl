uniform float time;
uniform float progress;
uniform sampler2D uPositions;
uniform sampler2D uInfo;
uniform vec4 resolution;
varying vec2 vUv;
varying vec3 vPosition;
float PI = 3.141592653589793238;
void main() {
  vec4 pos = texture2D(uPositions, vUv);
  vec4 info = texture2D(uInfo, vUv);

  float radius = info.x;
  float angle = atan(pos.y, pos.x) - info.y*0.1;

  vec3 targetPos = vec3(cos(angle), sin(angle), 0.0) * radius;

  pos.xy += (targetPos.xy - pos.xy) * 0.01;

  gl_FragColor = vec4(pos.xy,1.,1.);
}

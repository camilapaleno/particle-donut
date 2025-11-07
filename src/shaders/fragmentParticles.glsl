varying vec3 vColor;

void main() {
  // Create circular particles
  vec2 center = gl_PointCoord - vec2(0.5);
  float dist = length(center);

  // Discard fragments outside the circle
  if (dist > 0.5) discard;

  // Soft edges
  float alpha = 1.0 - smoothstep(0.3, 0.5, dist);

  gl_FragColor = vec4(vColor, alpha);
}

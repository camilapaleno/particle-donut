uniform sampler2D uPositions;
uniform float uSize;

varying vec3 vColor;

void main() {
  // Get the position data from the texture
  vec3 pos = texture2D(uPositions, position.xy).xyz;

  // Pass position to fragment shader for coloring
  vColor = vec3(position.xy, 0.5);

  // Calculate final position
  vec4 mvPosition = modelViewMatrix * vec4(pos, 1.0);
  gl_Position = projectionMatrix * mvPosition;

  // Set point size (gets smaller with distance)
  gl_PointSize = uSize * (1.0 / -mvPosition.z);
}

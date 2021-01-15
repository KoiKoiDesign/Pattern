// Function which returns polar coordinate
// cx => center x-coordinate
// cy => center y-coordinate
// r => radius
// a => angle in radians
float[] xy(float cx, float cy, float r, float a) {
  float[] f = new float[2];
  f[0] = cx + cos(a) * r;
  f[1] = cy + sin(a) * r;
  return f;
}

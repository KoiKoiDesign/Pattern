void hatching(float x, float y, float sz, float offset, int nb, int var_m) {
  pushMatrix(); 
  translate(x, y);

  float off;

  for (int i = 0; i < nb; i++) { 
    off = offset + 0.20 * i;
    if (var_m == 1) {
      line( 0, i*off, sz, sz + i*off); // Hatches
    } 
    if (var_m == 2) {
      line(0, sz + i*off, sz, i*off); // Hatches
    }
    if (var_m == 3) {
      line(i*off, 0, sz + i*off, sz); // Hatches
    } 
    if (var_m == 4) {
      line(sz + i*off, 0, i*off, sz); // Hatches
    }
  }
  popMatrix();
}


void hatchingEdges(float x, float y, float sz, float offset, int nb, int var_m) {
  pushMatrix();
  translate(x, y);

  float off;

  for (int i = 0; i < nb; i++) { 
    off = offset + 0.20 * i;
    if (var_m == 1) {
      line( 0, i*off, sz, sz + i*off); // Hatching
      line(0, 0, 0, i*off);// Edges
      line(sz, sz, sz, sz + i*off);
    } 
    if (var_m == 2) {
      line(0, sz + i*off, sz, i*off); // Hatching
      line(sz, 0, sz, i*off);// Edges
      line(0, sz, 0, sz + i*off);
    }
    if (var_m == 3) {
      line(i*off, 0, sz + i*off, sz); // Hatching
      line(0, 0, i*off, 0);// Edges
      line(sz, sz, sz + i*off, sz);
    } 
    if (var_m == 4) {
      line(sz + i*off, 0, i*off, sz); // Hatching
      line(sz, 0, sz + i*off, 0); // Edges
      line(0, sz, i*off, sz);
    }
  }
  popMatrix();
}

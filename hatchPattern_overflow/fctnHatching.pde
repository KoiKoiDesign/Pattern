void hatching(float x, float y, float sz, float offset, int nb, int var_m, color c, float rot) { // On déclare et crée les variables : ta taille du motif, nb nombre de lignes, var_m variante du motif
  pushMatrix();
  translate(x, y);
  rotate(random(-rot, rot)); 
  stroke(c);
  for (int i = 0; i < nb; i++) {
    if (var_m == 1) {
      line(i*offset, 0, sz, sz - i*offset);  // Variante 1
    } 
    if (var_m == 2) {
      line(0, i*offset, sz - i*offset, sz); // Variante 2
    }
    if (var_m == 3) {
      line(sz - i*offset, 0, 0, sz - i*offset); // etc.
    }
    if (var_m == 4) {
      line(sz, i*offset, i*offset, sz);
    }
  }
  popMatrix();
}

void display(int vrsn) {
  if (vrsn == 1) {
    for (int i = 0; i < width; i+=pttrnX) {
      for (int j = 0; j < height; j+=pttrnY) {
        int r = int(random(1, 3));
        hatchingEdges(i, j, pttrnSz, htchOff, htchNb, r);
      }
    }
  }
  if (vrsn == 2) { // Same as the previous except we use the function hatching instead of hatchingEdges
    for (int i = 0; i < width; i+=pttrnX) {
      for (int j = 0; j < height; j+=pttrnY) {
        int r = int(random(1, 3));
        hatching(i, j, pttrnSz, htchOff, htchNb, r);
      }
    }
  }
  if (vrsn == 3) { // Same as the first except the range of r is larger
    for (int i = 0; i < width; i+=pttrnX) {
      for (int j = 0; j < height; j+=pttrnY) {
        int r = int(random(1, 5)); // here
        hatching(i, j, pttrnSz, htchOff, htchNb, r);
      }
    }
  }
  if (vrsn == 4) {
    int r, nb;
    for (int i = 0; i < width; i+=pttrnX) {
      for (int j = 0; j < height; j+=pttrnY) {
        r = int(random(1, 3));
        nb = int(map(j, 0, height, 1, htchNb));
        hatching(i, j, pttrnSz, htchOff, nb, r);
      }
    }
  }
  if (vrsn == 5) { // Just of noise field version
    float pt;
    for (int i = 0; i < width; i+=pttrnX) {
      for (int j = 0; j < height; j+=pttrnY) {
        int r = int(random(1, 3));
        pt = noise(i * 0.01, j * 0.01, noiseZ * 0.01) * pttrnSz;
        hatching(i+((pttrnSz-pt)/2), j, pt, htchOff, htchNb, r);
      }
    }
    noiseZ+=100;
  }
}

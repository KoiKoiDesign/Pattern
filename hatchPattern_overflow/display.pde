void display(float xOffset, float yOffset) {
  int nx = 0;
  int ny = 0;
  for (int i = int(xOffset); i < width-int(xOffset); i+=pttrnX) {
    for (int j = int(yOffset); j < height-int(yOffset); j+=pttrnY) {
      color c;
      if (nx % 2 == 0 && ny % 2 == 0) {
        c = #FC0000;
      } else if (nx % 2 == 1 && ny % 2 == 0) {
        c = #FC0000;
      } else {
        c = #000000;
      }
      int r = int(random(1, 5));
      int n = int(random(0, htchNb));
      hatching(i, j, pttrnSz, htchOff, n, r, c, rotation);
      ny++;
    }
    nx++;
  }
}

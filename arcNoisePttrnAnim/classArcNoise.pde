class ArcNoise {

  float rMin, rMax; // radius start and stop
  float[] n = new float[2]; // coordinates in noise space
  float[] vN = new float[2]; // noise's values
  float[] inc = new float[2]; // noise's increment
  float fctr;
  float incArcNb; // increment for the arc's number for the for loop
  float[] a = new float[2];
  float aInit; // initial value for angle

  ArcNoise(float rMin_, float rMax_, float inc0_, float inc1_, float fctr_, float incArcNb_) {
    rMin = rMin_;
    rMax = rMax_;
    //n[0] = x_+ y_;
    //n[1] = x_ * y_;
    n[0] = random(width + height);
    n[1] = random(width + height, width * height);
    inc[0] = inc0_;
    inc[1] = inc1_;
    fctr = fctr_;
    incArcNb = incArcNb_;
    aInit = random(TWO_PI);
  }

  void draw(float x, float y) {
    noFill();
    stroke(#FFFFFF);
    for (float r = rMin; r <= rMax; r+=incArcNb) {
      vN[0] = noise(n[0] + fctr * r);
      vN[1] = noise(n[1] + fctr * r);
      a[0] = aInit + vN[0] * TWO_PI;
      a[1] = a[0] + vN[1] * TWO_PI;
      arc(x, y, r, r, a[0], a[1]);
    }
    n[0]+=inc[0];
    n[1]+=inc[1];
  }

} // end of class

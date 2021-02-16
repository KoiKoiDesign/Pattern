class ArcNoise {

  float x, y;
  //float rMin, rMax; // radius start and stop
  float[] n = new float[2]; // coordinates in noise space
  float[] vN = new float[2]; // noise's values
  float[] inc = new float[2]; // noise's increment
  float fctr;
  float[] a = new float[2];

  float alpha;

  float in, out;
  boolean animIn = true;
  boolean animOut = false;
  float duration = 500;
  float frmRef;
  float aR = -HALF_PI;
  float rMax_ = 1;

  ArcNoise(float x_, float y_, boolean mode_, float inc0_, float inc1_, float fctr_) {
    x = x_;
    y = y_;
    if (mode_ == true) {
      n[0] = random(width + height);
      n[1] = random(width + height, width * height);
    } else { 
      n[0] = x * 0.003;
      n[1] = y * 0.003;
    }

    inc[0] = inc0_;
    inc[1] = inc1_;
    fctr = fctr_;

    in = x/20 + y/20;
  }


  void draw(float rMin, float rMax, float stp, color c, boolean style) {
    // Style :
    if (style == true) {
      noFill();
      stroke(c);
    } else {
      alpha = (255*3)/(rMax/stp);
      fill(c, alpha);
      noStroke();
    }

    // Animation In/Out: 
    if (frameCount >= out && animIn == false) {
      animOut = true;
    }
    if (animIn) {
      if (frameCount >= in) {
        rMax_++;
        rMax_ = min(rMax_, rMax);
        if (rMax_ >= rMax) {
          out = frameCount + duration;
          animIn = false;
        }
      } else {
        rMax_ = 0;
      }
    }
    if (animOut) {
      if (rMax >= 0) {
        rMax_--;
      } else {
        rMax_ = 0;
      }
    }

    // Draw arcs :
    for (float r = rMin; r <= rMax_; r+=stp) {
      vN[0] = noise(n[0] + fctr * r);
      vN[1] = noise(n[1] + fctr * r);
      a[0] = aInit + vN[0] * TWO_PI;
      a[1] = a[0] + vN[1] * TWO_PI;
      //arc(x, y, r, r, a[0], a[1]);
      arc(x, y, r, r, a[0], a[1], CHORD);
      //arc(x, y, r, r, a[0], a[1], PIE);
    }
    n[0]+=inc[0];
    n[1]+=inc[1];
  }


  void drawInvert(float rMin, float rMax, float stp, color c, boolean style) {
    // Style :
    if (style == true) {
      noFill();
      stroke(c);
    } else {
      alpha = (255*3)/(rMax/stp);
      fill(c, alpha);
      noStroke();
    }

    // Animation In/Out: 
    if (frameCount >= out && animIn == false) {
      animOut = true;
    }
    if (animIn) {
      if (frameCount >= in) {
        rMax_++;
        rMax_ = min(rMax_, rMax);
        if (rMax_ >= rMax) {
          out = frameCount + duration;
          animIn = false;
        }
      } else {
        rMax_ = 0;
      }
    }
    if (animOut) {
      if (rMax >= 0) {
        rMax_--;
      } else {
        rMax_ = 0;
      }
    }

    for (float r = rMin; r <= rMax; r+=stp) {
      vN[0] = noise(n[0] + fctr * r);
      vN[1] = noise(n[1] + fctr * r);
      a[0] = aInit + vN[0] * TWO_PI;
      a[1] = a[0] + vN[1] * TWO_PI;
      //arc(x, y, r, r, -(TWO_PI-a[1]), a[0]);
      //arc(x, y, r, r, -(TWO_PI-a[1]) + PI/8, a[0] - PI/8); // écart
      arc(x, y, r, r, -(TWO_PI-a[1]) - PI/8, a[0] + PI/8); // Entrelacement
    }
    n[0]+=inc[0];
    n[1]+=inc[1];
  } // end of class
}

class Sqr {

  float cx, cy; // Center of the quad 

  // xy-coordinate of each corner's quad
  float x1, y1;
  float x2, y2;
  float x3, y3;
  float x4, y4;

  float r; // radius value
  float rMin, rMax; // radius min and max
  float aRa; // angle for the radius calculation (with cos())
  
  float aRot; // angle to rotate the square
  float inc; // increment

  color c; // actual Color
  color c1, c2; // range colors 
  float cLrp;
  float aCol = aRot;

  Sqr(float cx_, float cy_, float rMin_, float rMax_, float aRa_, float aRot_, float i_, color c1_, color c2_) {
    cx = cx_;
    cy = cy_;
    rMin = rMin_;
    rMax = rMax_;
    aRa = aRa_;
    aRot = aRot_;
    inc = i_;
    c1 = c1_;
    c2 = c2_;
    noStroke();
  }

  void update() {
    r = map(cos(aRa), -1, 1, rMin, rMax);
    cLrp = norm(cos(aCol), -1, 1);
    c = lerpColor(c1, c2, cLrp);
    
    aRa += inc;
    aCol += inc/2;

    x1 = xy(cx, cy, r, aRot+QUARTER_PI)[0];
    y1 = xy(cx, cy, r, aRot+QUARTER_PI)[1];
    x2 = xy(cx, cy, r, aRot+HALF_PI+QUARTER_PI)[0];
    y2 = xy(cx, cy, r, aRot+HALF_PI+QUARTER_PI)[1];
    x3 = xy(cx, cy, r, aRot+PI+QUARTER_PI)[0];
    y3 = xy(cx, cy, r, aRot+PI+QUARTER_PI)[1];
    x4 = xy(cx, cy, r, aRot+TWO_PI-QUARTER_PI)[0];
    y4 = xy(cx, cy, r, aRot+TWO_PI-QUARTER_PI)[1];
    
    aRot += inc/4;
  }

  void display() {
    fill(c);
    quad(x1, y1, x2, y2, x3, y3, x4, y4);
  }
} // end of class

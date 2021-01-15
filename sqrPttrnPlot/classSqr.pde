// Class design to work with axiDraw : noFill() and stroke()

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
  float rad;

  color c;

  float aRot; // angle to rotate the square
  float inc; // increment

  Sqr(float cx_, float cy_, float aRa_, float aRot_, float i_, color c_) {
    cx = cx_;
    cy = cy_;
    //aRa = aRa_;
    rad = aRa_;
    aRot = aRot_;
    inc = i_;
    c = c_;
  }

  void update(float fct) {
    r = rad * fct;
    x1 = xy(cx, cy, r, aRot+QUARTER_PI)[0];
    y1 = xy(cx, cy, r, aRot+QUARTER_PI)[1];
    x2 = xy(cx, cy, r, aRot+HALF_PI+QUARTER_PI)[0];
    y2 = xy(cx, cy, r, aRot+HALF_PI+QUARTER_PI)[1];
    x3 = xy(cx, cy, r, aRot+PI+QUARTER_PI)[0];
    y3 = xy(cx, cy, r, aRot+PI+QUARTER_PI)[1];
    x4 = xy(cx, cy, r, aRot+TWO_PI-QUARTER_PI)[0];
    y4 = xy(cx, cy, r, aRot+TWO_PI-QUARTER_PI)[1];
    aRot += inc;
  }

  void display() {
    stroke(c);
    noFill();
    quad(x1, y1, x2, y2, x3, y3, x4, y4);
  }
} // end of class

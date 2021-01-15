// A regular pattern of squares which are turning
// Export to svg for my axiDraw
// Class design to work with axiDraw : noFill() and stroke()

import processing.svg.*;
boolean exprt = false;

int nx; // Number of squares on a row
int ny; // Number of squares on a column
float szMax; // Square's size (actually a radius value)
float szMin; // Square's size (actually a radius value)

Sqr sq[][];

Sqr s;

void setup() {
  size(707, 500); // A4 sheet proportion

  //fullScreen();
  pixelDensity(displayDensity());
  noLoop();

  ny = 10;
  nx = 10;
  
  sq = new Sqr[nx][ny];

  for (int j = 0; j < ny; j++) {
    for (int i = 0; i < nx; i++) {
      float a1 = map(j, 0, 10, 15, 30);
      float a2 = map(i+j, 0, 10, 30, 15);
      if (i % 2 == 0 && j % 2 == 0 || i % 2 == 1 && j % 2 == 1) {
        sq[i][j] = new Sqr(15+i*40, 15+j*40, a1, 0, (i+1)*PI/16, #000000);
      } else {
        sq[i][j] = new Sqr(15+i*40, 15+j*40, a2, HALF_PI, (j+1)*-PI/8, #FC0000);
      }
      a1 += 0.66;
      a2 -= 0.33;
    }
  }
}

void draw() {
  background(#FFFFFF);
  if (exprt == true) {
    beginRecord(SVG, month()+"-"+day()+"-"+hour()+"-"+minute()+"-"+second()+".svg");
  }
  translate(10, 10);
  for (int i = 0; i < nx; i++) {
    for (int j = 0; j < ny; j++) {
      for (float f = 0.2; f <= 1; f+=0.15) {
        sq[i][j].update(f);
        sq[i][j].display();
      }
    }
  }


  if (exprt == true) {
    endRecord();
    saveFrame(month()+"-"+day()+"-"+hour()+"-"+minute()+"-"+second()+".jpg");
    exprt = false;
  }
}

void keyReleased() {
  redraw();
  if (key == 'e' || key == 'E') {
    exprt = !exprt;
    redraw();
  }
}

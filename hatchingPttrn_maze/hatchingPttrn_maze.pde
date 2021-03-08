// MOTIFS ////////////////////
// A pattern generator simply based on hatching. So it looks like a maze.
// Hatches are not regularly spaced: offset becomes larger according the number of hatches.

import processing.svg.*;

boolean exprt = false;

int version; // Pattern's version (1, 2, 3, 4 or 5)
float pttrnSz; // Pattern's size
float pttrnX, pttrnY; // Pattern's position
float htchOff; // hatching offset
int htchNb; // Number of hatching

float noiseZ; // Used inside the pattern version n°5 

void setup() {
  //size(700, 500);
  size(500, 700);
  pixelDensity(displayDensity());
  noLoop();

  strokeWeight(0.5);
  stroke(#000000);
  
  noiseZ = random(width*height, width*height*2);
}

void draw() {
  background(#FFFFFF); // Fond blanc

  if (exprt == true) {
    beginRecord(SVG, version+"-"+pttrnSz+"-"+pttrnX+"-"+pttrnY+"-"+htchOff+"-"+htchNb+"-"+"##.svg");
  } else {
    version = 4;
    pttrnSz = 20;
    pttrnX = 20;
    pttrnY = 20;
    htchOff = 0.1;
    htchNb = 15;
  }

  display(version);

  if (exprt == true) {
    endRecord();
    saveFrame(version+"-"+pttrnSz+"-"+pttrnX+"-"+pttrnY+"-"+htchOff+"-"+htchNb+"-"+"##.jpg");
    exprt = false;
  }
}

void keyPressed() {
  redraw();
  if (key == 'e' || key == 'E') {
    exprt = !exprt;
  }
}

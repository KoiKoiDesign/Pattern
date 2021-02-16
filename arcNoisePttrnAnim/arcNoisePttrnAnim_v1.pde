// A regular pattern of concentric arcs
// Start and stop angles are given according noises random
// INTERACTION :
//   • KEY RIGHT => add one pattern in row
//   • KEY LEFT => remove one pattern in row
//   • KEY UP => add one pattern in column
//   • KEY DOWN => remove one pattern in column

int nX = 4; // Number of patterns max on a row
int nY = 4; // Number of patterns max on a column
int nDrawX = 1;
int nDrawY = 1;
int stpX, stpY;
ArcNoise[][] aNArray = new ArcNoise[nX][nY];

void setup() {
  size(500, 500);
  pixelDensity(displayDensity());
  stpX = width/nX;
  stpY = height/nY;

  for (int i = 0; i < nX; i++) {
    for (int j = 0; j < nY; j++) {
      aNArray[i][j] = new ArcNoise(50, 70, 0.01, 0.03, 0.02, 1);
    }
  }
}

void draw() {
  //background(#FFFFFF); 
  background(#000000); 
  translate(-stpX/2 * (nDrawX-1), -stpY/2 * (nDrawY-1));
  for (int i = 0; i < nDrawX; i++) {
    for (int j = 0; j < nDrawY; j++) {
      aNArray[i][j].draw(width/2 + i * stpX, height/2 + j * stpY);
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      nDrawX++;
    }
    if (keyCode == LEFT) {
      nDrawX--;
    }
    if (keyCode == UP) {
      nDrawY++;
    }
    if (keyCode == DOWN) {
      nDrawY--;
    }
    if (keyCode == CONTROL) {
      nDrawX--;
      nDrawY--;
    }
    if (keyCode == ALT) {
      nDrawX++;
      nDrawY++;
    }
  }

  if (nDrawX <= 0) {
    nDrawX = 1;
  }
  if (nDrawY <= 0) {
    nDrawY = 1;
  }
  if (nDrawX > nX) {
    nDrawX = nX;
  }
  if (nDrawY > nY) {
    nDrawY = nY;
  }

  saveFrame("capture_"+month()+"-"+day()+hour()+minute()+second()+".jpg");
}

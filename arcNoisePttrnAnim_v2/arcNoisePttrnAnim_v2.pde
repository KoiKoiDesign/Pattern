// A regular pattern of concentric arcs
// Start and stop angles are given according noises random

int n;
int nX; // Number of patterns max on a row
int nY; // Number of patterns max on a column
float aInit;

float tX, tY; // Translate values
float size; 

ArcNoise[][] aNArray;

void setup() {
  size(500, 500); 
  //size(500, 707); // A4 portrait
  //size(707, 500); // A4 landscape
  pixelDensity(displayDensity());

  n = 15;

  if ( width > height) {
    nX = n;
    nY = int(nX * 0.707);
  } else if ( width < height) {
    nY = n;
    nX = int(nY * 0.707);
  } else {
    nX = n;
    nY = n;
  }
  
  size = width/(nX+1);
  
  aInit = random(TWO_PI);

  aNArray = new ArcNoise[nX][nY];

  for (int i = 0; i < nX; i++) {
    for (int j = 0; j < nY; j++) {
      aNArray[i][j] = new ArcNoise((i+1) * size, (j+1) * size, false, 0.02, 0.02, 0.005);
    }
  }
}

void draw() {
  background(#FFFFFF); 


  for (int i = 0; i < nX; i++) {
    for (int j = 0; j < nY; j++) {
      aNArray[i][j].draw(5, size, 5, #000000, false);
      //aNArray[i][j].drawInvert(5, size, 5, #FC0000, true);
    }
  }
  //saveFrame("#######.jpg");
}

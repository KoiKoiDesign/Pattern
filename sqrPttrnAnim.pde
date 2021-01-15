// A regular pattern of squares which are turning, changing it size and fading to black and white (grey)

int nx; // Number of squares on a row
int ny; // Number of squares on a column
int sz; // Square's size (actually a radius value)

Sqr sq[][];

void setup() {
  size(500, 500);
  //fullScreen();
  pixelDensity(displayDensity());

  nx = 20;
  ny = 20;
  sz = 15;

  sq = new Sqr[nx][ny];

  float a1 = 0;
  color col1 = #272727;
  color col2 = #FFFFFF;

  // Comment or uncomment to see some various versions of the sketch :
  for (int i = 0; i < nx; i++) {
    for (int j = 0; j < ny; j++) {
      if (i % 2 == 0 && j % 2 == 0) { // black and white
        sq[i][j] = new Sqr(12.5+i*25, 12.5+j*25, sz, 5, a1, a1, -0.1, col1, col2); // v1, v2, v4
        //sq[i][j] = new Sqr(12.5+i*25, 12.5+j*25, sz, 5, a1, a1, 0.1, col1, col2); // v3
      } else  if (i % 2 == 1 && j % 2 == 1) { // black and white
        sq[i][j] = new Sqr(12.5+i*25, 12.5+j*25, sz, 5, a1, a1, -0.1, col1, col2); // v1, v2, v4
        //sq[i][j] = new Sqr(12.5+i*25, 12.5+j*25, sz, 5, a1, a1, 0.1, col1, col2);  // v3
      } else { // white and black
        sq[i][j] = new Sqr(12.5+i*25, 12.5+j*25, sz, 5, a1, a1, -0.1, col2, col1); // v1, v4
        //sq[i][j] = new Sqr(12.5+i*25, 12.5+j*25, 5, sz, a1, a1, -0.1, col2, col1); // v2, v3
      }
      //a1 += 0.025; // v4
    }
    a1 += 0.1; // v1, v2, v3
  }
}

void draw() {
  background(#FFFFFF);
  for (int i = 0; i < nx; i++) {
    for (int j = 0; j < ny; j++) {
      sq[i][j].update();
      sq[i][j].display();
    }
  }
  //saveFrame("##########.jpg");
}

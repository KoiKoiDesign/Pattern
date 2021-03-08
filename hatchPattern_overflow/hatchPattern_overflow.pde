// MOTIFS ////////////////////
// On dessine un motif :
//    • sur un fond blanc
//    • des lignes obliques : une variable permet de gérer le nombre de lignes
//    • on peut configurer le nombre de lignes
//    • on propose quatre variantes
//    • on sélectionne la variante via une variable
//    • la création se fait par une fonction configurable
//    • le motif et ses configurations sont donnés aléatoirement (exceptée la taille ta)
//    • Deux nouveaux arguments pour la fonction motif() : int x et int y pour placer le motif dans la fenêtre
//    • le motif se répète sur l'axe des x
//    • le motif se répète sur l'axe des y
// AJOUT : ////////////////
//    • export en .svg
//    • fenêtre paysage

import processing.svg.*;
boolean exprt = false;

float pttrnSz; // Pattern's size
float pttrnX, pttrnY; // Pattern's position
float htchOff; // hatche's offset
int htchNb; // Number of hatches
float rotation; // random range of the rotation's pattern
float divX, divY; // Offsets with the frame

void setup() {
  //size(700, 500);
  size(500, 700);
  pixelDensity(displayDensity());
  noLoop(); // draw sera exécuté une seule fois
}

void draw() {
  background(#FFFFFF); // Fond blanc

  if (exprt == true) {
    beginRecord(SVG, pttrnSz+"-"+pttrnX+"-"+pttrnY+"-"+htchOff+"-"+htchNb+"-"+rotation+"-"+divX+"-"+divY+"-"+"####.svg");
  } else {
    pttrnSz = 33;
    pttrnX = 39;
    pttrnY = 25;
    htchOff = 11;
    htchNb = 26;
    rotation = 0.00;
    divX = 0.24;
    divY = 0.24;
  }
  
  display(width*divX, height*divY);
  
  if (exprt == true) {
    endRecord();
    saveFrame(pttrnSz+"-"+pttrnX+"-"+pttrnY+"-"+htchOff+"-"+htchNb+"-"+rotation+"-"+divX+"-"+divY+"-"+"####.jpg");
    exprt = false;
  }
}

void keyPressed() {
  //saveFrame("motif_"+frameCount+"alt_0_.jpg");
  redraw(); // relecture du draw une fois. Note : nécessiste noloop() dans setup()
  if (key == 'e' || key == 'E') {
    exprt = !exprt;
  }
}

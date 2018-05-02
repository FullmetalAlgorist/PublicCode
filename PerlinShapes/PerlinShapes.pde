//Written by FullmetalAlgorist (Mariah Vicary) 4/29/2018
//Creative Commons Attribution 4.0 International license
//Draws a screen full of simple shapes 
//colored by built in perlin noise function in HSB colorMode
//Change circle size (Tsize)

float dotsx[];
float dotsy[];
int numW;
int numH;
float Tsize = 25;  //dots will fill screen so the smaller the size the more dots
float scale = 100; //Changes color scheme try numbers from 0 to 450ish
int numDots;
float n;
float xnoise = 0.0;
float ynoise = 0.0;
float znoise = 0.0;

void setup () {
  //size(1200,600);
  fullScreen();
  colorMode(HSB, 256);
  strokeWeight(2);
  updateDots();
}

void draw () {
  background(0);
  translate(Tsize/2, Tsize/2);
  frameRate(1);

  for (int i = 0; i < numDots; i++) {
    //use included noise function to vary color
    n = noise(xnoise, ynoise, znoise) *scale;
    fill(n, 255, 255);

    //draw a bunch of circles, could change to any simple shape
    ellipse(dotsx[i], dotsy[i], Tsize, Tsize); 

    //how much the color noise varies (numbers closer to .004 have better blending) 
    // xnoise += .004;
    ynoise += .06;
    //znoise += .004;
  }
}

void updateDots() {
  numW = int(width/Tsize)+1;
  numH = int(height/Tsize)+1;
  numDots = numW* numH;
  ;  
  dotsx = new float[numDots];
  dotsy = new float[numDots];

  for (int w = 0; w<numW; w++) {
    for (int h = 0; h <numH; h++) {
      dotsx[(w* numH) +h]= w*Tsize;
      dotsy[(w* numH) +h]= h*Tsize;
    }
  }
}
void keyPressed() {
  if (key == ' ') {
    saveFrame("stills5/frame-######.png");
  }
}
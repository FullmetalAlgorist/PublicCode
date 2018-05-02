//Written by FullmetalAlgorist (Mariah Vicary) 5/2/2018
//Creative Commons Attribution 4.0 International license
//Draws concentric non perfect circles
//Press SPACE to change variation and redraw
//Press P to save still
//Commented global variables are the ones to play with

float dotsx[];
float dotsy[];
int numDots = 30;
float a;
float r = 300;            //Circle radius
float maxVariation = 60;  //Max variation
float variation = 20;
float space;
int numCirc = 20;         //Number of circles
void setup() {
  size(900, 700);
  updateDots();
  strokeWeight(1.5);
  stroke(0, 150);
  noFill();
  smooth();
  space = 1/float(numCirc);
  translate (width/2, height/2);

  updateDots();
  //draw circles
  for (int i = 0; i <numCirc; i++) {
    drawCircle(1-(i*space));
  }
}

void draw() {
  translate (width/2, height/2);
}

void keyPressed() {
  if (key == ' ') {
    //draw a new circle set with new random variation
    background(200);
    variation = random(10, maxVariation);
    updateDots();

    for (int i = 0; i <numCirc; i++) {
      drawCircle(1-(i*space));
    }
  } 
  if (key == 'p') {
    saveFrame("stills/frame-####.png");
  }
  if (key == CODED) {
    if (keyCode == UP) {
      numDots++;
    }
    if (keyCode == DOWN) {
      numDots--;
    }
  }
}

void updateDots() {
  dotsx = new float[numDots];
  dotsy = new float[numDots];

  //populate x and y arrays with varied points in a circle
  for (int i = 0; i<numDots; i++) {
    a = (i+1)*(TWO_PI/numDots);
    dotsx[i]= random(0, variation) +(r * cos(a));
    dotsy[i]= random(0, variation) +(r * sin(a));
  }
}

void drawCircle(float s) {
  beginShape();
  for (int i = 0; i<numDots; i++) {   
    curveVertex(s*dotsx[i], s*dotsy[i]);

    //if final iteration, add the last vertexes to the curve
    if (i==numDots-1) {
      curveVertex(s*dotsx[0], s*dotsy[0]);
      curveVertex(s*dotsx[1], s*dotsy[1]);
      curveVertex(s*dotsx[1], s*dotsy[1]);
    }
  }
  endShape();
}
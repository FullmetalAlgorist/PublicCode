//Written by FullmetalAlgorist (Mariah Vicary) 4/14/2018
//Creative Commons Attribution 4.0 International license
//Toggle UP and DOWN to change the number of side
//Toggle LEFT and RIGHT to change transparency
//SPACE to choose a new random color

float dotsx[];
float dotsy[];
int numDots = 14;
float a;
float r = 175;
float red = 255;
float green = 255;
float blue = 255;
float alpha= 16;
float nums = 7;

void setup () {
  fullScreen();
  //size(900, 600);
  background(0);
  smooth();
  noStroke();
  translate(width/2, height/2);
}

void draw () {
  background(0);
  translate(width/2, height/2);
  updateDots();
  for (int j = 0; j< nums; j++) {
    for (int i = 0; i<numDots; i++) {
      fill(red, green, blue, alpha);
      polygon(dotsx[i], dotsy[i], 175, numDots);
    }
  }
}

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

//function caculates numDots points aroud a circle 
//fill two arrays with the x and y values
void updateDots() {
  dotsx = new float[numDots];
  dotsy = new float[numDots];

  for (int i = 0; i<numDots; i++) {
    a = (i+1)*(TWO_PI/numDots);
    dotsx[i]= r * cos(a);
    dotsy[i]= r * sin(a);
  }
}
void keyPressed() {
  if (key == ' ') {
    //fully randomized rgb color
    //potential for color selection refinement
    red = random(255);
    green = random(255);
    blue= random(255);
  }
  if (keyCode == UP) {
    numDots++;
    numDots++;
  }
  if (keyCode == LEFT) {
    nums ++;
    alpha--;
    alpha--;
  } 
  if (keyCode == RIGHT) {
    nums--;
    alpha++;
    alpha++;
  }
  if (keyCode == DOWN) {
    if (numDots >2) {
      numDots--;
      numDots--;
    } else {
      println("Can't have less than 0 sides");
    }
  }
}
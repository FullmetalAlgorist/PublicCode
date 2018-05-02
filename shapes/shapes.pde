//Written by FullmetalAlgorist (Mariah Vicary) 3/30/2018
//Creative Commons Attribution 4.0 International license
//Press Z to draw a new randomized combination
//SPACE to save frame in stills folder

float dotsx[] ;
float dotsy[];
int numDots;
void setup() {
  size(600, 600);
   noStroke();
  background(random(255), random(255), random(255));
  drawShape();
}

void draw() {
}
void keyPressed() {
  if (key == ' ') {
    saveFrame("stills/frame-####.png");
  }
  if (key == 'z') {
    background(random(255), random(255), random(255));
    drawShape();
  }
}

void drawShape() {
  fill(random(255), random(255), random(255));
  beginShape();
  for (int i = 0; i <3; i++) {
    vertex(random(width), random(height));
  }
  endShape();
  fill(random(255), random(255), random(255));
  beginShape();
  for (int i = 0; i <4; i++) {
    vertex(random(width), random(height));
  }
  endShape();
}
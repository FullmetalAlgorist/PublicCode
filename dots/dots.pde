//Written by FullmetalAlgorist (Mariah Vicary) 4/3/2018
//Creative Commons Attribution 4.0 International license
//Calculates a specified number of dots randomized around the screen
//then draws lines connecting every dot

float dotsx[];
float dotsy[];
int numDots = 10;  //Number of dots
void setup() {
  size(600, 600);
  background(255);
  strokeWeight(.3);
  stroke(0, 150);
  dotsx = new float[numDots];
  dotsy = new float[numDots];
  for (int i = 0; i<numDots; i++) {
    dotsx[i]=random(width);
  }
  for (int i = 0; i<numDots; i++) {
    dotsy[i]=random(height);
  }

  for (int i = 0; i<numDots; i++) {
    for (int j = 0; j<numDots; j++) {
      line(dotsx[i], dotsy[i], dotsx[j], dotsy[j]);
    }
  }
}
void draw() {
}
void keyPressed() {
  if (key == ' ') {
    saveFrame("stills/frame-####.png");
  }
}
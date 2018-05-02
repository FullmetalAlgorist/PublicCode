//Written by Fullmetalalgorist (Mariah Vicary) 5/1/2018
//Creative Commons Attribution 4.0 International license
//Using parametric equations to replicate a 90s screensaver
//Toggle web display on/off by pressing 1, 2, or 3
//If only one web is showing enables menu and editing

import controlP5.*;
ControlP5 cp5;

boolean tail = false;
boolean menu = false;
float edit = 0;

//web1 variables
boolean one = true; //onscreen?
float scale1 = 250;
int c1 = color(100);
float a1 = 120;
float speed1 = .005;
int numLines1 = 120;

//web2 variables
boolean two = true;
float scale2 = 250; 
int c2 = color(100);
float a2 = 120;
float speed2 = .001;
int numLines2 = 50;

//web3 variables
boolean three = true;
float scale3 =   250;
int c3 = color(100);
float a3 = 120;
float speed3 = .002;
int numLines3 = 75;

float T = 50;
float R = 25;
float S = 50;
void setup() {
  size(1300, 650);
  background(0);
  cp5 = new ControlP5(this);

  cp5.addSlider("scale3").setPosition(1000, 570).setWidth(200).setRange(0, 350);
  cp5.addSlider("scale2").setPosition(1000, 570).setWidth(200).setRange(0, 350);
  cp5.addSlider("scale1").setPosition(1000, 570).setWidth(200).setRange(0, 350);

  cp5.addSlider("speed3").setPosition(1000, 540).setWidth(200).setRange(0.0001, .01);
  cp5.addSlider("speed2").setPosition(1000, 540).setWidth(200).setRange(0.0001, .01);
  cp5.addSlider("speed1").setPosition(1000, 540).setWidth(200).setRange(0.0001, .01);

  cp5.addSlider("numLines3").setPosition(1000, 510).setWidth(200).setRange(0, 100);
  cp5.addSlider("numLines2").setPosition(1000, 510).setWidth(200).setRange(0, 100);
  cp5.addSlider("numLines1").setPosition(1000, 510).setWidth(200).setRange(0, 100);

  cp5.addColorWheel("c1", 1025, 250, 200 ).setRGB(color(224, 7, 84));
  cp5.addColorWheel("c2", 1025, 250, 200 ).setRGB(color(172, 12, 201));
  cp5.addColorWheel("c3", 1025, 250, 200 ).setRGB(color(10, 95, 235));
}
void draw() {
  // background(0);
  edit();

  if (menu) {
    if (edit == 1) {
      cp5.getController("scale1").show();
      cp5.getController("speed1").show();
      cp5.getController("numLines1").show();
      cp5.getController("c1").show();
    }
    if (edit == 2) {
      cp5.getController("scale2").show();
      cp5.getController("speed2").show();
      cp5.getController("numLines2").show();
      cp5.getController("c2").show();
    }
    if (edit == 3) {
      cp5.getController("scale3").show();
      cp5.getController("speed3").show();
      cp5.getController("numLines3").show();
      cp5.getController("c3").show();
    }
  } else {
    cp5.getController("scale1").hide();
    cp5.getController("scale2").hide();
    cp5.getController("scale3").hide();
    cp5.getController("speed1").hide();
    cp5.getController("speed2").hide();
    cp5.getController("speed3").hide();
    cp5.getController("numLines3").hide();
    cp5.getController("numLines2").hide();
    cp5.getController("numLines1").hide();
    cp5.getController("c1").hide();
    cp5.getController("c2").hide();
    cp5.getController("c3").hide();
  }

  if (!tail) {
    background(0);
  }

  strokeWeight(1.5);
  pushMatrix();
  translate(width/2, height/2); 
  if (one) {

    stroke(c1, a1);
    for (int i= 0; i <numLines1; i++) {
      line(x(T+i), y(T+i), x1(T+i), y1(T+i));
      T= T+speed1;
    }
  }
  if (two) {
    stroke(c2, a2);

    for (int i= 0; i <numLines2; i++) {
      line(x2(R+i), y2(R+i), x3(R+i), y3(R+i));
      R= R+speed2;
    }
  }
  if (three) {
    stroke(c3, a3);
    for (int j= 0; j <numLines3; j++) {
      line(x4(S+j), y4(S+j), x5(S+j), y5(S+j));
      S= S+speed3;
    }
  }
  popMatrix();
}

float x(float t) {
  return scale1*cos(t/79 ) +scale1*cos(t/57);
}
float y(float t) {
  return scale1*sin(t/105) + sin(t/85)*scale1;
}
float x1(float t) {
  return scale1*cos(t/39) +scale1*cos(t/42);
}
float y1(float t) {
  return scale1*sin(t/62) + sin(t/39
    )*scale1;
}

float x2(float t) {
  return scale2*cos(t/53) +scale2*cos(t/-18);
}
float y2(float t) {
  return scale2*sin(t/12) + sin(t/30)*scale2;
}
float x3(float t) {
  return scale2*cos(t/27) +scale2*cos(t/15);
}
float y3(float t) {
  return scale2*sin(t/19) + sin(t/177)*scale2;
}
float x4(float t) {
  return scale3*cos(t/53) +scale3*cos(t/-18);
}
float y4(float t) {
  return scale3*sin(t/12) + sin(t/30)*scale3;
}
float x5(float t) {
  return scale3*cos(t/27) +scale3*cos(t/15);
}
float y5(float t) {
  return scale3*sin(t/19) + sin(t/177)*scale3;
}

void keyPressed() {
  if (key == ' ') {
    background(0, 0, 0);
  }
  if (key == '1') {
    one = ! one;
  }
  if (key == '2') {
    two = ! two;
  }
  if (key == '3') {
    three = ! three;
  }
}

void edit() {
  //If only web 1 on screen, show menu and allow changes
  if (one) {
    if (!two) {
      if (!three) {
        menu = true;
        edit = 1;
        return;
      }
    }
  }

  //If only web 2 on screen, show menu and allow changes
  if (two) {
    if (!one) {
      if (!three) {
        menu = true;
        edit = 2;
        return;
      }
    }
  }
  //If only web 3 on screen, show menu and allow changes
  if (three) {
    if (!two) {
      if (!one) {
        menu = true;
        edit = 3;
        return;
      }
    }
  }

  edit = 0;
  menu = false;
}
/*
This project was created in 2017 
Created with processing version 3.3.7 
New versions do not support audio features

Artist - Austin Smith 
Game - Deep Space
*/

//Import Shapes 3d for outside textured Sphere - by Peter Lager
import shapes3d.utils.*;
import shapes3d.animation.*;
import shapes3d.*;

//Import sound library
import processing.sound.*;

//Import PeasyCam for checks
import peasy.*;
PeasyCam camP;

//SoundFile c, s, m;

int k = 0;
int p = 0;
int blueObstacle;
float cSpeed = 5;
float score = 0;
float scoreUp=.25;

float oSpeed = 5;
float oSpeedUpd = .7;
float oSpeedB;
float oSpeedUpdB = .7;

//Initialize Classes used
int nStars = 500;
Stars[] allStars = new Stars[nStars];
Vehicle v1;
Obstacle o1;
Menu m1;
Coin c1;
ObstacleB oB1;

PImage p1; //Sky

float yRot;

Ellipsoid stars;

int bMove = 0;
int cMove = 0;

float linesTransX;
float linesTransZ;

boolean text = true;
boolean crashCheck = false;

float xT = 0;
float yT = 0;

void setup() {
  //Set Classes 
  blueObstacle = 0;
  textMode(SHAPE);
  o1 = new Obstacle();
  m1 = new Menu();
  makeStars();
  c1 = new Coin();
  oB1 = new ObstacleB();
  v1 = new Vehicle();

  //Load Sounds
  //c = new SoundFile(this, "beep.wav");
  //s = new SoundFile(this, "crash2.wav");
  //m = new SoundFile(this, "Music.mp3");

  //Outside Sphere with Stars
  stars = new Ellipsoid(this, 10, 10);
  stars.setTexture("stars.jpg", 5, 5);
  stars.drawMode(Shape3D.TEXTURE);
  stars.setRadius(5000);

  //camP = new PeasyCam(this, 1000);
  //camP.setMinimumDistance(100);
  //camP.setMaximumDistance(2000);

  size(1400, 1100, P3D);
  cursor(CROSS);

  linesTransX = 0;
  linesTransZ = 0;
}

void draw() {
  //PopMAtrix so its at end of runway
  pushMatrix();
  translate(700, 620, 870);
  rotateY(PI);

  //Draw Runway
  background(0);
  noStroke();
  pushMatrix();
  translate(0, 0, 2500);
  fill(35, 78, 175, 100);
  box(100, 30, 5000);
  popMatrix();

  //Lines
  //pushMatrix();
  //translate(0, 0, 50);
  //xT = 31;
  //yT = 13;
  //for (int i = 0; i>5; i++) {
  //  for (int j = 0; i>5; i++) {
  //    strokeWeight(5);
  //    stroke(255, 100);
  //    fill(255);
  //    pushMatrix();
  //    translate(xT, yT, 0);

  //    popMatrix();
  //    yT = yT + 15;
  //  }
  //  yT = 13;
  //  xT = xT -15.5;
  //}
  //popMatrix();

  //Draw Runway Lines
  for (int i = 0; i<6; i++) {
    pushMatrix();
    translate(linesTransX+5.95, 0, 2500);
    linesTransX = linesTransX - 15.25;
    stroke(0);
    strokeWeight(.1);
    fill(255, 100);
    box(1, 32.5, 5000);
    popMatrix();
  }

  linesTransX = 32;
  linesTransZ = 0;
  
  //Display Moving Stars and Vehicle
  v1.display();
  for (int i =0; i < nStars; i++) {
    allStars[i].display();
  }
  stars.draw();
  m1.display();

  //After Menu Functions "s"
  if (text == false) {
    o1.display();
    c1.updateScore();
    c1.display();
    if (blueObstacle > 5) {
      oSpeedB = oSpeed;
      oB1.display();
    }
  }

  popMatrix(); 
  //Start Game
  if ((keyPressed == true)&&(key == 's')||(key =='S')) {
    text = false;
    blueObstacle = 0;
    oB1.zTransOB = 3000;
    while (p==0) {
//      m.play();
      p++;
    }
  }
}


//Key FUnctions for Movement and change variables for collision check
void keyPressed() {
  if (crashCheck == false) {
    if (keyCode == LEFT) {
      if ((bMove < 5)&&(bMove >0)) {
        v1.vehicleMoveLeft();
        bMove = bMove-1;
      }
    }
    if (keyCode == RIGHT) {
      if ((bMove < 4)&&(bMove > -1)) {
        v1.vehicleMoveRight();
        bMove = bMove + 1;
      }
    }
    if (keyCode == UP) {
      if ((cMove < 5)&&(cMove > 0)) {
        v1.vehicleMoveUp();
        cMove = cMove - 1;
      }
    }
    if (keyCode == DOWN) {
      if ((cMove < 4)&&(cMove > -1)) {
        v1.vehicleMoveDown();
        cMove = cMove + 1;
      }
    }
  }
  //Restart Game
  if ((keyCode == 'r')||(keyCode == 'R')) {
    crashCheck = false;
    m1.menuReset();
    o1.obstacleReset();
    c1.coinScoreReset();
    oB1.obstacleBReset();
//    m.stop();
    k=0;
    p=0;
  }
}

//Function for making the stars 
void makeStars() {
  for (int i =0; i < nStars; i++) {
    allStars[i] = new Stars();
  }
}

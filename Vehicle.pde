class Vehicle {

  //Properties
  int mainRings = 15;

  float rotShip;
  float rotUpd;

  float lV;
  float wV;
  float hV;
  color cV;

  float xTrans;
  float yTrans;
  float zTrans;

  float xT;
  float yT;
  float zT;

  float tUpdSpeed;
  float tUpd;

  float xUpd;
  float yUpd;
  float zUpd;

  float tHeight;
  float tWidth;

  float vWidth[] = new float[mainRings];
  float vHeight[] = new float[mainRings];
  color tStroke[] = new color[6];

  //Constructor
  Vehicle() {
    tUpdSpeed = .03;
    tUpd = .3;
    rotShip = -(HALF_PI/7)*2;
    rotUpd = (HALF_PI/7);
    //Color for Engine Fire
    tStroke[0] = color(255, 0, 0);
    tStroke[1] = color(223, 94, 45);
    tStroke[2] = color(227, 134, 40);
    tStroke[3] = color(234, 164, 34);
    tStroke[4] = color(239, 191, 29);
    tStroke[5] = color(242, 233, 60);

    //Width for Main Frame
    vWidth[0] = 6;
    vWidth[1] = 6;
    vWidth[2] = 6;
    vWidth[3] = 6;
    vWidth[4] = 5.5;
    vWidth[5] = 5;
    vWidth[6] = 4.5;
    vWidth[7] = 4.5;
    vWidth[8] = 4.5;
    vWidth[9] = 4.5;
    vWidth[10] = 4.5;
    vWidth[11] = 4.5;
    vWidth[12] = 3.45;
    vWidth[13] = 2.5;
    vWidth[14] = 1;

    //Height for Main Frame
    vHeight[0] = 3;
    vHeight[1] = 3;
    vHeight[2] = 3;
    vHeight[3] = 3;
    vHeight[4] = 3;
    vHeight[5] = 2.5;
    vHeight[6] = 2;
    vHeight[7] = 2;
    vHeight[8] = 2;
    vHeight[9] = 2;
    vHeight[10] = 2;
    vHeight[11] = 2;
    vHeight[12] = 1.5;
    vHeight[13] = 1;
    vHeight[14] = .5;

    zT = 0;
    xT = 0;
    yT = 0;

    zUpd = 1.8;

    lV = 5;
    wV = 5;
    hV = 10;
    cV = color(135, 156, 158);

    xTrans = 0+32;
    yTrans = -20+(-60);
    zTrans = 40;
  }

  //Method
  void display() {
    zUpd = 2.2;
    pushMatrix();
    translate(xTrans, yTrans, zTrans); //Translate for Move Functions
    rotateZ(rotShip);

    fill(cV);
    strokeWeight(7);
    stroke(cV);


    //MainFrame
    for (int i = 0; i<mainRings; i++) {
      pushMatrix();
      translate(xT, yT, zT);
      ellipse(0, 0, vWidth[i], vHeight[i]);
      popMatrix();
      zT = zT + zUpd;
    }
    zT = 0;

    //Middle Bar for Side Wings
    pushMatrix();
    translate(0, 0, 5);
    fill(cV);
    strokeWeight(3);
    stroke(93, 93, 93);
    box(10, 1, 2);
    popMatrix();

    //Side Wings
    strokeWeight(7);
    pushMatrix();
    translate(5, 0, 7.5);
    rotateY(HALF_PI);
    fill(93, 93, 93);
    stroke(93, 93, 93);
    ellipse(0, 0, 14, 1.5);
    translate(0, 0, -10);
    ellipse(0, 0, 14, 1.5);
    popMatrix();

    //Grey Stripe down middle
    pushMatrix();
    fill(93);
    translate(0, -1, -1);
    ellipse(0, 0, 3, 2);
    translate(0,-2.5,0);
    fill(cV);
    stroke(cV);
    ellipse(0, 0, .5, 5);
    stroke(93);
    fill(93);
    translate(0,2.5,1);
    ellipse(0, 0, 2, 3);
    translate(0,-2.5,0);
    fill(cV);
    stroke(cV);
    ellipse(0, 0, .5, 4.5);
    stroke(93);
    fill(93);
    translate(0,2.5,1);
    ellipse(0, 0, 2, 3);
    translate(0,0,1);
    ellipse(0, 0, 2, 3);
     translate(0,-2,0);
    fill(cV);
    stroke(cV);
    ellipse(0, 0, .5, 3);
    stroke(93);
    fill(93);
    translate(0,2,1);
    ellipse(0, 0, 2, 3);
    translate(0,0,1);
    ellipse(0, 0, 2, 3);
    translate(0,0,1);
    ellipse(0, 0, 2, 3);
    translate(0,.1,1);
    ellipse(0, 0, 2, 3);
    translate(0,.1,1);
    ellipse(0, 0, 2, 3);
    translate(0,.1,1);
    ellipse(0, 0, 2, 3);
    translate(0,.1,1);
    ellipse(0, 0, 2, 3);

    popMatrix();

    //Fuel Engine for Main Frame
    pushMatrix();
    translate(xT, yT, zT-2);
    fill(0);
    strokeWeight(8);
    stroke(0);
    ellipse(0, 0, 5, 3);

    //Front Window Detail
    translate(0, -.4, 25);
    ellipse(0, 0, 3, 2);
    translate(0, 0, -1);
    ellipse(0, 0, 3, 2);
    popMatrix();
    noFill();
    zT=0;

    tHeight = 4;
    tWidth = 2;

    for (int i = 0; i<6; i++) {
      pushMatrix();
      translate(xT, yT, zT-3.8);
      stroke(tStroke[i], 130);
      ellipse(0, 0, tHeight, tWidth);
      popMatrix();
      zT = zT - zUpd;
      zUpd = zUpd+tUpd;
      tHeight = tHeight - .5;
      tWidth = tWidth - .25;
    }
    zT = 0;


    popMatrix(); //PopMatrix for move functions
    tailMove();
  }

  void tailMove() {
    tUpd = tUpd + tUpdSpeed;
    if (tUpd > .35) {
      tUpdSpeed = tUpdSpeed * -1;
    }
    if (tUpd < .1) {
      tUpdSpeed = tUpdSpeed * -1;
    }
  }

  void vehicleMoveRight() {
    xTrans = xTrans - 16;
    rotShip = rotShip + rotUpd;
  }
  void vehicleMoveLeft() {
    xTrans = xTrans + 16;
    rotShip = rotShip - rotUpd;
  }
  void vehicleMoveUp() {
    yTrans = yTrans - 15;
  }
  void vehicleMoveDown() {
    yTrans = yTrans + 15;
  }
}
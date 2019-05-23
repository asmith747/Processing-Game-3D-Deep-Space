class Obstacle {
  
  float zTransO;

  float transX;
  float transY;
  int fullCheckB;

  boolean boxCheck[][] = new boolean[5][5];
  int boxInt[][] = new int[5][5];

  Obstacle() {
    fullCheckB = 0;

    zTransO = 2000;
    for (int i = 0; i<5; i++) {
      for (int j = 0; j<5; j++) {
        boxInt[i][j] = int(random(8));
        boxCheck[i][j] = false;
      }
    }
  }

  void display() {

    pushMatrix();
    translate(0, 0, zTransO);
    strokeWeight(3);
    stroke(0);
    fill(255, 13, 0, 200);
    translate(-44.25, -50, 0);
    box(11, 100, 11);
    translate(88.5, 0, 0);
    box(11, 100, 11);
    translate(-44.25, -44.5, 0);
    box(99, 11, 11);

    transX = 31;
    transY = 13;
    for (int i = 0; i<5; i++) {
      for (int j = 0; j<5; j++) {
        if ((boxInt[i][j] >1)&&(boxInt[i][j]<8)) {
          fullCheckB++;
          if(fullCheckB < 25){
          pushMatrix();
          translate(transX, transY, 0);
          box(15.5, 15, 2);
          popMatrix();
          boxCheck[i][j] = true;
          }
        }
        transY = transY + 15;
      }
      transY = 13;
      transX = transX-15.5;
    }
    fullCheckB = 0;
    popMatrix();

    moveObstacle();
    obsCheck();
    collisionCheck();
  }

  void moveObstacle() {
    zTransO = zTransO - oSpeed;
  }

  void obsCheck() {
    if (zTransO < -50) {
      blueObstacle = blueObstacle + 1;
      zTransO = 2000;
      for (int i = 0; i<5; i++) {
        for (int j = 0; j<5; j++) {
          boxInt[i][j] = int(random(8));
          boxCheck[i][j] = false;
        }
      }
      if (oSpeed<20) {
        oSpeed = oSpeed + oSpeedUpd;
      }
    }
    
  }

  void collisionCheck() {
    if ((zTransO <65)&&(zTransO>30)) {
      if (boxCheck[bMove][cMove] == true) {
        pushMatrix();
        rotateY(PI);
        translate(0, -20, -200);
        textSize(30);
        text("Game Over", -80, -130, 0);
        textSize(10);
        text("Press R to Restart", -40, -117.5, 0);
        popMatrix();
        oSpeed = 0;
        oSpeedUpd = 0;
        scoreUp = 0;
        cSpeed = 0;
        oSpeedB = 0;
        oSpeedUpd = 0;
        crashCheck = true;
        while(k==0){
//        m.stop();
//        s.play();
        k++;
        }
      }
    }
  }
  void obstacleReset() {
    for (int i = 0; i<5; i++) {
      for (int j = 0; j<5; j++) {
        boxInt[i][j] = int(random(8));
        boxCheck[i][j] = false;
      }
    }
    oSpeed = 5;
    zTransO = 2000;
    oSpeedUpd = .7;
    scoreUp = .25;
  }
}

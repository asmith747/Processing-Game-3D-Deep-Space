class ObstacleB {
  float zTransOB;
  float transXB;
  float transYB;
  boolean boxCheckB[] = new boolean[5];
  int boxIntB[] = new int[5];
  
  int fullCheck;

  ObstacleB() {
    fullCheck = 0;
    oSpeedB = oSpeed;
   // oSpeedUpdB = .75;
    
    zTransOB = 3000;
    transXB = 31;
    transYB = 13;

    for (int i = 0; i<5; i++) {
      boxIntB[i] = int(random(4));
      boxCheckB[i] = false;
    }
  }

  void display() {
    pushMatrix();
    translate(0, 0, zTransOB);
    strokeWeight(3);
    stroke(0);
    fill(0, 13, 255, 200);
    translate(-44.25, -50, 0);
    box(11, 100, 11);
    translate(88.5, 0, 0);
    box(11, 100, 11);
    translate(-44.25, -44.5, 0);
    box(99, 11, 11);

    transXB = 0;
    transYB = 13;
    for (int i = 0; i<5; i++) {
      if ((boxIntB[i] >-1)&&(boxIntB[i]<2)) {
        fullCheck = fullCheck+1;
        if(fullCheck < 5){
        pushMatrix();
        translate(transXB, transYB, 0);
        box(78, 15, 2);
        popMatrix();
        boxCheckB[i] = true;
        }
      }
      transYB = transYB + 15;
    }
    fullCheck=0;
    transYB = 13;
    popMatrix();
    moveObstacle();
    obsCheck();
    collisionCheck(); 
  }

  void obsCheck() {
    if (zTransOB < -50) {
      zTransOB = 2000;
      for (int i = 0; i<5; i++) {

        boxIntB[i] = int(random(4));
        boxCheckB[i] = false;
      }
      oSpeedB = oSpeed;

      if (oSpeedB<20) {
        oSpeedB = oSpeedB + oSpeedUpdB;
      }
    }
    
  }
  
  void moveObstacle() {
    zTransOB = zTransOB - oSpeedB;
  }
  
  void collisionCheck() {
    if ((zTransOB <65)&&(zTransOB>30)) {
      if (boxCheckB[cMove] == true) {
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
        oSpeedB = 0;
        oSpeedUpdB = 0;
        scoreUp = 0;
        cSpeed = 0;
        crashCheck = true;
        while(k==0){
//        m.stop();
//        s.play();
        k++;
        }
      }
    }
  }
  
  void obstacleBReset(){
    for (int i = 0; i<5; i++) {
        boxIntB[i] = int(random(4));
        boxCheckB[i] = false;
      }
    oSpeed = 5;
    zTransOB = 2000;
    oSpeedUpdB = .7;
    scoreUp = .25;
  }
}

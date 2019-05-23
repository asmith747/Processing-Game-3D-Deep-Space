class Coin{
  float yRot;
  float yRotUpd;
  float zTransC;
  int xPos;
  int yPos;
  
   
  Coin(){
    yRot = 0;
    yRotUpd = .1;
    zTransC = 1450;
    xPos = int(random(5));
    yPos = int(random(5));
   
  }
  
  void display(){
    stroke(0);
    strokeWeight(2);
    fill(222, 222, 33);
    pushMatrix();
    translate(30-(xPos*15),-82+(yPos*15), zTransC);
    rotateY(yRot);
    ellipse(0,0,10,10);
    popMatrix();
    spinCoin();
    coinCollisionCheck();
    updateCoin();
    
    pushMatrix();
    rotateY(PI);
    translate(0, -20, -200);
    textSize(20);
    text("Score = "+ int(score), -190, -170, 0);
    popMatrix();
  }
  
  void spinCoin(){
    yRot = yRot + yRotUpd;
    zTransC = zTransC - cSpeed;
  }
  
  void updateCoin(){
    if (zTransC < -50) {
      zTransC = 1900+random(850);
      xPos = int(random(5));
      yPos = int(random(5));
      if (cSpeed<20) {
        cSpeed = cSpeed + .65;
      }
    }
  }
  
  void coinCollisionCheck(){
    if ((zTransC <55)&&(zTransC>30)) {
      if((xPos == bMove)&&(yPos == cMove)){
         zTransC = 1900+random(850);
        xPos = int(random(5));
        yPos = int(random(5));
        score = score + 250;
//        c.play();
        if (cSpeed<16) {
        cSpeed = cSpeed + .75;
      }
      }
  }
  }
  void updateScore(){
    score = score + scoreUp;
  }
  
  void coinScoreReset(){
    println("Your Score = " + int(score) +"!");
    score = 0;
    cSpeed = 5;
    zTransC = 1450;
    xPos = int(random(5));
    yPos = int(random(5));
  }
}

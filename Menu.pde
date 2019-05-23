class Menu {
  float zTransM;
  float menuSpeed;
  float score;
  float scoreUpd;
  float rotYC;
  float rUpd;

  Menu() {
    rUpd = .1;
    rotYC = 0;
    zTransM = -200;
    menuSpeed = 2;
  }

  void display() {
    if(zTransM<150){
    fill(255);
    pushMatrix();
    rotateY(PI);
    translate(0, -20, zTransM);
    
    stroke(0);
    strokeWeight(2);
    fill(222, 222, 33);
    pushMatrix();
    translate(-195,-20, 0);
    rotateY(rotYC);
    ellipse(0,0,10,10);
    popMatrix();
    rotYC = rotYC + rUpd;
    
    fill(255);
    textSize(30);
    text("Menu", -45, -170, 0);
    fill(0,0,255);
    rotateX(-.8);
    textSize(25);
    text("DEEP SPACE", -71, -130, 0);
    rotateX(.8);
    fill(255);
    textSize(10);
    text("Created By:", -28, -10, -100);
    text("Austin Smith", -31, 0, -100);
    text("CONTROLS:", -200, -80, 0);
    text("UP - Move Up", -200, -70, 0);
    text("DOWN - Move Down", -200, -60, 0);
    text("RIGHT - Move Right", -200, -50, 0);
    text("LEFT - Move Left", -200, -40, 0);
     text("= 250 Points", -185, -17, 0);
    text("To Start Game - Press S", 83, -50, 0);
    text("To Restart Game - Press R", 71, -40, 0);
    popMatrix();
    
    
    }
    if (text == false ) {
      moveMenu();
    }  
  }

  void moveMenu() {
    zTransM = zTransM+menuSpeed;
  }
  
  void menuReset(){
    text = true;
     zTransM = -200;
  }
  
}
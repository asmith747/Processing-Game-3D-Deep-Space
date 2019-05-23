class Stars{
  float sH;
  float sW;
  float sL;
  color sC;
  
  float starSpd;
  
  float xRand;
  float yRand;
  float zRand;
  
  Stars(){
    
    yRand = random(800)-random(800);
    xRand = random(800)-random(800);
    zRand = 1500 + random(700)-random(700);
    
    sH = 2;
    sW = 2;
    sL = 2;
    sC = color(255);
    starSpd =6;
  }
  
  void display(){
    if((yRand<-100)||(yRand>-10)||(xRand>60)||(xRand<-60)){
    pushMatrix();
    translate(xRand,yRand,zRand);
    fill(sC);
    noStroke();
    box(sH);
    popMatrix();
  }
     updateStar();
     starCheck();
  }
  
  void updateStar(){
       zRand = zRand - starSpd;
  }
  
  void starCheck(){
    if(zRand < 0){
      zRand = 1500 + random(700)-random(700);
    }
  }
}
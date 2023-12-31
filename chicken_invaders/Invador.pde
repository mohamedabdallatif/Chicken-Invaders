class PInvader {
  int prev = 0, x1 = 0, x = 0, y1 = height - 100, y2 = 0, lastX = 0, lastY = 0;
  PImage invader1, invader2, killedInvader, bossInvader;
  public PInvader() {
    this.invader1 = loadImage("InvaderLevelOne.png");
    this.bossInvader = loadImage("bossInvader.png");
    this.killedInvader = loadImage("KilledInvader.png");
    this.bossInvader = loadImage("bossInvader.png");
    this.invader2 = loadImage("InvaderLevelTwo.png");
      
}

  void display() {
    if(!InvaderHit){
      if (mouseX > 60 && mouseX < width - 60)   x1 = mouseX;  // x for level 1
      if (mouseX > 70 && mouseX < width - 70)   x = mouseX;   // x for level 2, 3
      if (mouseY > 90 && mouseY < height - 90)  y2 = mouseY;  // y for level 2, 3
      if (flag == 2) image(invader1, x1, y1, 120, 200);  // level 1
      else if (flag == 3)  image(invader2, x, y2, 140, 180);  // level 2
      else if (flag == 6)  image(bossInvader, x, y2, 140, 180);    // Monster level
      prev = millis();
      lastX = x;
      lastY = y2;
    }
    else{
       if(millis() - prev < 2000){
          killedInv.play();
          if (flag == 2) image(killedInvader, lastX, y1, 150, 150);
          else if (flag == 3) image(killedInvader, lastX, lastY, 150, 150);
          else if (flag == 6) image(killedInvader, lastX, lastY, 200, 200);
       }
       else{
        LoseSound = minim.loadFile("Lose.wav");
        flag = 5; 
       }
    }
  }
  
  boolean touchChicken(float targetX, float targetY) {
   return dist(x, y2, targetX, targetY) < 80;
  }
  boolean touchTheMonster(float targetX, float targetY) {
   return dist(mouseX, mouseY, targetX, targetY) < 200;
  }
}

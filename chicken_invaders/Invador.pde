class PInvader {
  int prev = 0, x = 0, y = 0;
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
      if (mouseX > 60 && mouseX < width - 60) {
        if (flag == 2) image(invader1, mouseX, height - 100, 120, 200);
        else if (flag == 3) image(invader2, mouseX, mouseY, 140, 175);
        else if (flag == 6) image(bossInvader, mouseX, mouseY, 140, 180);
      } else if (mouseX <= 60) {
        if (flag == 2) image(invader1, 60, height - 100, 120, 200);
        else if (flag == 3) image(invader2, 60, mouseY, 140, 175);
        else if (flag == 6) image(bossInvader, 60, mouseY, 140, 180);
      } else {
        if (flag == 2) image(invader1, width - 60, height -100, 120, 200);
        else if (flag == 3) image(invader2, width - 60, mouseY, 140, 175);
        else if (flag == 6) image(bossInvader, width - 60, mouseY, 140, 180);
      } 
      prev = millis();
      x = mouseX;
      y = mouseY;
    }
    else{
       if(millis() - prev < 2000){
          killedInv.play();
          if (flag == 2) image(killedInvader, x, height - 100, 150, 150);
          else if (flag == 3) image(killedInvader, x, y, 150, 150);
          else if (flag == 6) image(killedInvader, x, y, 200, 200);
       }
       else flag = 5;
    }
  }
  
  boolean touchChicken(float targetX, float targetY) {
   return dist(mouseX, mouseY, targetX, targetY) < 80;
  }
  boolean touchTheMonster(float targetX, float targetY) {
   return dist(mouseX, mouseY, targetX, targetY) < 200;
  }
}

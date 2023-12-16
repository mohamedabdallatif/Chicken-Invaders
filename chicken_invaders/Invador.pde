class PInvader {
  int prev = 0, x = 0;
  PImage invader, killedInvader;
  public PInvader(String invPath) {
    this.invader = loadImage(invPath);
    this.killedInvader = loadImage("KilledInvader.png");
  }

  void display() {
    if(!InvaderHit){
      if (mouseX > 60 && mouseX < width - 60) {
        if (flag - 1 == 1) image(invader, mouseX, height - 100, 120, 200);
        else if (flag - 1 == 2) image(invader, mouseX, mouseY, 120, 200);
      } else if (mouseX <= 60) {
        if (flag - 1 == 1) image(invader, 60, height - 100, 120, 200);
        else if (flag - 1 == 2) image(invader, 60, mouseY, 120, 200);
      } else {
        if (flag - 1 == 1) image(invader, width - 60, height -100, 120, 200);
        else if (flag - 1 == 2) image(invader, width - 60, mouseY, 120, 200);
      } 
      prev = millis();
      x = mouseX;
    }
    else{
       if(millis() - prev < 1000){
          killedInv.play();
          if (flag - 1 == 1) image(killedInvader, x, height - 100, 150, 150);
          else if (flag - 1 == 2) image(killedInvader, mouseX, mouseY, 150, 150);
       }
       else flag = 5;
    }
  }
  
  boolean touchChicken(float targetX, float targetY) {
   return dist(mouseX, mouseY, targetX, targetY) < 80;
 }
}

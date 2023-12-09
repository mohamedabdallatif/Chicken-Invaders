class PInvader {
  PImage invader, killedInvador;
  int prev = 0, x = 0;
  public PInvader(String invPath) {
    this.invader = loadImage(invPath);
    this.killedInvador = loadImage("KilledInvador.png");
  }

  void display() {
    if(!InvadorHit){
      if (mouseX > 60 && mouseX < width - 60) {
        image(invader, mouseX, height - 100, 120, 200);
      } else if (mouseX <= 60) {
        image(invader, 60, height - 100, 120, 200);
      } else {
        image(invader, width - 60, height -100, 120, 200);
      } 
      prev = millis();
      x = mouseX;
    }
    else{
       if(millis() - prev < 1000){
          killedInv.play();
          image(killedInvador, x, height - 100, 150, 150);
       }
       else flag = 3;
    }
  }
}

class StartPage{
  boolean isMute = false;
  PImage soundIcon = loadImage("sound.png");
  PImage muteIcon = loadImage("mute.png");
  AudioPlayer player = minim.loadFile("sound.mp3");
  
  void drawStartPage() {
   PImage start_page_background;
   start_page_background = loadImage("StartBackground.jpg"); 
   image(start_page_background, width / 2, height / 2);
   stroke(255); 
   strokeWeight(4);
   textFont(titleFontX);
   if(isMute){
     player.pause();
     image(muteIcon,50,50,60,60);
    }
    else{
     player.play();
     image(soundIcon,50,50,60,60);
    }
    if (mouseX > 250 && mouseX < 440 && mouseY > 530 && mouseY < 590) {
      fill(255, 165, 0);
      beginShape();
        vertex(270, 520);
        vertex(430, 520); 
        vertex(455, 560);
        vertex(430, 600);
        vertex(270, 600); 
        vertex(245, 560);
      endShape(CLOSE);
      fill(0);
      textSize(70);
      text("PLAY",315, 585);
      if(mousePressed){
        flag = 2;
        clickSound.play();
        player.pause();
        killedInv = minim.loadFile("KilledInvader.wav");
      }
    } 
    else {
      fill(255, 215, 0);
      beginShape();
        vertex(280, 530);
        vertex(420, 530); 
        vertex(445, 560);
        vertex(420, 590);
        vertex(280, 590); 
        vertex(255, 560);
      endShape(CLOSE);
      fill(0);
      textSize(60);
      text("PLAY",320, 580);
  }
    
    if (mouseX > 550 && mouseX < 750 && mouseY > 530 && mouseY < 590) {
      fill(255, 165, 0);
      beginShape();
        vertex(570, 520);
        vertex(730, 520); 
        vertex(755, 560);
        vertex(730, 600);
        vertex(570, 600); 
        vertex(545, 560);
      endShape(CLOSE);
      fill(0);
      textSize(70);
      text("GUIDE",605, 585);
      if(mousePressed){
        flag = 1;
        clickSound.play();
      }
    } else {
      fill(255, 215, 0);
      beginShape();
        vertex(580, 530);
        vertex(720, 530); 
        vertex(745, 560);
        vertex(720, 590);
        vertex(580, 590); 
        vertex(555, 560);
      endShape(CLOSE);
      fill(0);
      textSize(60);
      text("GUIDE",610, 580);
    }
    
    if(mouseX>=50 && mouseY>=50 && mouseX<=110 && mouseY<=110){
      if(mousePressed){
         isMute= !isMute;
      }
    }
   } 
}

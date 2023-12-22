class GameBegining{
  String title = "CHICKEN INVADERS";
  String objective = "The game puts you at the forefront of a battle against invading intergalactic chickens, bent on revenge against the human race for our oppression of Earth chickens.";
  String instructions = "you clear of chickens and other enemies, avoid eggs and other projectiles, collect power-ups to make your weapon stronger, get food items to obtain Rockets";
  String levels = "Three levels including Boss, Win Two levels, Fight Boss.";
  String rewards = "Blast enough chickens and you’ll be rewarded with drumsticks. Collecting drumsticks can earn you a powerful missile which will let you get past particularly challenging sections";
  PImage guide_background = loadImage("Space.jpg");
  boolean isMute = false;
  PImage soundIcon = loadImage("sound.png");
  PImage muteIcon = loadImage("mute.png");
  AudioPlayer player = minim.loadFile("sound.mp3");
  
  void drawStartPage() {
   PImage start_page_background;
   start_page_background = loadImage("StartBackground.jpg");
   smooth();
   imageMode(CENTER);
   image(start_page_background, width / 2, height / 2);
   stroke(255); 
   strokeWeight(4);
   imageMode(CORNER);
   textFont(titleFontX);
    if(isMute){
     player.pause();
     image(muteIcon,10,10,60,60);
    }
    else{
     player.play();
     image(soundIcon,10,10,60,60);
    }
    if(mouseX>=10 && mouseY>=10 && mouseX<=70 && mouseY<=70){
      if(mousePressed){
         isMute= !isMute;
      }
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
        clickSound = minim.loadFile("click.wav");
        clickSound.play();
        player.pause();
        killedInv = minim.loadFile("KilledInvader.wav");
        previousMoment = millis();
        initEgg();
        flag = 2;
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
        clickSound = minim.loadFile("click.wav");
        clickSound.play();
        flag = 1;  
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
   } 
  
  void drawGuidePage() {
     smooth();
     imageMode(CENTER);
     strokeWeight(5);
     stroke(255);
     image(guide_background, width/2, height/2);
     textFont(titleFont);
     textAlign(CENTER);
     textSize(60);
     fill(255, 255, 0);
     text(title, width/2, 100);
     textAlign(LEFT);
     textFont(font);
     textSize(45);
     fill(255, 200, 0);
     text(objective, 50, 150, 1100, 900);
     textFont(titleFontX);
     fill(0, 255, 153);
     text("Game instructions:", 50, 300, 1100, 900);
     text("Game Levels:", 50, 490, 1100, 900);
     text("Game Rewards:", 50, 600, 1100, 900);
     textFont(font);
     textSize(37);
     fill(200, 255, 255);
     text(instructions, 50, 360, 1100, 900);
     text(levels, 50, 555, 1100, 900);
     text(rewards, 50, 660, 1100, 900);
     if(mouseX > 100 && mouseX < 250 && mouseY < 880 && mouseY > 800){
        fill(255, 255, 0); 
        beginShape();
           vertex(150, 810);
           vertex(260, 810); 
           vertex(260, 870);
           vertex(150, 870); 
           vertex(150, 890);
           vertex(90, 840); 
           vertex(150, 790); 
        endShape(CLOSE);
        fill(0);
        textSize(26);
        text("Return home", 115, 848);
        if(mousePressed){
          flag = 0;
          clickSound = minim.loadFile("click.wav");
          clickSound.play();
        }
     }
     else{
       fill(150, 255, 100); 
       beginShape();
          vertex(150, 820);
          vertex(250, 820); 
          vertex(250, 860);
          vertex(150, 860); 
          vertex(150, 880);
          vertex(100, 840); 
          vertex(150, 800); 
      endShape(CLOSE);
      fill(0);
      textSize(23);
      text("Return home", 120, 848);
}
     
  }
}

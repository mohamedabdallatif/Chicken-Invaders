class Guide{
  String title = "CHICKEN INVADORS";
  String objective = "The game puts you at the forefront of a battle against invading intergalactic chickens, bent on revenge against the human race for our oppression of Earth chickens.";
  String instructions = "you clear of chickens and other enemies, avoid eggs and other projectiles, collect power-ups to make your weapon stronger, get food items to obtain Rockets";
  String levels = "four levels; at the end of four levels, you’ll fight a boss.";
  String rewards = "Blast enough chickens and you’ll be rewarded with drumsticks. Collecting drumsticks can earn you a powerful missile which will let you get past particularly challenging sections";
  
  void displayGuide() {
     imageMode(CENTER);
     strokeWeight(5);
     stroke(255);
     background = loadImage("Space.jpg");
     image(background, width/2, height/2);
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

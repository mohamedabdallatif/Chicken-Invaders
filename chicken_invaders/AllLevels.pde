class AllLevels {
  int currentMoment = 0, previousMoment = 0, eggTime = 0, randomEgg = 0, allDead = 0, rocketLoading = 0;
  int[] xPoints = {31, 40, 62, 43, 51, 31, 11, 19, 0, 22}; 
  int[] yPoints = {0, 22, 22, 38, 60, 46, 60, 38, 22, 22};
  PImage levelOnebackground = loadImage("Space.jpg");
  PImage levelTwobackground = loadImage("Space.jpg");
  PImage rocket = loadImage("Rocket.png");
  PImage endLevelBackground = loadImage("EndLevelBackground.jpg"); 
  PImage winnerBackground = loadImage("WinLevelBackground.jpg");

 void displayLevelOne() {
  imageMode(CENTER);
  image(levelOnebackground, width/2, height/2);
  invader.display();
  imageMode(CORNER);
  noFill();
  rect(20, 20, 200, 20, 20, 20, 20, 20);
  fill(0);
  if(score >= 200)  score = 200;
  rect(20, 20, score, 20, 20, 20, 20, 20);
  noFill();
  rect(900, 20, 200, 20, 20, 20, 20, 20);
  fill(0);
  if(score > 60)  rocketLoading = 200;
  else rocketLoading = score * 3;
  rect(900, 20, rocketLoading, 20, 20, 20, 20, 20);
  image(rocket, 1120, 15, 30, 30);
  textFont(font);
  textSize(20);
  fill(255);
  if(score > 60)    text("Try Rocket", 800, 20, 1100, 900);  
  textFont(titleFont);
  textSize(30);
  text(str(score), 230, 20, 1100, 900);  
  // draw chickens and move them 
  for (int i = 0; i <= chickens.size()-1; i++) {
    if (chickens.get(i).curX > chickens.get(i).x + 80 || chickens.get(i).curX < chickens.get(i).x)
        chickens.get(i).chSpd *= -1;
     chickens.get(i).displayMoveX();
    }
  
  if(mousePressed && millis() - previousMoment > 200){
    if (mouseButton == LEFT) {
      bullets.add(new Bullet(mouseX, height - 200, 0));   
    } else if (mouseButton == RIGHT && score >= 70) {
      bullets.add(new Bullet(mouseX, height - 200, 1));   
    }
     previousMoment = millis();
     
  }
  // choose random alive chicken and drop it's egg
  if(millis() - eggTime > 6000) {
      do {
        randomEgg = (int) random(0, chickens.size());
      } while(chickens.get(randomEgg).isHit);
      eggTime = millis();
  }  
  if(randomEgg < chickens.size()) chickens.get(randomEgg).dropEgg();
 
  for (int i = 1; i < bullets.size(); i++) {
    Bullet b = bullets.get(i);
    b.display();
    if (b.bulletOutScreen()) {
      bullets.remove(i);
      continue;
    }
    for(int j = 0; j < chickens.size(); j++) {
      if(!chickens.get(j).isHit && b.hitChicken(chickens.get(j).curX, chickens.get(j).y)){
         bullets.remove(i);
         screemChicken = minim.loadFile("chicken_screeming.mp3");
         screemChicken.play();
         chickens.get(j).isHit = true;
         killed++;
         score += 10;
         break;
      }
    }
  }
  if(killed == chickens.size()){
    /*
        killedInv = minim.loadFile("KilledInvader.wav");
        clickSound = minim.loadFile("click.wav");
        clickSound.play();
        InvaderHit = false;
        chickens.clear();
        bullets.clear();
        buildChickens(100);
        flag = 2;
    */
     println(nowT);
     explosion.play();
     for(int j = 0; j < chickens.size(); j++) {
       chickens.get(j).isHit = true;
     }
    } 
    if(nowT != 0 && millis() - nowT > 2000){
       println(nowT); 
       flag = 5;  
    }
  }
  
  void displayLevelTwo() {
    imageMode(CENTER);
    image(levelTwobackground, width/2, height/2);
    invader.display();
    // up row for rocket and score
    imageMode(CORNER);
    noFill();
    rect(20, 20, 200, 20, 20, 20, 20, 20);
    fill(0);
    if(score >= 200)  score = 200;
    rect(20, 20, score, 20, 20, 20, 20, 20);
    noFill();
    rect(900, 20, 200, 20, 20, 20, 20, 20);
    fill(0);
    if(score > 60)  rocketLoading = 200;
    else rocketLoading = score * 3;
    rect(900, 20, rocketLoading, 20, 20, 20, 20, 20);
    image(rocket, 1120, 15, 30, 30);
    textFont(font);
    textSize(20);
    fill(255);
    if(score > 60)    text("Try Rocket", 800, 20, 1100, 900);  
    textFont(titleFont);
    textSize(30);
    text(str(score), 230, 20, 1100, 900);  
    // draw chickens and move them 
    for (int i = 0; i <= chickens.size()-1; i++) {
    if (chickens.get(i).curY > chickens.get(i).y + 415 || chickens.get(i).curY < chickens.get(i).y)
          chickens.get(i).chSpd *= -1;
    chickens.get(i).displayMoveY();
  }
    
    if(mousePressed && millis() - previousMoment > 200){
      if (mouseButton == LEFT) {
        bullets.add(new Bullet(mouseX, height - 200, 0));   
      } else if (mouseButton == RIGHT && score >= 70) {
        bullets.add(new Bullet(mouseX, height - 200, 1));   
      }
       previousMoment = millis();
       
    }
    // choose random alive chicken and drop it's egg
    if(millis() - eggTime > 6000) {
        do {
          randomEgg = (int) random(0, chickens.size());
        } while(chickens.get(randomEgg).isHit);
        eggTime = millis();
    }  
    if(randomEgg < chickens.size()) chickens.get(randomEgg).dropEgg();
   
    for (int i = 1; i < bullets.size(); i++) {
      Bullet b = bullets.get(i);
      b.display();
      if (b.bulletOutScreen()) {
        bullets.remove(i);
        continue;
      }
      for(int j = 0; j < chickens.size(); j++) {
        if(!chickens.get(j).isHit && b.hitChicken(chickens.get(j).curX, chickens.get(j).y)){
           bullets.remove(i);
           screemChicken = minim.loadFile("chicken_screeming.mp3");
           screemChicken.play();
           chickens.get(j).isHit = true;
           killed++;
           score += 10;
           break;
        }
      }
    }
    if(killed == chickens.size()){
       println(nowT);
       explosion.play();
       //for(int j = 0; j < chickens.size(); j++) {
       //  chickens.get(j).isHit = true;
       //}
      } 
      if(nowT != 0 && millis() - nowT > 4000)  flag = 4;  
      
  }
  
  void displayEndLevel(){
    imageMode(CENTER);
    image(endLevelBackground, width/2, height/2);
    // play again button
    if (mouseX > 460 && mouseX < 660 && mouseY > 480 && mouseY < 560) {
      fill(255, 165, 0);
      // if user click on this button
      if(mousePressed) {
        killedInv = minim.loadFile("KilledInvader.wav");
        clickSound = minim.loadFile("click.wav");
        clickSound.play();
        InvaderHit = false;
        chickens.clear();
        bullets.clear();
        buildChickens(200);
        flag = 2;
      }
    } 
    else  fill(255, 215, 0);
    rect(460, 480, 215, 80, 50, 50, 50, 50);
    fill(0);
    textFont(titleFontX);
    textSize(70);
    text("PLAY AGAIN",480, 543);
    
    // exit button
    if (mouseX > 460 && mouseX < 660 && mouseY > 580 && mouseY < 660) {
      fill(200, 50, 0); 
      if(mousePressed) {
        clickSound.play();
        exit();
      }
    } 
    else  fill(255, 0, 0);
    rect(500, 580, 120, 80, 50, 50, 50, 50);
    fill(0);
    textSize(70);
    text("EXIT",530, 645);
  }
  
  void displayWinnerLevel(){
    imageMode(CENTER);
    image(winnerBackground, width/2, height/2);
    textFont(levelName);
    textSize(70);
    text("Level 1",535, 450);
    fill(255);
    textFont(titleFontX);
    textSize(50);
    text(str(score),600, 615);
    
    if (mouseX > 515 && mouseX < 690 && mouseY > 660 && mouseY < 710) {
      fill(225, 80, 80);
      if(mousePressed) {
        clickSound.play();
        exit();
      }
     } 
    else   fill(255, 120, 120);
    rect(515, 660, 175, 50, 50, 50, 50, 50);
    fill(255);
    textFont(nextLevelButton);
    textSize(40);
    text("Next Level",540, 700);
    textFont(font60);
    if (mouseX > 750 && mouseX < 820 && mouseY > 615 && mouseY < 685) {
      fill(200, 50, 0); 
      ellipse(785, 650, 70, 70);
      textSize(25);
      fill(255); 
      text("EXIT",755, 657);
      if(mousePressed) {
        clickSound.play();
        exit();
      }
     } 
     else{
       fill(255, 0, 0);
       ellipse(785, 650, 60, 60); 
       textSize(20);
       fill(255);
       text("EXIT",760, 657);
     }
     fill(230, 240, 40);
     if(score < 40)  drawStar(570, 480);
     else if(score < 70){
        drawStar(530, 480);
        drawStar(610, 480);
     }
     else{
        drawStar(490, 480);
        drawStar(570, 480);
        drawStar(650, 480);
     }
  }
  void drawStar(int posx, int posy) {
    beginShape();
    for (int i = 0; i < xPoints.length; i++) {
      vertex(xPoints[i] + posx, yPoints[i] + posy);
    }
    endShape(CLOSE);
  }
}

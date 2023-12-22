class GameLevels {
  int currentMoment = 0, eggTime = 0, bulletTime = 0, randomEgg = 0, randomBullet = 0;
  int allDead = 0, rocketLoading = 0;
  float starAngle = 0;
  float[] xPoints = {0, 15, 45, 20, 30, 0, -30, -20, -45, -15};
  float[] yPoints = {-50, -20, -20, 10, 40, 20, 40, 10, -20, -20};
  PImage rocket = loadImage("Rocket.png");
  PImage levelsbackground = loadImage("Space.jpg");
  PImage endLevelBackground = loadImage("EndLevelBackground.jpg"); 
  PImage winnerBackground = loadImage("WinLevelBackground.jpg");
  PImage monsterBackground = loadImage("BossSpace.jpg");
  

 void displayLevelOne() {
    baseForAllLevels();      
    currentLevel = 1;  // used for additional bullets...
    // draw chickens and move them 
    for (int i = 0; i <= chickens.size()-1; i++) {
      if (chickens.get(i).curX > chickens.get(i).x + 80 || chickens.get(i).curX < chickens.get(i).x)
          chickens.get(i).chSpd *= -1;
       chickens.get(i).display();
      }
    
    if(killed == chSize) {
       winLevel = 1;
       KillAllChickens();

  } 
    if(killed == chSize)   flag = 4; 
    
  }
  
  void displayLevelTwo() {
     baseForAllLevels();     
     currentLevel = 2; 
    // draw chickens and move them 
    for (int i = 0; i <= chickens.size()-1; i++) {
      if (chickens.get(i).curY > chickens.get(i).y + 100 || chickens.get(i).curY < chickens.get(i).y)
            chickens.get(i).chSpd *= -1;
      chickens.get(i).display();
    }
    
    for(Chicken chicken : chickens) {
      if(!chicken.isHit && invader.touchChicken(chicken.x, chicken.curY))
        InvaderHit = true;
    }
   
    if(killed == chSize) {
       winLevel = 2;
       KillAllChickens();
      
    } 
    if(killed == chSize)   flag = 4;
     
  }
  
  
  void monsterLevel(){
    smooth();
    imageMode(CENTER);
    image(monsterBackground, width/2, height/2);
    monster.display();
    if(!InvaderHit){
      if(mousePressed && millis() - previousMoment > 200){
         bullets.add(new Bullet(mouseX, mouseY, 0));
         bullets.add(new Bullet(mouseX - 20, mouseY, 0));
         bullets.add(new Bullet(mouseX + 20, mouseY, 0));
         previousMoment = millis();
      }
    }
    currentLevel = 3;  
    monster.displayMonsterEggs();
    if(monster.monsterDead)  winLevel = 3;
    for (int i = 1; i < bullets.size(); i++) {
      Bullet b = bullets.get(i);
      b.display();
      if (b.bulletOutScreen()) {
        bullets.remove(i);
        continue;
      }
      if(b.hitMonster(monster.x, monster.y)){
          monster.monsterLife += random(10, 30);
          // monster.monsterLife = constrain(monster.monsterLife, 0, 200);
          if(monster.monsterLife >= 1000)  monster.monsterLife = 1000;
          monster.nextImage = millis();  // if bullet shooted monster, display another image for 500 ms
          bullets.remove(i);
          continue;
      }
    }
    invader.display();
    noFill();
    rect(100, 40, 1000, 20, 20, 20, 20, 20);
    fill(255);
    if(monster.monsterLife > 1000){
       monster.monsterLife = 1100;
       monster.monsterDead = true;
       
    }
    rect(100, 40, monster.monsterLife, 20, 20, 20, 20, 20);
    textFont(font);
    textSize(20);
    text("Monster Life", 550, 55);
    
    
  }
  void displayEndLevel(){
    smooth();
    imageMode(CENTER);
    image(endLevelBackground, width/2, height/2);
    // play again button
    if (mouseX > 460 && mouseX < 660 && mouseY > 480 && mouseY < 560) {
      fill(255, 165, 0);
      // if user click on this button
      if (mousePressed) {
        baseForEndAndWin();
        buildChickens(0);
        flag = lastFlag;
      }
    } else  fill(255, 215, 0);
    rect(460, 480, 215, 80, 50, 50, 50, 50);
    fill(0);
    textFont(titleFontX);
    textSize(70);
    text("PLAY AGAIN", 480, 543);

    // exit button
    if (mouseX > 500 && mouseX < 620 && mouseY > 580 && mouseY < 660) {
      fill(200, 50, 0); 
      if (mousePressed) {
        clickSound = minim.loadFile("click.wav");
        clickSound.play();
        exit();
      }
    } else  fill(255, 0, 0);
    rect(500, 580, 120, 80, 50, 50, 50, 50);
    fill(0);
    textSize(70);
    text("EXIT", 530, 645);
  }
  
  void displayWinnerLevel(){
    smooth();
    imageMode(CENTER);
    image(winnerBackground, width/2, height/2);
    textFont(levelName);
    textSize(70);
    text("Level " + str(winLevel),535, 450);
    fill(255);
    textFont(titleFontX);
    textSize(50);
    text(str(score),600, 615);

    if (mouseX > 515 && mouseX < 690 && mouseY > 660 && mouseY < 710) {
      fill(225, 80, 80);
      if (mousePressed) {
        for (int j = 0; j < chickens.size(); j++) {
          chickens.get(j).isHit = false;
        }
        baseForEndAndWin();
        switch(winLevel) {
           case 1:
             buildChickens(100);
             flag = 3;
             lastFlag = 3;
             break;
           case 2:
             flag = 6;
             lastFlag = 6;
             break;
           case 3:
             flag = 7;
             break;
        }
      }
    } else   fill(255, 120, 120);
    rect(515, 660, 175, 50, 50, 50, 50, 50);
    fill(255);
    textFont(nextLevelButton);
    textSize(40);
    text("Next Level", 540, 700);
    textFont(font60);
    if (mouseX > 750 && mouseX < 820 && mouseY > 615 && mouseY < 685) {
      fill(200, 50, 0); 
      ellipse(785, 650, 70, 70);
      textSize(25);
      fill(255); 
      text("EXIT", 755, 657);
      if (mousePressed) {
        clickSound = minim.loadFile("click.wav");
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
     if(score < 80)   drawStar(590, 500);
     else if(score < 150){
        drawStar(550, 500);
        drawStar(630, 500);
     }
     else{
        drawStar(510, 500);
        drawStar(590, 500);
        drawStar(670, 500);
     }
  }
  
  void baseForAllLevels(){
    smooth();
    imageMode(CENTER);
    image(levelsbackground, width/2, height/2);
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
    if(score >= 135)  rocketLoading = 200;
    else rocketLoading = (int)(score * 1.5);
    rect(900, 20, rocketLoading, 20, 20, 20, 20, 20);
    image(rocket, 1120, 15, 30, 30);
    textFont(font);
    textSize(20);
    fill(255);
    if(score >= 135)    text("Try Rocket", 800, 20, 1100, 900);  
    textFont(titleFont);
    textSize(30);
    text(str(score), 230, 20, 1100, 900);
    // when invader is a live, mouse clicked, launch new bullet
    if(!InvaderHit){
      if(mousePressed && millis() - previousMoment > 200){
      if (mouseButton == LEFT) {
         //println(bulletsNumber);
        if(flag == 2){    // bullets for level 1
          switch(bulletsNumber){
            case 1:  
              bullets.add(new Bullet(mouseX, height - 200, 0));
              break;
            case 2:  
              bullets.add(new Bullet(mouseX - 20, height - 200, 0));
              bullets.add(new Bullet(mouseX + 20, height - 200, 0));
              break;
            case 3:    
              bullets.add(new Bullet(mouseX, height - 200, 0));
              bullets.add(new Bullet(mouseX - 20, height - 200, 0));
              bullets.add(new Bullet(mouseX + 20, height - 200, 0));
              break;
            case 4:  
              bullets.add(new Bullet(mouseX - 40, height - 200, 0));
              bullets.add(new Bullet(mouseX + 40, height - 200, 0));
              bullets.add(new Bullet(mouseX - 20, height - 200, 0));
              bullets.add(new Bullet(mouseX + 20, height - 200, 0));
              break;
            case 5:
              bullets.add(new Bullet(mouseX, height - 200, 0));
              bullets.add(new Bullet(mouseX - 40, height - 200, 0));
              bullets.add(new Bullet(mouseX + 40, height - 200, 0));
              bullets.add(new Bullet(mouseX - 20, height - 200, 0));
              bullets.add(new Bullet(mouseX + 20, height - 200, 0));
              break;
            
          }
        }
        else{    // bullets for level 2
          switch(bulletsNumber){
            case 1:  
              bullets.add(new Bullet(mouseX, mouseY, 0));
              break;
            case 2:  
              bullets.add(new Bullet(mouseX - 20, mouseY, 0));
              bullets.add(new Bullet(mouseX + 20, mouseY, 0));
              break;
            case 3:    
              bullets.add(new Bullet(mouseX, mouseY, 0));
              bullets.add(new Bullet(mouseX - 20, mouseY, 0));
              bullets.add(new Bullet(mouseX + 20, mouseY, 0));
              break;
            case 4:  
              bullets.add(new Bullet(mouseX - 40, mouseY, 0));
              bullets.add(new Bullet(mouseX + 40, mouseY, 0));
              bullets.add(new Bullet(mouseX - 20, mouseY, 0));
              bullets.add(new Bullet(mouseX + 20, mouseY, 0));
              break;
            case 5:
              bullets.add(new Bullet(mouseX, mouseY, 0));
              bullets.add(new Bullet(mouseX - 40, mouseY, 0));
              bullets.add(new Bullet(mouseX + 40, mouseY, 0));
              bullets.add(new Bullet(mouseX - 20, mouseY, 0));
              bullets.add(new Bullet(mouseX + 20, mouseY, 0));
              break;
          }
        
        }
        
      } else if (mouseButton == RIGHT && score >= 135) {
        bullets.add(new Bullet(mouseX, height - 200, 1));
        score += 50;
      }
       previousMoment = millis();
    }
    }
    
    // choose random a live chicken and drop it's egg
    if(millis() - eggTime > 6000) {
        do {
          randomEgg = (int) random(0, chickens.size());
        } while(chickens.get(randomEgg).isHit);
        eggTime = millis();
    }  
    if(randomEgg < chickens.size()){
      chickens.get(randomEgg).dropEgg();
    }
   
   // choose random a live chicken and drop it's additional
    if(millis() - bulletTime > 3000) {
        do {
          randomBullet = (int) random(0, chickens.size());
        } while(chickens.get(randomBullet).isHit);
        bulletTime = millis();
    }  
    if(randomBullet < chickens.size()){
        chickens.get(randomBullet).dropAdditionalBullets();
    }
    for (int i = 0; i < bullets.size(); i++) {
      Bullet b = bullets.get(i);
      b.display();
      if (b.bulletOutScreen()) {
        bullets.remove(i);
        continue;
      }
      for(int j = 0; j < chickens.size(); j++) {
        if(!chickens.get(j).isHit && b.hitChicken(chickens.get(j).curX, chickens.get(j).y)) {
           bullets.remove(i);
           screemChicken = minim.loadFile("chicken_screeming.mp3");
           screemChicken.play();
           chickens.get(j).isHit = true;
           killed++;
           //break;
        }
      }
    }
   
}    


  void baseForEndAndWin(){
        killedInv = minim.loadFile("KilledInvader.wav");
        previousMoment = millis();
        killed = 0;
        nowT = 0;
        startLevel2Time = 0;
        bulletsNumber = 1;
        monster.x = monster.y = 100;
        explosion = minim.loadFile("explosion.mp3");
        clickSound = minim.loadFile("click.wav");
        clickSound.play();
        InvaderHit = false;
        score = rocketLoading = killed = monster.monsterLife = 0;
        chickens.clear();
        bullets.clear();
  }
  void drawStar(int posx, int posy) {
    pushMatrix();
    translate(posx, posy);
    rotate(starAngle);
    scale(sin(starAngle/ 10));
      beginShape();
      for (int i = 0; i < xPoints.length; i++) {
        vertex(xPoints[i], yPoints[i]);
      }
      endShape(CLOSE);
   popMatrix();
   starAngle += 0.04;
  }
}

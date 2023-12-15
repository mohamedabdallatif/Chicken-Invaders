class AllLevels {
  int currentMoment = 0, previousMoment = 0, eggTime = 0, randomEgg = 0, allDead = 0, rocketLoading = 0;
  float starAngle = 0;
  float[] xPoints = {0, 15, 45, 20, 30, 0, -30, -20, -45, -15};
  float[] yPoints = {-50, -20, -20, 10, 40, 20, 40, 10, -20, -20};
  PImage levelOnebackground = loadImage("Space.jpg");
  PImage levelTwobackground = loadImage("Space.jpg");
  PImage rocket = loadImage("Rocket.png");
  PImage endLevelBackground = loadImage("EndLevelBackground.jpg"); 
  PImage winnerBackground = loadImage("WinLevelBackground.jpg");

  void displayLevelOne() {
    base();

    if (mousePressed && millis() - previousMoment > 200) {
      if (mouseButton == LEFT) {
        bullets.add(new Bullet(mouseX, height - 200, 0));
      } else if (mouseButton == RIGHT && score >= 70) {
        bullets.add(new Bullet(mouseX, height - 200, 1));
      }
      previousMoment = millis();
    }
    // choose random alive chicken and drop it's egg
    if (millis() - eggTime > 6000) {
      do {
        randomEgg = (int) random(0, chickens.size());
      } while (chickens.get(randomEgg).isHit);
      eggTime = millis();
    }  
    if (randomEgg < chickens.size()) chickens.get(randomEgg).dropEgg();

    for (int i = 1; i < bullets.size(); i++) {
      Bullet b = bullets.get(i);
      b.display();
      if (b.bulletOutScreen()) {
        bullets.remove(i);
        continue;
      }
      for (int j = 0; j < chickens.size(); j++) {
        if (!chickens.get(j).isHit && b.hitChicken(chickens.get(j).curX, chickens.get(j).y)) {
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
    if (killed == chickens.size()) {
      killedInv = minim.loadFile("KilledInvader.wav");
      clickSound = minim.loadFile("click.wav");
      clickSound.play();
      InvaderHit = false;
      chickens.clear();
      bullets.clear();
      buildChickens(100);
      flag = 5;
    } 
    if (nowT != 0 && millis() - nowT > 2000) {
      flag = 2;
    }
  }

  void displayLevelTwo() {
    base();
    if (mousePressed && millis() - previousMoment > 200) {
      if (mouseButton == LEFT) {
        bullets.add(new Bullet(mouseX, height - 200, 0));
        bullets.add(new Bullet(mouseX - 20, height - 200, 0)); 
      } else if (mouseButton == RIGHT && score >= 70) {
        bullets.add(new Bullet(mouseX, height - 200, 1));
      }
      previousMoment = millis();
    }
    // choose random alive chicken and drop it's egg
    if (millis() - eggTime > 6000) {
      do {
        randomEgg = (int) random(0, chickens.size());
      } while (chickens.get(randomEgg).isHit);
      eggTime = millis();
    }  
    if (randomEgg < chickens.size()) chickens.get(randomEgg).dropEgg();

    for (int i = 1; i < bullets.size(); i++) {
      Bullet b = bullets.get(i);
      b.display();
      if (b.bulletOutScreen()) {
        bullets.remove(i);
        continue;
      }
      for (int j = 0; j < chickens.size(); j++) {
        if (!chickens.get(j).isHit && b.hitChicken(chickens.get(j).curX, chickens.get(j).y)) {
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
    if (killed == chickens.size()) {
      println(nowT);
      explosion.play();
      for (int j = 0; j < chickens.size(); j++) {
        chickens.get(j).isHit = true;
      }
    } 
    if (nowT != 0 && millis() - nowT > 4000)  flag = 0;
  }

  void displayEndLevel() {
    imageMode(CENTER);
    image(endLevelBackground, width/2, height/2);
    // play again button
    if (mouseX > 460 && mouseX < 660 && mouseY > 480 && mouseY < 560) {
      fill(255, 165, 0);
      // if user click on this button
      if (mousePressed) {
        killedInv = minim.loadFile("KilledInvader.wav");
        clickSound = minim.loadFile("click.wav");
        clickSound.play();
        InvaderHit = false;
        chickens.clear();
        bullets.clear();
        buildChickens(200);
        flag = 2;
      }
    } else  fill(255, 215, 0);
    rect(460, 480, 215, 80, 50, 50, 50, 50);
    fill(0);
    textFont(titleFontX);
    textSize(70);
    text("PLAY AGAIN", 480, 543);

    // exit button
    if (mouseX > 460 && mouseX < 660 && mouseY > 580 && mouseY < 660) {
      fill(200, 50, 0); 
      if (mousePressed) {
        clickSound.play();
        exit();
      }
    } else  fill(255, 0, 0);
    rect(500, 580, 120, 80, 50, 50, 50, 50);
    fill(0);
    textSize(70);
    text("EXIT", 530, 645);
  }


  void displayWinnerLevel() {
    if (flag == 4)  WinnerBase("Level 1", 5);
    else WinnerBase("Level 2", 2);
    if (score < 40)   drawStar(590, 500);
    else if (score < 70) {
      drawStar(550, 500);
      drawStar(630, 500);
    } else {
      drawStar(510, 500);
      drawStar(590, 500);
      drawStar(670, 500);
    }
  }

  void drawStar(int posx, int posy) {
    pushMatrix();
    translate(posx, posy);
    rotate(starAngle);
    beginShape();
    for (int i = 0; i < xPoints.length; i++) {
      vertex(xPoints[i], yPoints[i]);
    }
    endShape(CLOSE);
    popMatrix();
    starAngle += 0.04;
  }

  void base() {  
    imageMode(CENTER);
    image(levelOnebackground, width/2, height/2);
    if (flag == 2){
       invader.display();
    }else if (flag == 5){
      invader.InvaderL2Display();
    }
    imageMode(CORNER);
    noFill();
    rect(20, 20, 200, 20, 20, 20, 20, 20);
    fill(0);
    if (score >= 200)  score = 200;
    rect(20, 20, score, 20, 20, 20, 20, 20);
    noFill();
    rect(900, 20, 200, 20, 20, 20, 20, 20);
    fill(0);
    if (score > 60)  rocketLoading = 200;
    else rocketLoading = score * 3;
    rect(900, 20, rocketLoading, 20, 20, 20, 20, 20);
    image(rocket, 1120, 15, 30, 30);
    textFont(font);
    textSize(20);
    fill(255);
    if (score > 60)    text("Try Rocket", 800, 20, 1100, 900);  
    textFont(titleFont);
    textSize(30);
    text(str(score), 230, 20, 1100, 900);  
    // draw chickens and move them 
    for (int i = 0; i <= chickens.size()-1; i++) {
      if (chickens.get(i).curX > chickens.get(i).x + 80 || chickens.get(i).curX < chickens.get(i).x)
        chickens.get(i).chSpd *= -1;
      chickens.get(i).displayMoveX();
    }
  }

  void WinnerBase (String WinnedlevelName, int nextLevelFlag) {
    imageMode(CENTER);
    image(winnerBackground, width/2, height/2);
    textFont(levelName);
    textSize(70);
    text(WinnedlevelName, 535, 450);
    fill(255);
    textFont(titleFontX);
    textSize(50);
    text(str(score), 600, 615);

    if (mouseX > 515 && mouseX < 690 && mouseY > 660 && mouseY < 710) {
      fill(225, 80, 80);
      if (mousePressed) {
        for (int j = 0; j < chickens.size(); j++) {
          chickens.get(j).isHit = false;
        }
        previousMoment = millis();
        killed = 0;
        nowT = 0;
        clickSound.play();
        score = 0;
        flag = nextLevelFlag;
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
        clickSound.play();
        exit();
      }
    } else {
      fill(255, 0, 0);
      ellipse(785, 650, 60, 60); 
      textSize(20);
      fill(255);
      text("EXIT", 760, 657);
    }
    fill(230, 240, 40);
  }
}

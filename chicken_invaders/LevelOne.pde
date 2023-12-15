class LevelOne{
  int currentMoment = 0, previousMoment = 0, eggTime = 0, randomEgg = 0, allDead = 0, rocketLoading = 0;
  PImage background = loadImage("Space.jpg");
  PImage rocket = loadImage("Rocket.png");

  
 void DrawLevelOne(){
  imageMode(CENTER);
  image(background, width/2, height/2);
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
    chickens.get(i).display();
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
     for(int j = 0; j < chickens.size(); j++) {
       chickens.get(j).isHit = true;
     }
    } 
    if(nowT != 0 && millis() - nowT > 2000){
       println(nowT); 
       flag = 4;  
    }
  }
}
  
  

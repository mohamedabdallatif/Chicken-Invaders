class LevelOne{
  int currentMoment = 0, previousMoment = 0, eggTime = 0, randomEgg = 0, killed = 0;
  PImage background = loadImage("Space.jpg");
 
 void DrawLevelOne(){
  imageMode(CENTER);
  image(background, width/2, height/2);
  invader.display();
  imageMode(CORNER);

  // draw chickens and move them 
  for (int i = 0; i <= chickens.size()-1; i++) {
    if (chickens.get(i).curX > chickens.get(i).x + 80 || chickens.get(i).curX < chickens.get(i).x)
          chickens.get(i).chSpd *= -1;
    chickens.get(i).display();
  }
  
  if(mousePressed && millis() - previousMoment > 200){
     previousMoment = millis();
     bullets.add(new Bullet(mouseX, height - 200));   
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
         break;
      }
    }
    
  }
  if(killed == chickens.size())  flag = 4;
 }
  
  
}

class LevelOne{
  int currentMoment = 0, previousMoment = 0;
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
     bullets.add(new Bullet(mouseX, height - 160));   
  }
  // choose random alive chicken and drop it's egg
  if(millis() - eggTime > 6000){
      randomEgg = (int)random(0, chickens.size());
      eggTime = millis();
  }   
  chickens.get(randomEgg).dropEgg();
 
  for (int i = 1; i <= bullets.size()-1; i++) {
    Bullet b = bullets.get(i);
    b.display();
    if (b.offBullet()) {
      bullets.remove(i);
    }
    //else if (b.hitsChicken(chickenX, chickenY)) {
    //  bullets.remove(i);
    //  chickenX = -200;
    //}
  }
  
 }
  
  
}

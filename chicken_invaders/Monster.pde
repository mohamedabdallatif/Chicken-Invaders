class Monster{
   MonsterEgg[] eggs = new MonsterEgg[10];
   AdditionalBullets addBullets;
   Chickens[] killedChickens = new Chickens[25];
   PImage monster0 = loadImage("Monster0.png");
   PImage monster1 = loadImage("Monster1.png"); 
   float monsterSpeedX = 0, monsterSpeedY = 0;   
   int x = 100, y = 100, monsterSpeedTime = 0, monsterLife = 0, breakTime = -1, firstEggs = 0, winTime = 0;
   int InvaderX, InvaderY, nextImage = 0, lastPosX = 0, lastPosY = 0, chickensX = 0, chickensY = 0;
   boolean monsterDead = false;
   
   
   void display(){
     // change the speed and direction of ..    
    if(monsterSpeedTime - millis() <= 0){
       monsterSpeedTime = millis() + 2000;
       InvaderX = mouseX;
       InvaderY = mouseY;
       // to be in screen... (not be out of screen)
       if (x > width - 130)  x = width - 130;
       if (x < 130)  x = 130;
       if (y > height - 160)  y = height - 160;
       if (y < 160)  y = 160;
       monsterSpeedX = (abs(InvaderX - x) / 50);
       monsterSpeedY = (abs(InvaderY - y) / 50);
       if(InvaderX < x)  monsterSpeedX *= -1;
       if(InvaderY < y)  monsterSpeedY *= -1;

    }
    
    if (x > width - 130 || x < 130)  monsterSpeedX = 0;
    if (y > height - 160 || y < 160)  monsterSpeedY = 0;
    
       
    if(!monsterDead){
      if(invader.touchTheMonster((float)x, (float)y))   InvaderHit = true;
      if(millis() - nextImage > 200){
        image(monster0, x, y, 240, 300);
      }
      else image(monster1, x, y, 240, 300);  // if bullet shooted monster, display another image for 500 ms
      if(monsterLife == 1000){
        lastPosX = chickensX = x;
        lastPosY = chickensY = y;
        for (int i = 0; i < killedChickens.length; i++) {
            killedChickens[i] = new Chickens(chickensX, chickensY);
        }
        monsterLife += 100;    // take out from condition....
        winTime = millis();
      }
      
    }
    else{
      // drop Chickens....
     if(millis() - winTime < 4000){
       monsterKilledSound.play();
       for (Chickens i : killedChickens) {
         if(i.y > 0){
           i.update();
           i.display();
         }
       }
       image(smoke, lastPosX, lastPosY, 300, 300); 
     }
     else flag = 4;
  
    }
    
    x += monsterSpeedX;
    y += monsterSpeedY;
      
      //println(monsterSpeedTime);
      //println("X: " + x + " XI " + InvaderX + " XSpeed " + monsterSpeedX);
      //println("Y: " + y + " YI " + InvaderY + " YSpeed " + monsterSpeedY);
      //println(InvaderX);
      //println(InvaderY);
     
   }
     
  void displayMonsterEggs(){

    if (millis() - breakTime > 5000) {
      for (int i = 0; i < eggs.length; i++) {
        eggs[i] = new MonsterEgg((float)x, (float)y);
      }
      breakTime = millis();
       //println("done");
      firstEggs = 1;
    }
    else if(firstEggs == 1){
      for (MonsterEgg eggaia : eggs) {
         eggaia.update();
         eggaia.display();
      }
      // when i win, eggs killed me: solve it by this code
      if(monsterDead){
         for (MonsterEgg eggaya : eggs) {
           eggaya.y = 1000;
         }
      }
    }
      
  }
}



class MonsterEgg {
   float x, y, eggType;
   float speedX, speedY;
   
   MonsterEgg(float posX, float posY){
     x = posX;
     y = posY;
     speedX = random(-5, 6);
     speedY = random(1, 8);
     eggType = int(random(1, 3));
   }
   
   void update() {
      x += speedX;
      y += speedY;
    }
   
   void display() {
     if (eggType == 1)  image(wEgg, x, y, 25, 40);
     else  image(rEgg, x, y, 25, 40);
    if(x >= mouseX - 60 && x <= mouseX + 60 && y >= mouseY - 80 && y <= mouseY + 80) {
      InvaderHit = true;
      y = 1000;
    }
         
  }
}


class Chickens{
    float x, y, speedX, speedY;
    int type; 
    
    Chickens(float x, float y) {
      this.x = x;
      this.y = y;
      speedX = random(-5, 6);
      speedY = random(-5, 8);
      type = (int)random(1, 4);
    }

    void update() {
      x += speedX;
      y += speedY;
    }

  void display() {
    if(type == 1)  image(leg, x, y, 100, 40);
    else if(type == 2)  image(thigh, x, y, 100, 80);
    else  image(grilledChicken, x, y, 150, 100);
    // increase score....
    if(x >= mouseX - 60 && x <= mouseX + 60 && y >= mouseY - 80 && y <= mouseY + 80) {
      score += random(5, 12);
      y = -800; // don't display
    }
  }

}

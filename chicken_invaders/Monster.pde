class Monster{
   Egg monsterEgg = new Egg();
   PImage monster0 = loadImage("Monster0.png");
   PImage monster1 = loadImage("Monster0.png"); 
   int x = 200, y = 300, monsterSpeedX = 0, monsterSpeedY = 0, monsterSpeedTime = 0, InvaderX, InvaderY, firstEgg = 1;
   boolean monsterisHit = false;
   
   void display(){
     
     // change the speed and direction of ..    
    if(monsterSpeedTime - millis() <= 0){
       monsterSpeedTime = millis() + 2000;
       InvaderX = mouseX;
       InvaderY = mouseY;
       if (x > width - 130)  x = width - 130;
       if (x < 130)  x = 130;
       if (y > height - 160)  y = height - 160;
       if (y < 160)  y = 160;
       monsterSpeedX = (int)(abs(InvaderX - x) / 50);
       monsterSpeedY = (int)(abs(InvaderY - y) / 50);
       if(InvaderX < x)  monsterSpeedX *= -1;
       if(InvaderY < y)  monsterSpeedY *= -1;

    }
    
     if (x > width - 130 || x < 130)  monsterSpeedX = 0;
       if (y > height - 160 || y < 160)  monsterSpeedY = 0;
      image(monster0, x, y, 240, 300); 
      x += monsterSpeedX;
      y += monsterSpeedY;
      
      println(monsterSpeedTime);
      println("X: " + x + " XI " + InvaderX + " XSpeed " + monsterSpeedX);
      println("Y: " + y + " YI " + InvaderY + " YSpeed " + monsterSpeedY);
      //println(InvaderX);
      //println(InvaderY);
     
   }
   
   
   void displayMonsterEgg(){
     
     // choose random alive chicken and drop its egg
    if ((millis() - monsterEgg.breakTime > 1000 && monsterEgg.eggArrived == 1) || firstEgg == 1) {
      monsterEgg.create(x, y + 120);
      firstEgg = 0; // problem with first egg
    }  
     monsterEgg.display();
   }
}

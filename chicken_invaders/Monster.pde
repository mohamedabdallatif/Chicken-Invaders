class Monster{
   PImage monster0 = loadImage("Monster0.png");
   PImage monster1 = loadImage("Monster0.png"); 
   int x = 200, y = 300, monsterSpeedX = 0, monsterSpeedY = 0, monsterSpeedTime = 0, InvaderX, InvaderY;
   boolean monsterisHit = false;
   
   void display(){
     if (monster.x > width - 130 || monster.x < 130)  monsterSpeedX = 0;
       if (monster.y > height - 160 || monster.y < 160)  monsterSpeedY = 0;
      image(monster0, x, y, 240, 300); 
      x += monsterSpeedX;
      y += monsterSpeedY;
      
      println(monsterSpeedTime);
      println("X: " + x + " XI " + InvaderX + " XSpeed " + monsterSpeedX);
      println("Y: " + y + " YI " + InvaderY + " YSpeed " + monsterSpeedY);
      //println(InvaderX);
      //println(InvaderY);
     
   }
}

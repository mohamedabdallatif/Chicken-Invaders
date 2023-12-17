class Monster{
   PImage monster0 = loadImage("Monster0.png");
   PImage monster1 = loadImage("Monster0.png"); 
   int x = 200, y = 300, monsterSpeed = 0, monsterSpeedTime = 0;
   
   void display(){
      image(monster0, x , y, 250, 300); 
     // draw monster and move him 
    for (int i = 0; i <= chickens.size()-1; i++) {
      if (chickens.get(i).curX > chickens.get(i).x + 80 || chickens.get(i).curX < chickens.get(i).x)
          chickens.get(i).chSpd *= -1;
       chickens.get(i).display();
      }
      println(monsterSpeedTime);
      println(monsterSpeed);
     
     
   }
}

class Egg {
   float x, y;
   int eggType;
   int breakTime, egSpd = 4;
   PImage omlet = loadImage("Omlet.png");
   PImage usedEgg;
   
   void create(float posX, float posY){
     x = posX;
     y = posY;
     eggType = int(random(1, 3));
   }
   
   void display() {
     if (eggType == 1) usedEgg = wEgg;
     else usedEgg = rEgg;
     if (y < height - 35){
        image(usedEgg, x, y, 25, 40);
        breakTime = millis();
        y += egSpd; 
        if(x >= mouseX - 60 && x <= mouseX + 60 && y >= 700) {
          InvaderHit = true;
          y = 1000;
        }
     } else if (millis() - breakTime <= 2000){
         image(omlet, x, y, 75, 30);
     }
         
  }
}

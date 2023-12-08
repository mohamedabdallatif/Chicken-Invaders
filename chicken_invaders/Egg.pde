class Egg {
   float x, y;
   int eggType;
   int curTime, prevTime, egSpd = 4;
   PImage wEgg = loadImage("whiteEgg.png");
   PImage rEgg = loadImage("redEgg.png");
   PImage omlet = loadImage("Omlet.png");
   PImage showEgg;
   
   void creation(float posX, float posY){
     x = posX;
     y = posY;
     eggType = (int)random(1, 3); 

   }
   
   void display() {
     if(eggType == 1)   showEgg = wEgg;
     else   showEgg = rEgg;
     if(y < height - 35){
        image(showEgg, x, y, 25, 40);
        prevTime = millis();
        y += egSpd; 
     }else{
        curTime = millis();
        if(curTime - prevTime <= 2000)  
          image(omlet, x, y, 75, 30);
     } 
  }
}

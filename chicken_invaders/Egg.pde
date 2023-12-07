class Egg {
   float x, y;
   int curTime, prevTime, egSpd = 4;
   PImage wEgg = loadImage("whiteEgg.png");
   PImage rEgg = loadImage("redEgg.png");
   PImage omlet = loadImage("Omlet.png");
   
   public Egg(float xpos, float ypos) {
     this.x = xpos;
     this.y = ypos;
   }
 
   void display() {
     if(y < height - 35){
        image(wEgg, x, y, 25, 40);
        prevTime = millis();
        y += egSpd; 
     }else{
        curTime = millis();
        if(curTime - prevTime <= 2000)  
          image(omlet, x, y, 75, 30);
     } 
  }
}

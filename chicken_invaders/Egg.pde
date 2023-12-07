class Egg{
   int eggY = 30, currentTime, previousTime, EggSpeed = 4;
   float x, y;
   Egg(float x, float y) {
     this.x = x;
     this.y = y;
   }
 
   void display(){    
     if(y < height - 35){
        image(egg, x, y, 25, 40);
        previousTime = millis();
        y += EggSpeed; 
     }else{
        currentTime = millis();
        if(currentTime - previousTime <= 2000)  image(omlet, x, y, 75, 30);
        // timer
     } 
  }
  
  
}

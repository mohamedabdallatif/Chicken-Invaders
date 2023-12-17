class Chicken {
 Egg egg = new Egg();
 boolean isHit;
 float x, y, curX, curY, chSpd = 2, smokeTime = 0;
 PImage chicken = loadImage("chicken.png");
 PImage smoke = loadImage("smoke.png");
 
 public Chicken(float xpos, float ypos) {
   this.x = xpos;
   this.y = ypos;
   this.curX = xpos;
   this.curY = ypos;
   this.isHit = false;
   this.egg.create(x + 35, y + 60);
 }
 
 void dropEgg() {
    if(!isHit) 
      egg.display();
 }
 
 void display() {
    if (!isHit) {
     if(flag == 2) {
       this.curX += chSpd;
       image(chicken, this.curX, y, 70, 90);
     }
     else if(flag == 3) {
       this.curY += chSpd;
       image(chicken, x, this.curY, 70, 90);
     }
     smokeTime = millis();
   }
   else if(millis() - smokeTime < 1000)   image(smoke, this.curX, y, 90, 90);
 }
 
 //void displayMoveX() {
 //  if (!isHit) {
 //    this.curX += chSpd;
 //    image(chicken, this.curX, y, 70, 90);
 //    smokeTime = millis();
 //  }
 //  else if(millis() - smokeTime < 1000)   image(smoke, this.curX, y, 90, 90); 
 //}
 // void displayMoveY() {
 //  if (!isHit) {
 //    this.curY += chSpd;
 //    image(chicken, x, this.curY, 70, 90);
 //  }
 //}
}

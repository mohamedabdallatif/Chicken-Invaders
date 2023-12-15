class Chicken {
 Egg egg = new Egg();
 boolean isHit;
 float x, y, curX, chSpd = 2, curY, smokeTime = 0;
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
 
 void displayMoveX() {
   if (!isHit) {
     this.curX += chSpd;
     image(chicken, this.curX, y, 70, 90);
     smokeTime = millis();
   }
   else if(millis() - smokeTime < 2000)   image(smoke, this.curX, y, 90, 90); 
 }
  void displayMoveY() {
   if (!isHit) {
     this.curY += chSpd;
     image(chicken, x, this.curY, 70, 90);
   }
 }
}

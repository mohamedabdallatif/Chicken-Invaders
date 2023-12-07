class Chicken {
 Egg egg;
 boolean isHit = false;
 float x, y, curX, chSpd = 2.5;
 PImage chicken = loadImage("chicken.png");
 
 public Chicken(float xpos, float ypos) {
   this.x = xpos;
   this.y = ypos;
   this.curX = xpos;
   this.egg = new Egg(xpos, ypos);
 }

 void display() {
   if (!isHit) {
     this.curX += chSpd;
     image(chicken, this.curX, y, 70, 90);
   }
 }
 
 void hit() {
   isHit = true;
 }
 
 void dropEgg() {
    //egg.x = curX;
    egg.display();
 }
}

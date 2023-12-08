class Chicken {
 Egg egg = new Egg();
 boolean isHit = false;
 float x, y, curX, chSpd = 2;
 PImage chicken = loadImage("chicken.png");
 
 public Chicken(float xpos, float ypos) {
   this.x = xpos;
   this.y = ypos;
   this.curX = xpos;
   this.egg.create(x + 35, y + 60);
 }
 
 void dropEgg() {
    egg.display();
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
}

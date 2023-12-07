class Bullet {
 int buSpd = 10;
 float x, y;
 PImage bullet = loadImage("Bullet.png");

 public Bullet(float xpos, float ypos) {
   this.x = xpos;
   this.y = ypos;
 }

 void display() {
   y -= buSpd;
   image(bullet, x, y, 10, 80);
 }

 boolean offBullet() {
   return y < 0;
 }
 
 boolean hitsChicken(float targetX, float targetY) {
   return dist(x, y, targetX, targetY) < 50;
 }
}

class Bullet {
 float x, y;

 Bullet(float x, float y) {
   this.x = x;
   this.y = y;
 }

 void display() {
   y -= speed;
   image(bullet, x, y, 16, 125);
 }

 boolean offScreen() {
   return y < 0;
 }
 
 boolean hitsChicken(float targetX, float targetY) {
   return dist(x, y, targetX, targetY) < 150;
 }
}

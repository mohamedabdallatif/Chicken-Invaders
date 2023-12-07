class Bullet {
 float x, y;

 Bullet(float x, float y) {
   this.x = x;
   this.y = y;
 }

 void display() {
   y -= speed;
   image(bullet, x, y, 10, 80);
 }

 boolean offBullet() {
   return y < 0;
 }
 
 boolean hitsChicken(float targetX, float targetY) {
   return dist(x, y, targetX, targetY) < 50;
 }
}

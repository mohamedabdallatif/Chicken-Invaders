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
}

class Chicken {
 float x, y, posX, chSpeed = 2.5;
 boolean isHit = false;
 Chicken(float x, float y) {
   this.x = x;
   this.y = y;
   this.posX = x;
 }

 void display() {
   if (!isHit) {
     image(chicken, this.posX, y, 70, 90);
   }
 }

 void increaseSpeed(){
   this.posX += chSpeed;
 }
  void hit() {
   isHit = true;
 }
}

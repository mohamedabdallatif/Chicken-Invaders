class Bullet {
 int buSpd = 10;
 float x, y, type, xx = 1200, yy = 900;
 PImage bullet = loadImage("Bullet.png");
 PImage rocketX = loadImage("Rocket.png");
 public Bullet(float xpos, float ypos, int type) {
   this.x = xpos;
   this.y = ypos;
   this.type = type;
   
 }

 void display() {
   if(type == 0){
      y -= buSpd;     
      image(bullet, x, y, 8, 70);     
   }
   if(type == 1 && score > 50){
     xx -= buSpd;
     yy -= buSpd;
     image(rocketX, xx, yy, 200, 200);
     if(xx == 600 && yy == 300){
        nowT = millis();
        y = -50;
        killed = chSize;
     }
   }
 }

 boolean bulletOutScreen() {
   return y < 0;
 }
 
 boolean hitChicken(float targetX, float targetY) {
   return dist(x, y, targetX, targetY) < 50;
 }
}

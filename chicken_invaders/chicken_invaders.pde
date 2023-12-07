PImage background, invador, bullet;
float speed = 10;
float bulletY = 0; // Y position of the bullet
boolean isFiring = false; // Whether the bullet is currently moving
float bulletX = 0; // X position of the bullet

void setup() {
 size(1200, 800);
 smooth();
 imageMode(CENTER);
 background = loadImage("Space.png");
 invador = loadImage("Invador.png");
 bullet = loadImage("Bullet.png");
}

void draw() {
 image(background, width/2, height/2);
 image(invador, mouseX, height - 100, 120, 200);
 if (isFiring) {
   bulletY -= speed;
   image(bullet, bulletX, bulletY, 20, 160);
   if (bulletY < 0) {
     isFiring = false;
   }
 } else if (mousePressed) {
   isFiring = true;
   bulletX = mouseX;
   bulletY = height - 160;
 }
}

PImage background, invador, bullet, chicken;
float speed = 15;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
int chickenX = 600, chickenY = 200;

void setup() {
 size(1200, 800);
 smooth();
 imageMode(CENTER);
 background = loadImage("Space.png");
 invador = loadImage("Invador.png");
 bullet = loadImage("Bullet.png");
 chicken = loadImage("Chicken.png");
}

void draw() {
 image(background, width/2, height/2);
 image(invador, mouseX, height - 100, 120, 200);
 image(chicken, chickenX, chickenY, 240, 300);
 for (int i = 0; i <= bullets.size()-1; i++) {
   Bullet b = bullets.get(i);
   b.display();
   if (b.offScreen()) {
     bullets.remove(i);
   }
   else if (b.hitsChicken(chickenX, chickenY)) {
     bullets.remove(i);
     chickenX = -200;
   }
 }
}

void mousePressed() {
 bullets.add(new Bullet(mouseX, height - 160));
}

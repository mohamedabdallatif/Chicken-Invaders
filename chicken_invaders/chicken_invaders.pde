PImage background, invador, bullet, chicken;
float speed = 15;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();

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
 
 for (int i = 0; i <= bullets.size()-1; i++) {
   Bullet b = bullets.get(i);
   b.display();
   if (b.offScreen()) {
     bullets.remove(i);
   }
 }
}

void mousePressed() {
 bullets.add(new Bullet(mouseX, height - 160));
}

PImage background, invador, bullet, chicken, egg, omlet;
float speed = 10, xx = 50;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
Egg egg1 = new Egg(30, 30);
Invador invadorx = new Invador();
Chicken[] chickens = new Chicken[50];

void setup() {
   size(1200, 900);
   smooth();
   imageMode(CENTER);
   background = loadImage("Space.png");
   invador = loadImage("Invador.png");
   bullet = loadImage("Bullet.png");
   chicken = loadImage("chicken.png");
   egg = loadImage("Egg1.png");
   omlet = loadImage("Omlet.png");
    int k = 0;
 for(int i = 0; i < 1200; i += 100){
   for(int j = 0; j < 300; j += 100){
     chickens[k++] = new Chicken(i + 20, j + 50);
   }  
 }
}

void draw() {
 imageMode(CENTER);
 image(background, width/2, height/2);
 invadorx.display();
 imageMode(CORNER);
 egg1.display();

 
 for(int i = 0; i < 33; i++){
       if(chickens[i].posX > chickens[i].x + 100 || chickens[i].posX < chickens[i].x)  chickens[i].chSpeed *= -1;
       chickens[i].increaseSpeed();
       chickens[i].display();

 }
 
 for (int i = 0; i <= bullets.size()-1; i++) {
   Bullet b = bullets.get(i);
   b.display();
   if (b.offBullet()) {
     bullets.remove(i);
   }
   //else if (b.hitsChicken(chickenX, chickenY)) {
   //  bullets.remove(i);
   //  chickenX = -200;
   //}
 }
}

void mousePressed() {
 bullets.add(new Bullet(mouseX, height - 160));
}

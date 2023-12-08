PInvader invader;
PImage background;
ArrayList<Chicken> chickens = new ArrayList<Chicken>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
int eggTime = 0, randomEgg = 0;

void setup() {
  size(1200, 900);
  smooth();
  imageMode(CENTER);
  background = loadImage("Space.jpg");
   invader = new PInvader("Invador.png");
   for (int i = 0; i < 1100; i += 100) {
    for (int j = 0; j < 300; j += 100) {
      Chicken newChicken = new Chicken(i + 20, j + 20);
      newChicken.createEgg();
      chickens.add(newChicken);
    }
  }
}

void draw() {
  imageMode(CENTER);
  image(background, width/2, height/2);
  invader.display();
  imageMode(CORNER);

  for (int i = 0; i <= chickens.size()-1; i++) {
    if (chickens.get(i).curX > chickens.get(i).x + 100 || chickens.get(i).curX < chickens.get(i).x)  
          chickens.get(i).chSpd *= -1;
    chickens.get(i).display();
  }
  
  if(millis() - eggTime > 6000){
      randomEgg = (int)random(0, chickens.size());
      eggTime = millis();
  }   
  chickens.get(randomEgg).egg.display();
 
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

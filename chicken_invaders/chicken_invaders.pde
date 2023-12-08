PInvader invader;
PImage background;
PImage sound;

PImage mute;
  PFont font;
  PFont font60;
ArrayList<Chicken> chickens = new ArrayList<Chicken>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
int eggTime = 0, randomEgg = 0;
int flag=0;
boolean isMute = false;
start_page start = new start_page();
Guide guide = new Guide();
void setup() {
  size(1200, 900);
   start.play_sound();
  smooth();
  imageMode(CENTER);
  background = loadImage("Space.jpg");
  invader = new PInvader("Invador.png");
  font = loadFont("TimesNewRomanPS-BoldItalicMT-48.vlw");
  font60=loadFont("TimesNewRomanPS-BoldItalicMT-60.vlw");
  for (int i = 0; i < 1100; i += 100) {
   for (int j = 0; j < 300; j += 100) {
    Chicken newChicken = new Chicken(i + 20, j + 20);
    chickens.add(newChicken);
   }
 }
}

void draw() {
  if(flag==0){
    start.draw_start_page();
  }
  else if(flag==1){
   guide.displayGuide();
  }
  else if(flag==2){
  imageMode(CENTER);
  image(background, width/2, height/2);
  invader.display();
  imageMode(CORNER);

  // draw chickens and move them 
  for (int i = 0; i <= chickens.size()-1; i++) {
    if (chickens.get(i).curX > chickens.get(i).x + 80 || chickens.get(i).curX < chickens.get(i).x)  
          chickens.get(i).chSpd *= -1;
    chickens.get(i).display();
  }
  
  // choose random alive chicken and drop it's egg
  if(millis() - eggTime > 6000){
      randomEgg = (int)random(0, chickens.size());
      eggTime = millis();
  }   
  chickens.get(randomEgg).dropEgg();
 
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
}

void mousePressed() {
  bullets.add(new Bullet(mouseX, height - 160));
}

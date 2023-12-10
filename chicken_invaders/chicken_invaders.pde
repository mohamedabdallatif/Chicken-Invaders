import ddf.minim.*;
Minim minim;
PInvader invader;
AudioPlayer clickSound;
Guide guide;
StartPage start;
LevelOne levelOne;
EndLevel endLevel;
PImage background;
boolean InvadorHit = false;
int flag = 0;
PFont font, font60, titleFont, titleFontX;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Chicken> chickens = new ArrayList<Chicken>();

void setup() {
  size(1200, 900);
  minim = new Minim(this);
  // loading sounds and fonts
  clickSound = minim.loadFile("click.wav");
  background = loadImage("Space.jpg");
  invader = new PInvader("Invador.png");
  font = loadFont("TimesNewRomanPS-BoldItalicMT-48.vlw");
  font60 = loadFont("TimesNewRomanPS-BoldItalicMT-60.vlw");
  titleFont = loadFont("ImprintMT-Shadow-70.vlw");
  titleFontX = loadFont("NiagaraEngraved-Reg-60.vlw");
  // initialize Game Objects
  init();
  // prepare image properties for background
  smooth();
  imageMode(CENTER);
}

void init() {
    // initailze all pages
    guide = new Guide();
    start = new StartPage();
    levelOne = new LevelOne();
    endLevel = new EndLevel();
    // make chickens
    for (int i = 0; i < 1100; i += 100) {
     for (int j = 0; j < 300; j += 100) {
      Chicken newChicken = new Chicken(i + 20, j + 20);
      chickens.add(newChicken);
     }
    }
}

void draw() {
  switch(flag) {
    case 0:
      start.draw_start_page();
      break;
    case 1:
      guide.displayGuide();
      break;
    case 2:
      levelOne.DrawLevelOne();
      break;
    case 3:
      endLevel.display();
      break;
  }
}

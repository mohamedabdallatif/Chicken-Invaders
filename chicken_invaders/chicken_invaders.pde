import ddf.minim.*;
Minim minim;
PInvader invader;
AudioPlayer clickSound, screemChicken, killedInv, explosion;
Guide guide;
StartPage start;
AllLevels allLevels;
int flag = 0, score = 0, killed = 0, chSize = 0, nowT = 0;
boolean InvaderHit;
PFont font, font60, titleFont, titleFontX, nextLevelButton, levelName;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Chicken> chickens = new ArrayList<Chicken>();

void setup() {
  size(1200, 900);
  minim = new Minim(this);
  // loading sounds and fonts
  clickSound = minim.loadFile("click.wav");
  screemChicken = minim.loadFile("chicken_screeming.mp3");
  explosion = minim.loadFile("explosion.mp3");
  invader = new PInvader("Invader.png");
  font = loadFont("TimesNewRomanPS-BoldItalicMT-48.vlw");
  font60 = loadFont("TimesNewRomanPS-BoldItalicMT-60.vlw");
  titleFont = loadFont("ImprintMT-Shadow-70.vlw");
  titleFontX = loadFont("NiagaraEngraved-Reg-60.vlw");
  nextLevelButton = loadFont("AgencyFB-Reg-48.vlw");
  levelName = loadFont("AgencyFB-Reg-48.vlw");
  // initialize Game Objects
  guide = new Guide();
  start = new StartPage();
  allLevels = new AllLevels();
  // prepare battle field
  InvaderHit = false;
  buildChickens(0);
  // prepare image properties for background
  smooth();
  imageMode(CENTER);
}

void buildChickens(int factor) {
  for (int i = 0; i < 1100; i += 100) {
    for (int j = 0; j < 400 + factor; j += 100) {
      Chicken newChicken = new Chicken(i + 20, j + 100);
      chickens.add(newChicken);
    }
  } 
  chSize = chickens.size();
}

void draw() {
  switch(flag) {
    case 0:
      start.drawStartPage();
      break;
    case 1:
      guide.displayGuide();
      break;
    case 2:
      allLevels.displayLevelOne();
      break;
    case 3:
      allLevels.displayEndLevel();
      break;
    case 4:
      allLevels.displayWinnerLevel();
      break;
    case 5:
      allLevels.displayLevelTwo();
      break;
  }
}

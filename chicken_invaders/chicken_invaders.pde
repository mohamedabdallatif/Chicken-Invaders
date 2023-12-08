PInvader invader;
PImage background;
PImage sound;
import ddf.minim.*;
Minim minim;
AudioPlayer player, playerX;
PImage mute;
PFont font, font60, titleFont, titleFontX;
ArrayList<Chicken> chickens = new ArrayList<Chicken>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
int eggTime = 0, randomEgg = 0;
int flag=0;
boolean isMute = false;
start_page start = new start_page();
Guide guide = new Guide();
LevelOne levelOne = new LevelOne();
void setup() {
  size(1200, 900);
  minim = new Minim(this);
  player = minim.loadFile("sound.mp3");
  playerX = minim.loadFile("click.wav");
  //player.play();
  smooth();
  imageMode(CENTER);
  background = loadImage("Space.jpg");
  invader = new PInvader("Invador.png");
  font = loadFont("TimesNewRomanPS-BoldItalicMT-48.vlw");
  font60 = loadFont("TimesNewRomanPS-BoldItalicMT-60.vlw");
  titleFont = loadFont("ImprintMT-Shadow-70.vlw");
  titleFontX = loadFont("NiagaraEngraved-Reg-60.vlw");

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
    levelOne.DrawLevelOne();
  }
}

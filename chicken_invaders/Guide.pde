class Guide{
  PFont font;
  String TITLE = "CHICKEN INVADORS";
  String Instructions = "1- Invador Should kill all Chickens. 2- If Egg Hit the Invador, it will be destroyed.";
  String Inst3 = "3- If the score is (...) then LEVEL UP!. ....";
  
  void displayBack() {
    imageMode(CENTER);
    background = loadImage("Space.png");
    image(background, width/2, height/2);
  }
  
  void displayInstructions(){
     font = loadFont("Algerian-80.vlw");
     textFont(font);
     text(TITLE, 280, 100);
     font = loadFont("Algerian-40.vlw");
     textFont(font);
     text(Instructions, 100, 200, 800, 250);
     text(Inst3, 100, 330);
  }
}

class Guide{
  String TITLE = "CHICKEN INVADORS";
  String Instructions = "1- Invador Should kill all Chickens. 2- If Egg Hit the Invador, it will be destroyed.";
  String Inst3 = "3- If the score is (...) then LEVEL UP!. ....";
  void displayGuide() {
    
    imageMode(CENTER);
    background = loadImage("Space.jpg");
    image(background, width/2, height/2);
     textFont(font);
     text(TITLE, 280, 100);
     textFont(font);
     text(Instructions, 100, 200, 800, 250);
     text(Inst3, 100, 330);
  }
}

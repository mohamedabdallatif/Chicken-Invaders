class WinnerLevel{
  int[] xPoints = {31, 40, 62, 43, 51, 31, 11, 19, 0, 22}; 
  int[] yPoints = {0, 22, 22, 38, 60, 46, 60, 38, 22, 22}; 

  PImage winnerBackground = loadImage("WinLevelBackground.jpg");
  
  void displayWinnerLevel(){
    imageMode(CENTER);
    image(winnerBackground, width/2, height/2);
    textFont(levelName);
    textSize(70);
    text("Level 1",535, 450);
    fill(255);
    textFont(titleFontX);
    textSize(50);
    text(str(score),600, 615);
    
    if (mouseX > 515 && mouseX < 690 && mouseY > 660 && mouseY < 710) {
      fill(225, 80, 80);
      if(mousePressed) {
        clickSound.play();
        exit();
      }
     } 
    else   fill(255, 120, 120);
    rect(515, 660, 175, 50, 50, 50, 50, 50);
    fill(255);
    textFont(nextLevelButton);
    textSize(40);
    text("Next Level",540, 700);
    textFont(font60);
    if (mouseX > 750 && mouseX < 820 && mouseY > 615 && mouseY < 685) {
      fill(200, 50, 0); 
      ellipse(785, 650, 70, 70);
      textSize(25);
      fill(255); 
      text("EXIT",755, 657);
      if(mousePressed) {
        clickSound.play();
        exit();
      }
     } 
     else{
       fill(255, 0, 0);
       ellipse(785, 650, 60, 60); 
       textSize(20);
       fill(255);
       text("EXIT",760, 657);
     }
     fill(230, 240, 40);
     if(score < 40)  drawStar(570, 480);
     else if(score < 70){
        drawStar(530, 480);
        drawStar(610, 480);
     }
     else{
        drawStar(490, 480);
        drawStar(570, 480);
        drawStar(650, 480);
     }
  }
  void drawStar(int posx, int posy) {
    beginShape();
    for (int i = 0; i < xPoints.length; i++) {
      vertex(xPoints[i] + posx, yPoints[i] + posy);
    }
    endShape(CLOSE);
  }
}

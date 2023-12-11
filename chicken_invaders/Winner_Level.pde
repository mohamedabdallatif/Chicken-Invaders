class WinnerLevel{
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
    text("THE SCORE",560, 615);
    
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
     
     
    
  }
}

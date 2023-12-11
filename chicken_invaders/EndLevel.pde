class EndLevel{
  PImage endLevelBackground = loadImage("EndLevelBackground.jpg");
  
  void displayEndLevel(){
    imageMode(CENTER);
    image(endLevelBackground, width/2, height/2);
    // play again button
    if (mouseX > 460 && mouseX < 660 && mouseY > 480 && mouseY < 560) {
      fill(255, 165, 0);
      // if user click on this button
      if(mousePressed) {
        killedInv = minim.loadFile("KilledInvader.wav");
        clickSound = minim.loadFile("click.wav");
        clickSound.play();
        InvaderHit = false;
        chickens.clear();
        bullets.clear();
        buildChickens();
        flag = 2;
      }
    } 
    else  fill(255, 215, 0);
    rect(460, 480, 215, 80, 50, 50, 50, 50);
    fill(0);
    textSize(70);
    text("PLAY AGAIN",480, 543);
    
    // exit button
    if (mouseX > 460 && mouseX < 660 && mouseY > 580 && mouseY < 660) {
      fill(200, 50, 0); 
      if(mousePressed) {
        clickSound.play();
        exit();
      }
    } 
    else  fill(255, 0, 0);
    rect(500, 580, 120, 80, 50, 50, 50, 50);
    fill(0);
    textSize(70);
    text("EXIT",530, 645);
    
    
  }
}

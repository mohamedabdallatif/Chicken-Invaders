class EndLevel{
  PImage endLevelBackground = loadImage("EndLevelBackground.jpg");
  
  void display(){
    imageMode(CENTER);
    image(endLevelBackground, width/2, height/2, 800, 600);
    if (mouseX > 460 && mouseX < 660 && mouseY > 480 && mouseY < 560) {
      fill(255, 165, 0);
      if(mousePressed){
        flag = 2;
        clickSound.play();
      }
    } 
    else  fill(255, 215, 0);
    rect(460, 480, 215, 80, 50, 50, 50, 50);
    fill(0);
    textSize(70);
    text("PLAY AGAIN",480, 543);
    
    if (mouseX > 460 && mouseX < 660 && mouseY > 580 && mouseY < 660) {
      fill(200, 50, 0); 
      if(mousePressed){
        exit();
        clickSound.play();
      }
    } 
    else  fill(255, 0, 0);
    rect(500, 580, 120, 80, 50, 50, 50, 50);
    fill(0);
    textSize(70);
    text("EXIT",530, 645);
    
    
  }
}

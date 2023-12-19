class AdditionalBullets{
int[] X = {0, 6, 0, 6, 0, -6, 0, -6};
int[] Y = {-31, -19, 0, 19, 31, 19, 0, -19};

float x = 0, y = 0, speed, angle = 0, chickenPosX, chickenPosY;
int type = 1; 
  
  AdditionalBullets(float posX, float posY){
    speed = random(4, 10); 
    this.chickenPosX = posX;
    this.chickenPosY = posY;
    type = (int)random(1, 3);
    x = posX;
  }

  
  void display() {
    y += speed;
    angle += 0.1;
    if(type == 1)  fill(255, 255, 0); // increase bullets..
    else  fill(255, 0, 0);  // decrease bullets..
    pushMatrix();
      translate(chickenPosX, chickenPosY);
        pushMatrix();
          translate(0, y);
          rotate(angle);
          beginShape();
          for(int i = 0; i < 8; i++)
            vertex(X[i], Y[i]);
          endShape(CLOSE);
        popMatrix();
    popMatrix();
    
    
    switch(currentLevel){
      case 1: 
          if(x >= mouseX - 60 && x <= mouseX + 60 && y >= height - 400) {  // slow hardware, make it 400 instead of 100
            //println(x + "  " + y + "   " + mouseX);
            y = -800;
            if(type == 1 && bulletsNumber < 5)  bulletsNumber++;
            else if(type == 2 && bulletsNumber > 1)  bulletsNumber--;
            
          }
        break;
      case 2:
      case 3:
        if(x >= mouseX - 80 && x <= mouseX + 80 && y >= mouseY - 290 && y <= mouseY + 290) {   // slow hardware, make it 290 instead of 90 Edit it if you want
          println(x + "  " + y + "   " + mouseX);
          y = -800;
          if(type == 1 && bulletsNumber < 5)  bulletsNumber++;
          else if(type == 2 && bulletsNumber > 1)  bulletsNumber--;
            
        }
    }
    if(y > 900)  y = -800;
    
  }

}


class GrilledChicken{

 float x, y, speedX, speedY;
 int type; 
    
    GrilledChicken(float x, float y) {
      this.x = x;
      this.y = y;
      speedX = random(-5, 6);
      speedY = random(5, 12);
      type = (int)random(1, 4);
    }

    void update() {
      x += speedX;
      y += speedY;
    }

  void display() {
    if(type == 1)  image(leg, x, y, 80, 30);
    else if(type == 2)  image(thigh, x, y, 80, 65);
    else  image(grilledChicken, x, y, 100, 65);
    // increase score....
    switch(flag){      // depending on the invador level...
      case 2:
        if(x >= mouseX - 60 && x <= mouseX + 60 && y >= height - 200) {
          score += random(5, 9);
          y = -800; // don't display
        }
        break;
      case 3:
        if(x >= mouseX - 60 && x <= mouseX + 60 && y >= mouseY - 80 && y <= mouseY + 80) {
          score += random(5, 9);
          y = -800; // don't display
        }
        break;
    
    
    }
  }


}



class EndAll{
  
  void display(){
    image(goodBye, width / 2, height / 2);
    if (mouseX > 200 && mouseX < 320 && mouseY > 800 && mouseY < 880) {
    fill(200, 50, 0); 
    if (mousePressed) {
      clickSound.play();
      exit();
    }
    } else  fill(255, 0, 0);
    rect(200, 800, 120, 80, 50, 50, 50, 50);
    fill(0);
    textFont(titleFontX);
    textSize(70);
    text("EXIT", 230, 860);  
    
  }
  
}



class start_page{
void draw_start_page(){
   PImage start_page_background;
 start_page_background = loadImage("StartBackground.jpg");
 sound = loadImage("sound.png");
 mute = loadImage("mute.png");
 image(start_page_background, width/2, height/2);
    //start game button
    fill(18,153,175);
    stroke(18,153,170);
    ellipse(585,500,310,90);
    fill(255,255,255);
    textSize(35);
    textFont(font);
    text("Start Game",480,510);
    //guide button
    fill(18,153,175);
    stroke(18,153,170);
    ellipse(585,610,310,90);
    fill(255,255,255);
    textSize(35);
    textFont(font);
    text("Guide",520,625);
    // sound button
    if(isMute){
    image(mute,50,50,60,60);
    }
    else{
    image(sound,50,50,60,60);
    }
    if(mouseX>=460 && mouseY>=450 && mouseX<=710 && mouseY<=530){
      fill(18,153,175);
      stroke(18,153,170);
      ellipse(585,490,350,110);
      fill(255,255,255);
      textFont(font60);
      text("Start Game",450,510);
      if(mousePressed==true)
    flag = 2;
    }
   if(mouseX>=460 && mouseY>=550 && mouseX<=710 && mouseY<=630){
      fill(18,153,175);
      stroke(18,153,170);
      ellipse(585,610,350,100);
      fill(255,255,255);
      textFont(font60);
      text("Guide",510,630);
      if(mousePressed==true)
    flag = 1;
    }
    if(mouseX>=50 && mouseY>=50 && mouseX<=110 && mouseY<=110){
      if(mousePressed){
     isMute= !isMute;
     if(isMute){
       player.pause();
     }
     else{
      player.play();
     }
      }
    }
   }
  
}

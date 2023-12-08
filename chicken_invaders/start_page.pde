
class start_page{
void draw_start_page(){
   PImage start_page_background;
 start_page_background = loadImage("StartBackground.jpg");
 image(start_page_background, width/2, height/2);
    //start game button
    fill(18,153,175);
    stroke(18,153,170);
    ellipse(585,490,250,80);
    fill(255,255,255);
    textSize(35);
    text("Start Game",500,500);
    //guide button
    fill(18,153,175);
    stroke(18,153,170);
    ellipse(585,590,250,80);
    fill(255,255,255);
    textSize(35);
    text("Guide",535,600);
    if(mouseX>=460 && mouseY>=450 && mouseX<=710 && mouseY<=530){
      if(mousePressed==true)
    flag = 1;
    }
}
}

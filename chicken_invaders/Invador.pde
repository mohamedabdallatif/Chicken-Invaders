class Invador{
 void display(){
    if(mouseX > 60 && mouseX < width - 60){
       image(invador, mouseX, height - 100, 120, 200);
     }
     else if(mouseX <= 60){
       image(invador, 60, height - 100, 120, 200);
     }
     else{
       image(invador, width - 60, height -100, 120, 200);
     }  
 }
  
}

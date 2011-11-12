PImage btn;
PImage btn2;
void setup(){
  size(800, 600); 
  btn = loadImage("back.png");
  btn2 = loadImage("next.png");
}

void draw(){
  
  background(255);
   arrowButton(btn, 100, 100, 200, 100);
   arrowButton(btn2, 200, 100, 200, 100);
   
}

//method draws image of button to the screen
public void arrowButton(PImage btn, int x, int y, int buttonWidth, int buttonHeight){
   
   image(btn, x, y, buttonWidth, buttonHeight);
}

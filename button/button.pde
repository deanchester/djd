
//method draws image of button to the screen
public void arrowButton(String img, int x, int y, int buttonWidth, int buttonHeight){
   PImage btn = loadImage(img);
   image(btn, x, y, buttonWidth, buttonHeight);
}

public class Write
{
  PFont heading;
  PFont regular;
  Write()
  {
    heading = loadFont("myriad.vlw");
    regular = loadFont("myriad.vlw");
  }
  
  void h_text(String word, float x, float y)
  {
    textFont(heading, 28); 
    text(word, x, y);
  }
  
  void r_text(String word, float x, float y)
  {
    textFont(regular, 16); 
    text(word, x, y);
  }
}

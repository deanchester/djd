public class ColourArray
{
  public color[] colours = new color[100];
  ColourArray()
  {
    PImage myImage = loadImage("tape.png");
    image(myImage, 0, 0);
    loadPixels();
    int pixelPos = 0;
    for (int i = 0; i < colours.length; i++)
    {
      colours[i] = pixels[i];
      pixelPos += 32;
    }
    background(pixels[colours.length+1]);
  }
  public color randomColour()
  {
    return(colours[int(random(colours.length))]);
  }
}


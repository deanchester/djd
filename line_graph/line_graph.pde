/*
  Line Graph Class
  Date: 27/10/11
  
  A class for creating fully customizable line graphs.
*/

//Example Usage
void setup()
{
  size(800,600,JAVA2D);
  smooth();
  background(0); 
}
void draw()
{
  background(0);
  
  //Declare 2 arrays of data.
  String[] xData = {"Dan","Dean","Joe","Stuff","Processing","More"};
  float[] yData = {4.6,4.5,4.8,5.9,6.9,7.6};
  
  //Create a new instance of the graph
  Line_Graph graph = new Line_Graph(xData,yData);
  //Call the draw method with the following parameters:
  //(float x,float y,float xAxisLength,float yAxisLength,float yIntervals,int r,int g,int b,boolean filled)
  graph.draw_graph(60,100,700,400,20,0,68,204,true);
}

//Class Definitions
public class Line_Graph
{
  String[] xData;
  float[] yData;
  
  Line_Graph(String[] a_xData, float[] a_yData)
  {
    xData = a_xData;
    yData = a_yData;
  }
  
  //A method to return the highest value from a float array.
  //Used to determine the axes scale.
  private float highest_value(float[] data)
  {
    float tempHighest;
    tempHighest = data[0];
    for(int i=1;i<data.length;i++)
    {
      if(data[i]>tempHighest)
      {
        tempHighest = data[i];
      } 
    }
    return tempHighest;
  }
  
  public void draw_graph(float x,float y,float xLength,float yLength, float yInt, int r, int g, int b, boolean filled)
  {
     PFont font = loadFont("calibria.vlw");
     textFont(font,14);
    
     float yPos = 0;
     float xPos = 0;
     
     stroke(40);
     fill(120);
     
     strokeWeight(1);
     
     for(int i=0;i<yInt+1;i++)
     {
       //Draw the y axis guide lines depending on the number of intervals
       //and the highest item of data.
       yPos = (y+yLength)-yLength*(i/yInt);
       line(x-5,yPos,x+xLength-1-(1/float(xData.length))*xLength,yPos);
       //Write the value of the line.
       text(highest_value(yData)*(i/yInt),x-45,yPos+6);
     }
     
     for(int i=0;i<xData.length;i++)
     {
       //Write out the x axis labels.
       xPos = x+xLength*(float(i)/xData.length);
       text(xData[i],xPos-((xData[i].length()*3)),y+yLength+20);
     }
     strokeWeight(3);
     ellipseMode(CENTER);
     fill(r,g,b,255);
     stroke(r,g,b);
     
     //Start creating the graph shape.
     beginShape();
     
     //Create an initial point at 0,0  so that the graph fills correctly.
     vertex(x,y+yLength);
     
     //Loop through the rest of the data plotting it out.
     for(int i=0;i<xData.length;i++)
     {
       float xPlot = map(i,0,xData.length,x,x+xLength);
       float yPlot = map(yData[i],0,highest_value(yData),y+yLength,y);
       vertex(xPlot,yPlot);
       
       //Create a point for a visual reference.
       ellipse(xPlot,yPlot,3,3);
     }
     
     //Determine whether the graph should be filled or just
     //use a single line.
     if(filled)
     {
       strokeWeight(0);
       fill(r,g,b,50);
     }else{
       strokeWeight(2);
       stroke(r,g,b);
       noFill();
     }
     
     //Connect the graph back to the x axis so that the shape fills correctly
     xPos = x+xLength*(float(xData.length-1)/xData.length);
     vertex(xPos,y+yLength);
     
     //Finish the shape connecting back to the original shape.
     endShape(CLOSE);
     
     //Reset the fill and stroke to draw the axis over the data
     strokeWeight(2);
     stroke(80);
     fill(120);
     
     line(x,y+yLength,x+xLength-(1/float(xData.length))*xLength,y+yLength);//X Axis
     line(x,y+yLength,x,y);//Y Axis
  }
}

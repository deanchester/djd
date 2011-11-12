ColourArray colourSet;
color colours[];
Write write;

void setup()
{
  size(800,700,JAVA2D);
  smooth();
  background(255);
  initialise();
  float data[] = {4,3,5,3};
  PieChart chart = new PieChart(data);
  chart.draw(width/2,height/2-60,250,250);
  PImage ukMap = loadImage("images/uk.png");
  PImage answer = loadImage("images/answer.png");
  PImage age = loadImage("images/age.png");
  PImage gender = loadImage("images/gender.png");
  PImage social_class = loadImage("images/class.png");
  PImage display = loadImage("images/display.png");
  PImage next = loadImage("images/next.png");
  PImage back = loadImage("images/back.png");
  
  fill(255);
  ellipseMode(CENTER);
  rectMode(CENTER);
  ellipse(width/2,height/2-60,480,480);
  image(ukMap,(width/2)-130,140-60);
  
  image(gender,width/2-180,607);
  image(age,width/2-64,607);
  image(social_class,width/2+52,607);
  
  image(answer,width/2-200,550);
  chart.draw(595,598,40,40);
  fill(49,49,49);
  
  //Draw in the display box and value.
  imageMode(CENTER);
  image(display,width/2,height/2-60);
  imageMode(CORNER);
  write.h_text("34%",width/2-20,height/2-50);
  //End Display Draw
  
  //The Question
  write.h_text("Q1 Which of the following concern you at present?",20,30);
  
  //The Answer
  write.h_text("Terrorism",width/2-170,610);
  
  //Next Arrow
  image(next,620,545);
  
  //Back Arrow
  image(back,130,545);
}

void draw()
{
  
}

void initialise()
{
  colourSet = new ColourArray();
  colours = colourSet.colours;
  write = new Write();
}

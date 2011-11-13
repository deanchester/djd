ColourArray colourSet;
color colours[];
Write write;
BBox backnNext[] = new BBox[2];
float arclength = 0;
float theta = 0;

int qCount=0;

PImage Qup;
PImage Qdown;
PImage ukMap;
PImage answer;
PImage age;
PImage gender;
PImage social_class;
PImage display;
PImage next;
PImage back;
PImage ageOver;
PImage genderOver;
PImage social_classOver;
float data[] = {
  4, 3, 5, 3
};
String[] questions;
BBox qUp;
BBox qDown;

ArrayList<Data> dataList;
Parser parser;
PieChart chart = new PieChart(data);
  ArrayList<DataContainer> dc;

PImage[] rollovers = new PImage[3];
//index 0:gender 1:age 2:social_class index values apply for both tabs[] and tabFlags[]
boolean[] tabFlags = new boolean[3];
BBox[] tabs = new BBox[3];

String[] answers;
int answerCount = 0;

void setup()
{
  size(800, 700, JAVA2D);
  smooth();
  background(255);
  initialise();
  parser = new Parser();
  //dataList=parser.getInformationFromTableInCSV("question1.csv");
  dc = parser.getDataContainer();

  PieChart chart = new PieChart(data);
  ageOver = loadImage("age2.png");
  genderOver = loadImage("gender2.PNG");
  social_classOver = loadImage("class2.png");
  rollovers[1] = ageOver;
  rollovers[0] = genderOver;
  rollovers[2] = social_classOver;

  ukMap = loadImage("images/uk.png");
  answer = loadImage("images/answer.png");
  age = loadImage("images/age.png");
  gender = loadImage("images/gender.png");
  social_class = loadImage("images/class.png");
  display = loadImage("images/display.png");
  next = loadImage("images/next.png");
  back = loadImage("images/back.png");
  Qup = loadImage("up.png");
  Qdown = loadImage("down.png");
  //PieChart chart = new PieChart(data);

  fill(255);
  ellipseMode(CENTER);
  rectMode(CENTER);
  ellipse(width/2, height/2-60, 480, 480);
  image(ukMap, (width/2)-130, 140-60);

  image(gender, width/2-180, 607);
  image(age, width/2-64, 607);
  image(social_class, width/2+52, 607);

  image(answer, width/2-200, 550);
  chart.draw(595, 598, 40, 40, false);
  fill(49, 49, 49);

  //Draw in the display box and value.
  imageMode(CENTER);
  image(display, width/2, height/2-60);
  imageMode(CORNER);

  write.h_text("34%", width/2-20, height/2-50);
  //End Display Draw

  //The Question
  //write.h_text("Q1 Which of the following concern you at present?", 20, 30);
  //The Answer
  //write.h_text("Terrorism",width/2-170,610);

  //Next Arrow
  image(next, 620, 545);

  //Back Arrow
  image(back, 130, 545);

  /**** navButton BBox's ****/
  backnNext[0] = new BBox(620, 545, next.height, next.width);
  backnNext[1] = new BBox(130, 545, back.height, next.width);
  /**** navButton BBox's ****/

  /**** tag BBox's ****/
  tabs[0] = new BBox(width/2-180, 607, gender.width, gender.height);
  tabs[1] = new BBox(width/2-64, 607, age.width, age.height);
  tabs[2] = new BBox(width/2+52, 607, social_class.width, social_class.height);
  /**** tag BBox's ****/
  
  qUp = new BBox(650, 0, Qup.width, Qup.height);
  qDown = new BBox(650, 60, Qdown.width, Qdown.height);
}

void draw()
{
  background(255);
  fill(255);
  write.h_text("34%", width/2-20, height/2-50);
  //End Display Draw

  //The Question
  write.h_text("Q1 Which of the following concern you at present?", 20, 30);
  
  image(Qup, 650, 0);
  image(Qdown, 650, 60);
  
  chart.draw(width/2, height/2-60, 250, 250, true);
  ellipseMode(CENTER);
  rectMode(CENTER);
  ellipse(width/2, height/2-60, 480, 480);
   
  image(ukMap, (width/2)-130, 140-60);
  
  image(gender, width/2-180, 607);
  image(age, width/2-64, 607);
  image(social_class, width/2+52, 607);

  //rollover
  for (int i=0; i<tabs.length; i++) {
    if (tabs[i].isOver(mouseX, mouseY)) {
      switch(i) {
      case 0: image(rollovers[i], width/2-180, 607); break;
      case 1: image(rollovers[i], width/2-64, 607); break;
      case 2: image(rollovers[i], width/2+52, 607); break;
      }
    }
  }

  image(answer, width/2-200, 550);
  chart.draw(590, 598, 37, 37,false);
  fill(49, 49, 49);
  
  answers = dc.get(1).getAnswers().toArray(new String[dc.get(1).getAnswers().size()]);
  
  if (dist(mouseX, mouseY, width/2, height/2-60)<=250)
  {
    //Draw in the display box and value.
    imageMode(CENTER);
    image(display, width/2, height/2-60);
    imageMode(CORNER);
    write.h_text("34%", width/2-20, height/2-50);
    //End Display Draw
  }

  //The Question
  //write.h_text("Q1 Which of the following concern you at present?", 20, 30);

  //The Answer
  write.h_text(answers[answerCount], width/2-170, 610);

  //Next Arrow
  image(next, 620, 545);

  //Back Arrow
  image(back, 130, 545);
  //Start the circular text.
  String message = dc.get(qCount).getQuestion();
  PFont font = loadFont("myriad.vlw");
  // The radius of a circle
  float r = 260;
  textAlign(CENTER);
  // Start in the center and draw the circle
  translate(width/2, height/2-60);
  
  // We must keep track of our position along the curve
 arclength = 0;
  
  // For every box
  for (int i = 0; i < message.length(); i ++ ) {
    
    // The character and its width
    char currentChar = message.charAt(i);
    // Instead of a constant width, we check the width of each character.
    float w = textWidth(currentChar); 
    // Each box is centered so we move half the width
    arclength += w/2;
    
    // Angle in radians is the arclength divided by the radius
    // Starting on the left side of the circle by adding PI
    theta = PI + arclength / r;
    
    pushMatrix();
    
    // Polar to Cartesian conversion allows us to find the point along the curve. See Chapter 13 for a review of this concept.
    translate(r*cos(theta), r*sin(theta)); 
    // Rotate the box (rotation is offset by 90 degrees)
    rotate(theta + PI/2); 
    
    // Display the character
    fill(0);
    text(currentChar,0,0);
    
    popMatrix();
    
    // Move halfway again
    arclength += w/2;
  }
  textAlign(LEFT);

}

void initialise()
{
  colourSet = new ColourArray();
  colours = colourSet.colours;
  write = new Write();
}

void mouseClicked() {
  for (int i=0; i<backnNext.length; i++) {
    if (backnNext[i].isOver(mouseX, mouseY)) {
      switch(i) {
      case 0:
        {
          if (answerCount<answers.length-1) {
            answerCount++;
          }
        }
        break;
      case 1:
        {
          if (answerCount>=1) {
            answerCount--;
          }
        }
        break;
      }
    }
  }
  for (int i=0; i<tabs.length; i++) {
    if (tabs[i].isOver(mouseX, mouseY)) {
      if (tabFlags[i]==false) {
        switch(i) {
        case 0:
          {
            tabFlags[0]= true;
            tabFlags[1] = false;
            tabFlags[2] = false;
          }
          break;
        case 1:
          {
            tabFlags[1]= true;
            tabFlags[0]= false;
            tabFlags[2]= false;
          }
          break;
        case 2:
          {
            tabFlags[2]= true;
            tabFlags[0]= false;
            tabFlags[1]= false;
          }
          break;
        }
      }
      else {
        tabFlags[i]=false;
      }
    }
  }
  //controlls question scrolling
    for(int k=0;k<2;k++){
      if(qUp.isOver(mouseX,mouseY)){
        qCount++;
      }
      else if(qDown.isOver(mouseX,mouseY)){
        if(qCount!=0){
          qCount--;
        }
        
      }  
    }
}


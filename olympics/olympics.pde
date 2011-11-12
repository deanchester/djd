ColourArray colourSet;
color colours[];
Write write;
BBox backnNext[] = new BBox[2];

//index 0:gender 1:age 2:social_class for both tabs[] and tabFlags[]
boolean[] tabFlags = new boolean[3];
BBox[] tabs = new BBox[3];

String[] answers ={"answer1","answer2","answer3","answer4","answer5"};
int answerCount = 0;

  PImage ukMap;
  PImage answer;
  PImage age;
  PImage gender;
  PImage social_class;
  PImage display;
  PImage next;
  PImage back;
  float data[] = {4,3,5,3};
  PieChart chart = new PieChart(data);
  
void setup()
{
  size(800,700,JAVA2D);
  smooth();
  background(255);
  initialise();
  
   ukMap = loadImage("images/uk.png");
   answer = loadImage("images/answer.png");
   age = loadImage("images/age.png");
   gender = loadImage("images/gender.png");
   social_class = loadImage("images/class.png");
   display = loadImage("images/display.png");
   next = loadImage("images/next.png");
   back = loadImage("images/back.png");
  PieChart chart = new PieChart(data);
  
  

  
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
  //write.h_text("Terrorism",width/2-170,610);
  
  //Next Arrow
  image(next,620,545);
  
  //Back Arrow
  image(back,130,545);
  
  /**** navButton BBox's ****/
  backnNext[0] = new BBox(620,545,next.height,next.width);
  backnNext[1] = new BBox(130,545,back.height,next.width);
  /**** navButton BBox's ****/
  
  /**** tag BBox's ****/
  tabs[0] = new BBox(width/2-180, 607,gender.width,gender.height);
  tabs[1] = new BBox(width/2-64, 607,age.width,age.height);
  tabs[2] = new BBox(width/2+52, 607,social_class.width, social_class.height);
  /**** tag BBox's ****/
  
}

void draw()
{
  background(255);
  fill(255);
  chart.draw(width/2,height/2-60,250,250);
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
  
  //rollover
  for(int i=0; i<tabs.length; i++){
     if(tabs[i].isOver(mouseX,mouseY)){
        //display image 2 
     }
  }
  
  if(dist(mouseX, mouseY, width/2,height/2-60)<=250)
  {
  //Draw in the display box and value.
  imageMode(CENTER);
  image(display,width/2,height/2-60);
  imageMode(CORNER);
  write.h_text("34%",width/2-20,height/2-50);
  //End Display Draw
  }
  
  //The Question
  write.h_text("Q1 Which of the following concern you at present?",20,30);
  
  //The Answer
  write.h_text(answers[answerCount],width/2-170,610);
  
  //Next Arrow
  image(next,620,545);
  
  //Back Arrow
  image(back,130,545);
}

void initialise()
{
  colourSet = new ColourArray();
  colours = colourSet.colours;
  write = new Write();
}

  void mouseClicked(){
      for(int i=0; i<backnNext.length; i++){
       if(backnNext[i].isOver(mouseX,mouseY)){
         if(answerCount==4){
           answerCount = 0;
         }
         else{
           answerCount++; 
         }
       }
    }
    for(int i=0; i<tabs.length; i++){
      if(tabs[i].isOver(mouseX,mouseY)){
         if(tabFlags[i]==false){
            switch(i){
             case 0:{tabFlags[0]= true;
                     tabFlags[1] = false;
                     tabFlags[2] = false;
                     }break;
             case 1:{tabFlags[1]= true;
                     tabFlags[0]= false;
                     tabFlags[2]= false;
                     }break;
             case 2:{tabFlags[2]= true;
                     tabFlags[0]= false;
                     tabFlags[1]= false;
                     }break;
            }
         }else{
            tabFlags[i]=false;
         }
      }      
    }
  }

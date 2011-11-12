
 class BBox{
  private int topLeftX;
  private int topLeftY;
  private int bHeight;
  private int bWidth;
  
  //Constructor
 BBox(int tempTopLeftX, int tempTopLeftY,int tempBWidth, int tempBHeight){
   this.topLeftX = tempTopLeftX;
   this.topLeftY = tempTopLeftY;
   this.bHeight = tempBHeight;
   this.bWidth = tempBWidth;
 } 
 
 public boolean isOver(int x, int y){  //returns true if point is inside bounding box
   if((x>topLeftX) && (x<topLeftX+bWidth) && 
      (y>topLeftY) && (y<topLeftY+bHeight)){
       return true;
   }else{
       return false;
   }
 }
 
 public int getTopLeftX(){
   return topLeftX;
 }
  
 public int getTopLeftY(){
   return topLeftY;
 }
 
 public int getBHeight(){
   return bHeight;
 }
 
 public int getBWidth(){
   return bWidth;
 }
}

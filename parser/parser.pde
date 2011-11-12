class Parser{

String[] rawInput;
String[][] splitInput;
int rows;
int columns;
  
  public String[][] to2D(String fileName){//must be a CSV file
  
    rawInput = loadStrings(fileName);//calculate rows and columns
    rows = rawInput.length;
    columns = rawInput[1].split(",").length;
  
    splitInput = new String[rows][columns];
  
    for(int i=0; i<rows; i++){
      splitInput[i] = rawInput[i].split(",");
    }
    return splitInput;  
  }
  
  public String[] getColumn
}

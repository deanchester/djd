 class Parser {
  Parser(){}
  
  /**
   *This method takes in a CSV file then returns the data from the table in the CSV file
   *@param String fileName must be a filename plus the directory. 
   *@return ArrayList with data objects that contain the numbers. 
   */
  public  ArrayList<Data> getInformationFromTableInCSV(String fileName) {
    ArrayList<Data> dataList = new ArrayList<Data>();
    String[] rawInput = loadStrings(fileName);
    for (int i = 6; i < rawInput.length; i=i+2) {
      String information = rawInput[i];
      String[] partsOfInformation = split(information, ','); 
      Data data = new Data(Integer.parseInt(removePercentageSymbol(partsOfInformation[1])), 
      Integer.parseInt(removePercentageSymbol(partsOfInformation[2])), 
      Integer.parseInt(removePercentageSymbol(partsOfInformation[3])), 
      Integer.parseInt(removePercentageSymbol(partsOfInformation[4])), 
      Integer.parseInt(removePercentageSymbol(partsOfInformation[5])), 
      Integer.parseInt(removePercentageSymbol(partsOfInformation[6])), 
      Integer.parseInt(removePercentageSymbol(partsOfInformation[7])), 
      Integer.parseInt(removePercentageSymbol(partsOfInformation[8])), 
      Integer.parseInt(removePercentageSymbol(partsOfInformation[9])), 
      Integer.parseInt(removePercentageSymbol(partsOfInformation[10])), 
      Integer.parseInt(removePercentageSymbol(partsOfInformation[11])), 
      Integer.parseInt(removePercentageSymbol(partsOfInformation[12])), 
      Integer.parseInt(removePercentageSymbol(partsOfInformation[13])));
      
      dataList.add(data);
    }

    return dataList;
  }

  /**
   * This method takes in a string from the file then removes the percentage sign.
   * @param String with which you want to remove the percentage sign from. 
   * @return String that can be parsed to an Integer
   */
  public String removePercentageSymbol(String stringToRemovePercentageSignFrom) {
      if(stringToRemovePercentageSignFrom.substring(stringToRemovePercentageSignFrom.length()-1, stringToRemovePercentageSignFrom.length()).equals("%"))
        return stringToRemovePercentageSignFrom.substring(0,stringToRemovePercentageSignFrom.length()-1);
       else {
         return stringToRemovePercentageSignFrom;
       }
  }

  public  ArrayList<String> getAnswers(String fileName) {
    ArrayList<String> answers = new ArrayList<String>();
    String[] rawInput = loadStrings(fileName);
      for (int i = 4; i < rawInput.length; i=i+2) {
      String information = rawInput[i];
      String[] partsOfInformation = split(information, ',');  
      answers.add(partsOfInformation[0]);
    }

    return answers;
  }

  public  ArrayList<DataContainer> getDataContainer() {
    String fileName = "questions.txt";
    String[] questions = loadStrings(fileName);
    ArrayList<DataContainer> dataContainers = new ArrayList<DataContainer>();
    for (int i = 0;i<questions.length;i++) {
      String questionsStr = questions[i];
      String[] question = split(questionsStr, "\n");
      DataContainer dataContainer = new DataContainer(question[0], getAnswers("q"+i+".csv"), getInformationFromTableInCSV("q"+i+".csv"));
      dataContainers.add(dataContainer);
    }
    println(dataContainers.size());
    return dataContainers;
    
  }
}


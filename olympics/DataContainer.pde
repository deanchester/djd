class DataContainer {
 private String question;
 private ArrayList<String> answers;
 private ArrayList<Data> data;
 
 DataContainer(String question, ArrayList<String> answers,ArrayList<Data> data){
   this.question = question;
   this.answers = answers;
   this.data = data; 
 }
 
 public String getQuestion(){
   return question;  
 }
 
 public ArrayList<String> getAnswers(){
   return answers; 
 }
 
 public ArrayList<Data> getData(){
   return data; 
 }
}

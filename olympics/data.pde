class Data {

  private int total;
  private int london; 
  private int south;
  private int midlands;
  private int north;
  private int scotland;
  private int male;
  private int female;
  private int young;
  private int middleAged;
  private int old;
  private int upperClass;
  private int lowerClass;

  Data(int total, int london, int south, int midlands, int north, int scotland, 
  int male, int female, int young, int middleAged, int old, int upperClass, 
  int lowerClass) {
    this.total = total;
    this.london = london;
    this.south = south; 
    this.midlands = midlands; 
    this.north = north; 
    this.scotland = scotland;
    this.male = male;
    this.female = female;
    this.young = young;
    this.middleAged = middleAged; 
    this.old = old; 
    this.upperClass = upperClass;
    this.lowerClass = lowerClass;
  }

  public int getTotal() {
    return total;
  }

  public int getLondon() {
    return london;
  }

  public int getSouth() {
    return south;
  }

  public int getMidlands() {
    return midlands;
  }

  public int getNorth() {
    return north;
  }

  public int getScotland() {
    return scotland;
  }

  public int getMale() {
    return male;
  }   

  public int getFemale() {
    return female;
  }  

  public int getYoung() {
    return young;
  }

  public int getMiddleAged() {
    return middleAged;
  }

  public int getOld() {
    return old;
  }

  public int getUpperClass() {
    return upperClass;
  }

  public int getLowerClass() {
    return lowerClass;
  }

  public float[] getAges() {
    float[] ages = new float[3];

    ages[0] = (float)young;
    ages[1] = (float)middleAged;
    ages[2] = (float)old;

    return ages;
  }

  public float[] getClasses() {
    float[] classes = new float[2];

    classes[0] = (float)upperClass;
    classes[1] = (float)lowerClass;

    return classes;
  }

  public float[] getGender() {
    float[] gender = new float[2];

    gender[0] = (float)male;
    gender[1] = (float)female;

    return gender;
  }
  
  public float[] getRegions(){
   float[] region  = new float[5];

    region[0] = (float)london;
    region[1] = (float)south;
    region[2] = (float)midlands;
    region[3] = (float)north;
    region[4] = (float)scotland;
    
    return region;  
  }
}


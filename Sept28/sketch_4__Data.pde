String strings[];
float maxDeath;
IntList xPosition;
IntList yPosition;

void setup(){
  size(2000,1000);
  background(255);
  strings = loadStrings("/C:/Users/user/Desktop/CauseOfDeath2.csv");
  
  if (strings == null){
    //println("failed to load the file, stopping here");
    
    while (true){ ; }  
  }
  //println("strings loaded from file successfully, read "+strings.length+" lines");
  findMaxdeath();
  position();
}

//generating x, y coordinates that do not repeat
void position(){
  xPosition = new IntList();
  for (int i=1; i<2000; i++) xPosition.append(i);
  xPosition.shuffle();
   
  yPosition = new IntList();
  for (int i=1; i<1000; i++) yPosition.append(i);
  yPosition.shuffle(); 
}

//finding Maximum number of deaths
void findMaxdeath(){
  String singleRow[];
  for (int csvRowNumber=2; csvRowNumber<strings.length;csvRowNumber++){
    singleRow = split(strings[csvRowNumber],',');
    float deathNumber = float(singleRow[6]);
    if (Float.isNaN(deathNumber)){
      println("skip line");
    }
    else{
      if (csvRowNumber ==2){
        maxDeath = deathNumber+10;
      }
      if (deathNumber>maxDeath){
        maxDeath=deathNumber;
      }
    }
  }
  println(maxDeath);
}


int csvRowNumber =2;

void draw(){
  String singleRow[];
  singleRow = split(strings[csvRowNumber],',');
 float deathNumber = float(singleRow[6]);
  if (Float.isNaN(deathNumber)){
    //println("conversion to float failed; skipping row" + csvRowNumber);
    }
  else{
  float pdeathNumber=map(deathNumber,1,maxDeath/100,0,1000);
  int xpos = xPosition.get(csvRowNumber);
  int ypos = yPosition.get(csvRowNumber);
  
  noStroke();
  circle(xpos,ypos, pdeathNumber/10);
  println(xpos,ypos);
  fill(random(256),random(256),random(256), 70);
  
  csvRowNumber ++;
  }
  if (csvRowNumber >= strings.length){
    println("finished");
    noLoop();
  }
}
  

PFont f;
boolean mouseWasPressed = false;
boolean keyWasPressed = false;
boolean gameStart = false;
String data[];
String matrix[][];




//make it into arrays

Game myGame1;


void setup(){
  size(1000,1000);
  background(255,255,255);
  f=createFont("Arial", 100);
  
  matrixSetup();

  myGame1 = new Game(1,0,0);
  //myGame1.gameSet();
} 


void matrixSetup(){
  data = new String[5];
  for (int i=0; i<5; i++){
    int m =i+1;
    data[i] ="/Users/user/Desktop/IntrotoIM/midterm2/matrix/matrix"+m+".csv";
  }
  
  matrix = new String[5][5];
  for (int i=0; i<5; i++){
    int m = i+1;
    matrix[i]=loadStrings(data[i]);
  }
  
  
  println(matrix[0]);
  println(matrix[1]);
  println(matrix[2]);
  println(matrix[3]);
  println(matrix[4]);
}

class Game{
  int gN;
  float e1, e2;
  String p1Payoff[];
  String p2Payoff[];
  String choice1;
  String choice2;
  String choice;
  
  Game(int gameNum, float earn1, float earn2){
    gN = gameNum;
    e1 = earn1;
    e2 = earn2;
    
  }
  
  void startpage(){
    background(255,255,255);
    fill(0);
    textFont(f,50);
    text("start",500,500);
  }
  
  void instruction(){
    background(255,255,255);
    fill(0);
    textFont(f,50);
    text("instruction",500,480);
    //p1 = row player, p2 = column player
    //p1 = a, d        p2 = j, l
  }
  
  void gamePrep(String [] array){
    p1Payoff = split(array[0],',');
    p2Payoff = split(array[1],',');
  }
  
  void gameDisplay(){
    background(255,255,255);
    gamePrep(matrix[0]);
    text(p1Payoff[0],500,500);
    text(p2Payoff[0],600,500);
    
    text(p1Payoff[1],700,500);
    text(p2Payoff[1],800,500);
    
    text(p1Payoff[2],500,600);
    text(p2Payoff[2],600,600);
    
    text(p1Payoff[3],700,600);
    text(p2Payoff[3],800,600);
  }
  
  void gameOn(){
    
    //gamePrep(matrix[0]);
    //int roundCount = 1;
    //float p1 = 0;
    //float p2 = 0;
    
    //String choice1="";
    //String choice2="";
    //String choice="";
    //boolean validkey = true;
    
    if (keyCount == 1){
        if (key == 'a'){choice1 = "top";}
        if (key == 'd'){choice1 = "bottom";}
        if (key == 'j'){choice1 = "left";}
        if (key == 'l'){choice1 = "bottom";}
        println("choice 1 is " + choice1);
    }
   if (keyCount == 2){
        if (key == 'a'){choice2 = "top";}
        if (key == 'd'){choice2 = "bottom";}
        if (key == 'j'){choice2 = "left";}
        if (key == 'l'){choice2 = "bottom";}
        choice = choice1+choice2;
      println("choice 2 is " + choice2);
      println(choice);
   }

   
  }
}

int mouseClickCount = 0;
void mousePressed(){
  mouseWasPressed=true;
  mouseClickCount +=1;
}

int keyCount = 0;
void keyPressed(){
  keyCount +=1;
  if (gameStart==true){
    myGame1.gameOn();
  }
}

//}

//boolean true/false, when both players make decision, boolean becomes true
//roundCount +1

void draw(){
  if (mouseWasPressed==false){myGame1.startpage();}
  if (mousePressed==true){
    if (mouseClickCount==1){myGame1.instruction();}
    if (mouseClickCount==2){
      myGame1.gameDisplay();
      gameStart=true;
    }
  }
}

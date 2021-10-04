PFont f;
boolean mouseWasPressed = false;
String matrix1[];

Game myGame1;


void setup(){
  size(1000,1000);
  background(255,255,255);
  f=createFont("Arial", 100);
  myGame1 = new Game(1,0,0);
  myGame1.gameSet();
}

class Game{
  int gN;
  float e1, e2;
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
  }
  void gameSet(){
    matrix1 = loadStrings("/C:/Users/user/Desktop/matrix1.csv");
    String p1Payoff[];
    String p2Payoff[];
    p1Payoff = split(matrix1[0],',');
    p2Payoff = split(matrix1[1],',');
    println(p1Payoff);
    println(p2Payoff);
  }
  void gameOn(){
    background(255,255,255);
    fill(0);
    textFont(f,50);
    text("matrix",500,500);
  }
}

int mouseClickCount = 0;
void mousePressed(){
  mouseWasPressed=true;
  mouseClickCount +=1;
}

void draw(){
  if (mouseWasPressed==false){myGame1.startpage();}
  if (mousePressed==true){
    if (mouseClickCount==1){myGame1.instruction();}
    if (mouseClickCount==2){myGame1.gameOn();}
  }
}

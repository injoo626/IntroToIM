PFont f;

Game myGame1;

void setup(){
  size(1000,1000);
  f=createFont("Arial", 16);
  myGame1 = new Game(1,1,0,0);
}

class Game{
  int gT, gN;
  String p1, p2;
  float e1, e2;
  Game(int gameType, int gameNum, float earn1, float earn2){
    gT = gameType;
    gN = gameNum;
    e1 = earn1;
    e2 = earn2;
  }
  void getPlayerName(){
    String typing = "";
    String p1, p2;
    int keyNum = 0;
    textFont(f,16);
    //println(typing);
   
    if (keyNum==0 ){
      if (key == '\n'){
        p1 = typing;
        typing = "";
        keyNum=1;
      }
      else {typing = typing + key;}
    }
    
    if (keyNum == 1){
      if (key == '\n'){
        p2 = typing;
        keyNum = keyNum+1;
      }
      else {typing = typing + key;}
    }   
  }
  void displayName(){
    fill(0);
    text("Type Player1's name and press ENTER", width/2, 300);
    text("Input:" + p1,width/2, 500);
    text("Type Player2's name and press ENTER", width/2, 700);
    text("Input:" + p2, width/2, 900);
  }
  
}



void keyPressed(){
  myGame1.getPlayerName();
}
void draw(){
  background(255);
  myGame1.displayName();
}

//void playerName(){
//  String typing = "";
//  String p1, p2;
//  textFont(f,16);
//  int keyNum = 0;
//  if (keyNum==0 ){
//    if (key == '\n'){
//      p1 = typing;
//      keyNum=keyNum+1;
//      typing = "";
//    }
//    else {typing = typing + key; println(typing);}
//  }
//  if (keyNum == 1){
//    text("Type Player2's name and press ENTER", height/2, width/2);
//    if (key == '\n'){
//      p2 = typing;
//      keyNum = keyNum+1;
//    }
//    else {typing = typing + key;}
//  }
//}

//void keyPressed(){
//  playerName();
//}



  

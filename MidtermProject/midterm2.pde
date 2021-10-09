import processing.sound.*;

PFont f;

boolean mouseWasPressed = false;
boolean choiceCheck = false;
boolean keyWasPressed = false;
boolean gameStart = false;
boolean roundCheck = false;

String data[];
String matrix[][];

PImage start, inst1, inst2, inst3, round, end;

Game myGame1;
SoundFile bgm;
SoundFile click;
SoundFile makeChoice;

void setup() {
  size(1000, 1000);
  background(255, 255, 255);
  f=createFont("Arial", 100);

  matrixSetup();


  start = loadImage("/Users/user/Desktop/IntrotoIM/midterm2/display/1.png");
  inst1 = loadImage("/Users/user/Desktop/IntrotoIM/midterm2/display/2.png");
  inst2 = loadImage("/Users/user/Desktop/IntrotoIM/midterm2/display/3.png");
  inst3 = loadImage("/Users/user/Desktop/IntrotoIM/midterm2/display/4.png");
  round = loadImage("/Users/user/Desktop/IntrotoIM/midterm2/display/5.png");
  end = loadImage("/Users/user/Desktop/IntrotoIM/midterm2/display/6.png");

  myGame1 = new Game(0, 0, 0);
  bgm = new SoundFile(this,"/Users/user/Desktop/IntrotoIM/midterm2/sound/background.mp3");
  click = new SoundFile(this,"/Users/user/Desktop/IntrotoIM/midterm2/sound/click.mp3");
  makeChoice = new SoundFile(this,"/Users/user/Desktop/IntrotoIM/midterm2/sound/key.mp3");
  
  bgm.loop();
}


void matrixSetup() {
  data = new String[5];
  for (int i=0; i<5; i++) {
    int m =i+1;
    data[i] ="/Users/user/Desktop/IntrotoIM/midterm2/matrix/matrix"+m+".csv";
  }

  matrix = new String[5][5];
  for (int i=0; i<5; i++) {
    matrix[i]=loadStrings(data[i]);
  }

  println(matrix[0]);
  println(matrix[1]);
  println(matrix[2]);
  println(matrix[3]);
  println(matrix[4]);
}

class Game {
  int gN;
  float e1, e2;
  String p1Payoff[];
  String p2Payoff[];
  String choice1;
  String choice2;
  String choice;

  Game(int gameNum, float earn1, float earn2) {
    gN = gameNum;
    e1 = earn1;
    e2 = earn2;
  }

  void startpage() {
    image(start, 0, 0, 1000, 1000);
  }

  void instruction1() {
    image(inst1, 0, 0, 1000, 1000);
  }

  void instruction2() {
    image(inst2, 0, 0, 1000, 1000);
  }

  void instruction3() {
    image(inst3, 0, 0, 1000, 1000);
  }

  void gamePrep(String [] array) {
    p1Payoff = split(array[0], ',');
    p2Payoff = split(array[1], ',');
  }

  void gameDisplay() {
    image(round, 0, 0, 1000, 1000);

    fill(0);
    textFont(f, 50);

    text(p1Payoff[0], 350, 520);
    text(p2Payoff[0], 450, 520);

    text(p1Payoff[1], 650, 520);
    text(p2Payoff[1], 770, 520);

    text(p1Payoff[2], 350, 590);
    text(p2Payoff[2], 450, 590);

    text(p1Payoff[3], 650, 590);
    text(p2Payoff[3], 770, 590);
  }

  void gameChoice() {
    if (keyCount == 1) {
      if (key == 'a') {
        choice1 = "top";
      }
      if (key == 'd') {
        choice1 = "bottom";
      }
      if (key == 'j') {
        choice1 = "left";
      }
      if (key == 'l') {
        choice1 = "right";
      }
      println("choice 1 is " + choice1);
    }
    if (keyCount == 2) {
      if (key == 'a') {
        choice2 = "top";
      }
      if (key == 'd') {
        choice2 = "bottom";
      }
      if (key == 'j') {
        choice2 = "left";
      }
      if (key == 'l') {
        choice2 = "right";
      }
      choice = choice1+choice2;
      println("choice 2 is " + choice2);
      println(choice);
      choiceCheck = true;
    }
  }
  
  void gameEarn() {
    println(choice);
    if (choice.equals("topleft") | choice.equals("lefttop")) {
      e1 = e1 + float(p1Payoff[0]);
      e2 = e2 + float(p2Payoff[0]);
      roundCheck = true;
    }
    if (choice.equals("topright")|choice.equals("righttop")) {
      e1 = e1 + float(p1Payoff[1]);
      e2 = e2 + float(p2Payoff[1]);
      roundCheck = true;
    }
    if (choice.equals("bottomleft")|choice.equals("leftbottom")) {
      e1 = e1 + float(p1Payoff[2]);
      e2 = e2 + float(p2Payoff[2]);
      roundCheck = true;
    }
    if (choice.equals("bottomright")|choice.equals("rightbottom")) {
      e1 = e1 + float(p1Payoff[3]);
      e2 = e2 + float(p2Payoff[3]);
      roundCheck = true;
    }
  }
  
  void earnDisplay() {
    fill(255, 255, 255);
    textFont(f, 50);

    text(e1, 35, 130);
    text(e2, 770, 130);
  }
  
  void roundDisplay(int i) {
    gamePrep(matrix[i]);
    gameDisplay();
    fill(255, 255, 255);
    text(e1, 35, 130);
    text(e2, 770, 130);
  }

  void gameRound() {
    gameChoice();
    earnDisplay();
    if (choiceCheck == true) {
      gameEarn();
      earnDisplay();
    }
    if (roundCheck == true) {
      choiceCheck = false;
      roundCheck = false;
      gN = gN + 1;
      nextRound();
    }
  }

  void nextRound() {
    if (gN <5) {
      keyCount = 0;
      roundDisplay(gN);
      earnDisplay();
      println("next");
    }
    if (gN > 4) {
      endDisplay();
      gN = 0;
      keyCount = 0;
    }
  }

  void endDisplay() {
    image(end, 0, 0, 1000, 1000);
    text(e1, 500, 500);
    text(e2, 500, 570);
    bgm.stop();
    gameStart = false;
  }
}



int mouseClickCount = 0;
void mousePressed() {
  mouseWasPressed=true;
  mouseClickCount +=1;
  click.play();
}

int keyCount = 0;
void keyPressed() {
  if (key == 'a'|key == 'd'|key =='j'|key=='l'&& gameStart==true) {
    keyCount +=1;
    makeChoice.play();
  }

  if (gameStart==true) {
    myGame1.gameRound();
  }
}

void draw() {
  if (mouseWasPressed==false) {
    myGame1.startpage();
  }
  if (mousePressed==true) {
    if (mouseClickCount==1) {
      myGame1.instruction1();
    }
    if (mouseClickCount == 2) {
      myGame1.instruction2();
    }
    if (mouseClickCount == 3) {
      myGame1.instruction3();
    }
    if (mouseClickCount==4) {
      gameStart=true;
      myGame1.roundDisplay(myGame1.gN);
    }

    if (mouseClickCount == 5  && (mouseButton ==LEFT)) {
      mouseClickCount = 4;
      myGame1.roundDisplay(myGame1.gN);
      gameStart = true;
    }
    if (mouseClickCount == 5 && (mouseButton == RIGHT)) {
      mouseClickCount = 4;
      myGame1.roundDisplay(myGame1.gN);
      gameStart = true;
      myGame1.e1 = 0;
      myGame1.e2 = 0;
    }
  }
}

import processing.sound.*;

PFont f;

boolean choiceCheck = false;     //becomes true when all choices are made
boolean roundCheck = false;      //becomes true when one round has finished
boolean gameStart = false;       //becomes true when the instruction stage ends

String data[];                  //payoff matrix of all five rounds
String r[][];                   //payoff matrix of each rounds. r[round number][player number]

PImage start, inst1, inst2, inst3, round, end;

Game myGame1;

SoundFile bgm;
SoundFile click;
SoundFile makeChoice;

void setup() {
  //creates canvas and font
  size(1000, 1000);
  f=createFont("Arial", 100);

  //reads csv file
  matrixSetup();

  //loads background image for each stage
  start = loadImage("/Users/user/Desktop/IntrotoIM/midterm2/display/1.png");
  inst1 = loadImage("/Users/user/Desktop/IntrotoIM/midterm2/display/2.png");
  inst2 = loadImage("/Users/user/Desktop/IntrotoIM/midterm2/display/3.png");
  inst3 = loadImage("/Users/user/Desktop/IntrotoIM/midterm2/display/4.png");
  round = loadImage("/Users/user/Desktop/IntrotoIM/midterm2/display/5.png");
  end = loadImage("/Users/user/Desktop/IntrotoIM/midterm2/display/6.png");

  //creates Game object
  myGame1 = new Game(0, 0, 0);

  //creates SoundFile objects
  bgm = new SoundFile(this, "/Users/user/Desktop/IntrotoIM/midterm2/sound/background.mp3");
  click = new SoundFile(this, "/Users/user/Desktop/IntrotoIM/midterm2/sound/click.mp3");
  makeChoice = new SoundFile(this, "/Users/user/Desktop/IntrotoIM/midterm2/sound/key.mp3");

  //plays background music. when the  music ends, loops back to the beginning
  bgm.loop();
}

void matrixSetup() {
  data = loadStrings("/Users/user/Desktop/IntrotoIM/midterm2/matrix/matrix.csv");         //payoff matrix of all five rounds

  r = new String[5][2];             //payoff matrix of each rounds.

  for (int i=0; i<9; i+=2) {       //separate data by two lines
    int a = i/2;
    r[a][0] = data[i];
    r[a][1] = data[i+1];
  }
}

int mouseClickCount = 0;
void mousePressed() {
  mouseClickCount +=1;
  click.play();                     //sound effect is played when mouse is clicked
}

int keyCount = 0;
void keyPressed() {
  if (key == 'a'|key == 'd'|key =='j'|key=='l'&& gameStart==true) {           //when the right key is pressed at the right time
    keyCount +=1;                   //keyCount goes up
    makeChoice.play();             //sound effect is played
  }

  if (gameStart==true) {          //when the instruction pages end
    myGame1.gameRound();          //actual game begins
  }
}

void draw() {
  //when no mouse is pressed, displays the start page
  if (mouseClickCount == 0) {    
    myGame1.startpage();
  }
  //whenever mouse is clicked these functions are called
  if (mousePressed==true) {
    if (mouseClickCount==1) {      //on the first click, displays instruction 1
      myGame1.instruction1();
    }
    if (mouseClickCount == 2) {    //on the second click, displays instruction 2
      myGame1.instruction2();
    }
    if (mouseClickCount == 3) {    //on the third click, displays instruction 3
      myGame1.instruction3();
    }
    if (mouseClickCount==4) {      //on the fourth click, actual game begins
      gameStart=true;
      myGame1.gameRound();
    }

    //after all five rounds have finshed players are given two options
    if (mouseClickCount == 5  && (mouseButton ==LEFT)) {  // replay the game with the current earning
      mouseClickCount = 4;
    }
    if (mouseClickCount == 5 && (mouseButton == RIGHT)) { // reset the earning to 0 and replay
      mouseClickCount = 4;
      myGame1.e1 = 0;
      myGame1.e2 = 0;
    }
  }
}

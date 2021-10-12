import processing.sound.*;

PFont f;

boolean mouseWasPressed = false;
boolean choiceCheck = false;
boolean keyWasPressed = false;
boolean gameStart = false;
boolean roundCheck = false;

String data[];
String matrix[][][];
String r[][];

PImage start, inst1, inst2, inst3, round, end;

Game myGame1;
Button left;
Button right;

SoundFile bgm;
SoundFile click;
SoundFile makeChoice;



void setup() {
  //creates canvas and text font
  size(1000, 1000);
  f=createFont("Arial", 100);
  
  //reads csv file as list of strings
  matrixSetup();

  //loads background image for each stage
  start = loadImage("/Users/user/Desktop/IntrotoIM/midterm3/display/1.png");
  inst1 = loadImage("/Users/user/Desktop/IntrotoIM/midterm3/display/2.png");
  inst2 = loadImage("/Users/user/Desktop/IntrotoIM/midterm3/display/3.png");
  inst3 = loadImage("/Users/user/Desktop/IntrotoIM/midterm3/display/4.png");
  round = loadImage("/Users/user/Desktop/IntrotoIM/midterm3/display/5.png");
  end = loadImage("/Users/user/Desktop/IntrotoIM/midterm3/display/6.png");
  
  //creates Game object
  myGame1 = new Game(0, 0, 0);

  //creates SoundFile objects
  bgm = new SoundFile(this, "/Users/user/Desktop/IntrotoIM/midterm3/sound/background.mp3");
  click = new SoundFile(this, "/Users/user/Desktop/IntrotoIM/midterm3/sound/click.mp3");
  makeChoice = new SoundFile(this, "/Users/user/Desktop/IntrotoIM/midterm3/sound/key.mp3");

  //creates two Button objects (BACK and NEXT)
  left = new Button(200,890, 100, "BACK");
  right = new Button(800, 890, 100, "NEXT");

  //plays background music. when the  music ends, loops back to the beginning of the file
  bgm.loop();
}


//void matrixSetup() {
//  //reads five csv files --each contains payoff matrix of each rounds--and creates a list
  
//  data = new String[5];
//  for (int i=0; i<5; i++) {
//    int m =i+1;
//    data[i] ="/Users/user/Desktop/IntrotoIM/midterm2/matrix/matrix"+m+".csv";
//  }
//  //separate each elements once again and create list of lists
//  matrix = new String[5][5];
//  for (int i=0; i<5; i++) {
//    matrix[i]=loadStrings(data[i]);
//  }
//}



void matrixSetup(){
  data = loadStrings("/Users/user/Desktop/IntrotoIM/midterm2/matrix/matrix.csv");
  println(data[0]);
  println(data[1]);
  r = new String[5][2];
  
  for (int i=0; i<9; i+=2){
    int a = i/2;
    r[a][0] = data[i];
    r[a][1] = data[i+1];
    println("good");
  }
  println(r[0][0]);
  //matrix = new String[5][2][4];
  //for (
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


int stage = 0;
void mousePressed() {
  mouseWasPressed=true;
  click.play();
  stage += 1;
}


void draw() {
  // when no mouse is pressed, displays the start page
  if (mouseWasPressed==false) {
    myGame1.startpage();
  }
  //when mouse is pressed, these functions are called
  if (mousePressed == true) {
    //mouse clicked for the first time
    if (stage == 1) {
      myGame1.instruction1();
      println(stage);
    }
    //mouse clicked when stage = 1
    if (stage == 2) {
      //if right button is clicked, move to stage 2
      if (right.contains(mouseX, mouseY)) {
        myGame1.instruction2();
        println(stage);
      }
      //if left button is clicked, back to start page
      if (left.contains(mouseX, mouseY)) {
        myGame1.startpage();
        stage = 0;
        println(stage);
      }
      //if somewhere else is clicked, stays on stage 1
      if (!right.contains(mouseX, mouseY) && !left.contains(mouseX, mouseY)) {
        myGame1.instruction1();
        stage = 1;
        println(stage);
      }
    }

    //mouse clicked when stage = 2
    if (stage == 3) {
      //if right button is clicked, move to stage 3
      if (right.contains(mouseX, mouseY)) {
        myGame1.instruction3();
        println(stage);
      }
      //if left button is clicked, back to stage 1
      if (left.contains(mouseX, mouseY)) {
        myGame1.instruction1();
        stage = 1;
        println(stage);
      }
      //if somewhere else is clicked, stays on stage 2
      if (!right.contains(mouseX, mouseY) && !left.contains(mouseX, mouseY)) {
        myGame1.instruction2();
        stage = 2;
        println(stage);
      }
    }

    //mouse clicked when stage = 3
    if (stage == 4) {
      //if right button is clicked, move to stage 4 and game begins
      if (right.contains(mouseX, mouseY)) {
        gameStart = true;
        myGame1.roundDisplay(myGame1.gN);
        println(stage);
      }
      //if left button is clicked, back to stage 2
      if (left.contains(mouseX, mouseY)) {
        myGame1.instruction2();
        stage =2;
        println(stage);
      }
      //if somewhere else is clicked, stays on stage 3
      if (!right.contains(mouseX, mouseY) && !left.contains(mouseX, mouseY)) {
        myGame1.instruction3();
        stage = 3;
        println(stage);
      }
    }

    //mouse clicked when stage = 4 (game has ended)
    if (stage == 5) {
      //if leftclick, restart the game with the current earning
      if (gameStart == false && mouseButton == LEFT) {
        stage = 4;
        myGame1.roundDisplay(myGame1.gN);
        gameStart = true;
      }
      //if rightclick, restart the game with 0 earning
      if (gameStart == false && mouseButton == RIGHT) {
        stage = 4;
        myGame1.roundDisplay(myGame1.gN);
        gameStart = true;
        myGame1.e1 = 0;
        myGame1.e2 = 0;
      }
    }
  }
}

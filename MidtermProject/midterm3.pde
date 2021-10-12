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
Button left;
Button right;

SoundFile bgm;
SoundFile click;
SoundFile makeChoice;

void setup() {
  size(1000, 1000);
  background(255, 255, 255);
  f=createFont("Arial", 100);

  matrixSetup();

  start = loadImage("/Users/user/Desktop/IntrotoIM/midterm3/display/1.png");
  inst1 = loadImage("/Users/user/Desktop/IntrotoIM/midterm3/display/2.png");
  inst2 = loadImage("/Users/user/Desktop/IntrotoIM/midterm3/display/3.png");
  inst3 = loadImage("/Users/user/Desktop/IntrotoIM/midterm3/display/4.png");
  round = loadImage("/Users/user/Desktop/IntrotoIM/midterm3/display/5.png");
  end = loadImage("/Users/user/Desktop/IntrotoIM/midterm3/display/6.png");

  myGame1 = new Game(0, 0, 0);

  bgm = new SoundFile(this, "/Users/user/Desktop/IntrotoIM/midterm3/sound/background.mp3");
  click = new SoundFile(this, "/Users/user/Desktop/IntrotoIM/midterm3/sound/click.mp3");
  makeChoice = new SoundFile(this, "/Users/user/Desktop/IntrotoIM/midterm3/sound/key.mp3");

  left = new Button(200, 800, 50);
  right = new Button(800, 800, 50);

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
    //stage = 0
  }
  if (stage == 0) {
    if (mousePressed == true) {
      myGame1.instruction1();
      stage = 1;
    }
  }
  if (stage ==1) {
    if (mousePressed == true) {
      if (right.contains(mouseX, mouseY)) {
        myGame1.instruction2();
        println(stage);
      }
      if (left.contains(mouseX, mouseY)) {
        myGame1.startpage();
        stage = 0;
      } 
      else {
        myGame1.instruction1();
        stage=1;
      }
    }
  }

  if (stage == 2) {
    if (mousePressed == true) {
      if (right.contains(mouseX, mouseY)) {
        myGame1.instruction3();
      }
      if (left.contains(mouseX, mouseY)) {
        myGame1.instruction1();
        stage = 1;
      } 
      else {
        myGame1.instruction2();
        stage = 2;
      }
    }
  }

  if (stage ==3) {
    if (mousePressed == true) {
      if (right.contains(mouseX, mouseY)) {
        gameStart=true;
        myGame1.roundDisplay(myGame1.gN);
      }
      if (left.contains(mouseX,mouseY)){
        myGame1.instruction2();
        stage = 2;
      }
      else{
        myGame1.instruction3();
        stage =3;
      }
    }
  }
  
  if (stage == 5  && (mouseButton ==LEFT)) {
      stage = 4;
      myGame1.roundDisplay(myGame1.gN);
      gameStart = true;
  }
  if (stage == 5 && (mouseButton == RIGHT)) {
      stage = 4;
      myGame1.roundDisplay(myGame1.gN);
      gameStart = true;
      myGame1.e1 = 0;
      myGame1.e2 = 0;
  }
}

  
//  if (mousePressed==true) {
//    //when users clicks the mouse, game instruction appears
//    if (stage == 0) {
//      myGame1.instruction1();
//      stage = 1;
//    }
//    if (stage == 1) {
//      if (right.contains(mouseX, mouseY)) {
//        myGame1.instruction2();
//        println(stage);
//      }
//      if (left.contains(mouseX, mouseY)) {
//        stage = 0;
//        myGame1.startpage();
//      } else {
//        stage = 1;
//        myGame1.instruction1();
//      }
//    }
//    if (stage == 2) {
//      if (right.contains(mouseX, mouseY)) {
//        stage = 3;
//        myGame1.instruction3();
//      }

//      if (left.contains(mouseX, mouseY)) {
//        stage = 1;
//        myGame1.instruction1();
//      } else {
//        stage = 2;
//        myGame1.instruction2();
//      }
//    }
//    //if (mouseClickCount == 3) {
//    //  if (right.contains(mouseX, mouseY)) {
//    //    myGame1.instruction3();
//    //  }
//    //  if (left.contains(mouseX, mouseY)) {
//    //    mouseClickCount = 1;
//    //    myGame1.instruction2();
//    //  } else {
//    //    mouseClickCount = 2;
//    //  }
//    //}

//    if (mouseClickCount==4) {
//      if (right.contains(mouseX, mouseY)) {
//        gameStart=true;
//        myGame1.roundDisplay(myGame1.gN);
//      }

//      if (left.contains(mouseX, mouseY)) {
//        mouseClickCount = 3;
//        myGame1.instruction2();
//      } else {
//      }
//    }

//    if (mouseClickCount == 5  && (mouseButton ==LEFT)) {
//      mouseClickCount = 4;
//      myGame1.roundDisplay(myGame1.gN);
//      gameStart = true;
//    }
//    if (mouseClickCount == 5 && (mouseButton == RIGHT)) {
//      mouseClickCount = 4;
//      myGame1.roundDisplay(myGame1.gN);
//      gameStart = true;
//      myGame1.e1 = 0;
//      myGame1.e2 = 0;
//    }
//  }
//}

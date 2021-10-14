//update in line 89, fixed the bug

import processing.sound.*;           

PFont f;
   
boolean choiceCheck = false;     //becomes true when all choices are made
boolean roundCheck = false;      //becomes true when one round has finished
boolean gameStart = false;       //becomes true when the instruction stage ends


String data[];                  //payoff matrix of all five rounds
String r[][];                   //payoff matrix of each rounds. r[round number][player number]

PImage start, inst1, inst2, inst3, round, end;           //background images


Game myGame1;

Button left;
Button right;

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
  start = loadImage("/Users/user/Desktop/IntrotoIM/midterm3/display/1.png");
  inst1 = loadImage("/Users/user/Desktop/IntrotoIM/midterm3/display/2.png");
  inst2 = loadImage("/Users/user/Desktop/IntrotoIM/midterm3/display/3.png");
  inst3 = loadImage("/Users/user/Desktop/IntrotoIM/midterm3/display/4.png");
  round = loadImage("/Users/user/Desktop/IntrotoIM/midterm3/display/5.png");
  end = loadImage("/Users/user/Desktop/IntrotoIM/midterm3/display/6.png");

  //creates Game object
  myGame1 = new Game(0, 0, 0);

  //creates SoundFile objects
  bgm = new SoundFile(this, "/Users/user/Desktop/IntrotoIM/midterm3/sound/background.mp3");     // played while program is running
  click = new SoundFile(this, "/Users/user/Desktop/IntrotoIM/midterm3/sound/click.mp3");        //played when mouse is clicked
  makeChoice = new SoundFile(this, "/Users/user/Desktop/IntrotoIM/midterm3/sound/key.mp3");    // played when key is pressed

  //creates two Button objects (BACK and NEXT)
  left = new Button(200, 890, 100, "BACK");                                                   //moves to the previous stage                            
  right = new Button(800, 890, 100, "NEXT");                                                  //moves to the next stage

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

int keyCount = 0;
void keyPressed() {
  if (key == 'a'|key == 'd'|key =='j'|key=='l'&& gameStart==true) {   //when the right key is pressed at the right time 
    keyCount +=1;       //key count goes up
    makeChoice.play(); //sound effect is played
  }
}



//changing void mousePressed() to void mouseReleased() fixed the bug
//I think the program mixed up the clicks for stage movement and restart. 
//By changing it to mouseReleased, they are now distinguished.

int stage = 0;
//int mouseClickCount = 0;              //debugging: to check if mousePressed() function is corretly called 
void mouseReleased() {                         
  //mouseClickCount += 1;            
  //println("mouse"+mouseClickCount);
  
  click.play();                                //sound effect is played when mouse is clicked
  
  if (right.contains(mouseX, mouseY)) {        //when NEXT button is clicked
    stage += 1;                                //move to the next stage
  }
  if (left.contains(mouseX, mouseY)) {        //when BACK button is clicked
    stage -= 1;                               //move to the previous stage
  }                                          

  //debugging: to check if the program recognizes LEFT, RIGHT clicks at stage 5.
  //if (mouseButton == LEFT) {
  //  println("left");
  //}
  //if (mouseButton == RIGHT) {
  //  println("right");
  //}
}

void draw() {
  // when no mouse is pressed, displays the start page
  if (stage == 0) {
    myGame1.startpage();
    println(stage);
    //when the NEXT button is clicked, move on to stage 1.
    if (mousePressed == true) {
      stage = 1;
    }
  }
  
  if (stage == 1) {             //on stage 1, display instruction 1
    myGame1.instruction1();
    //println(stage);          //debugging 
  } 
  
  if (stage == 2) {            //on stage 2, display instruction 2
    myGame1.instruction2();
    //println(stage);          //debugging
  }
  
  if (stage == 3) {           //on stage 3, display instruction 3
    myGame1.instruction3();
    //println(stage);         //debugging
  } 
  
  if (stage == 4) {            //on stage 4, actual game begins
    gameStart = true;
    myGame1.gameRound();
    //println(stage);          //debugging
    //println(gameStart);
  }
  
  //BUG HAPPENS HERE when LEFT or RIGHT mouse is clicked at stage 5
  //the program moves on to stage 5, recognizes mouse click, recognizes LEFT or RIGHT 
  //but for some reason randomly excutes or not excutes the functions
 
  
  //things I have tried
  //using keypressed instead of mousePressed
  //ordering functions differently : ex. putting if (mousePressed==true) before if (stage == 5)
  //creating new buttons for the final round
  
  
  
  //after all five rounds are finished, players are given two options
  //LEFT mouse click = start from current earning
  //RIGHT mouse click = reset the earning to 0
  if (stage == 5 && mousePressed == true) {             
    if (mouseButton == LEFT) {
      stage = 4;                        //back to stage 4 without resetting each player's earning
      //println("start from here");     //debugging: see if the functions above are executed
    }
    if (mouseButton == RIGHT) {         
      myGame1.e1 = 0;                  //reset the earnings to 0
      myGame1.e2 = 0;
      stage = 4;                       //back to stage 4
     // println("start from zero");    //debugging: see if the functions above are executed
    }
  }
}

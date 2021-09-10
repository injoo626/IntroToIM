PFont f;
boolean mouseWasPressed=false;


void setup() {
  size(500, 800);
  background(255, 255, 255);
  f=createFont("Arial", 16);
  
  //drawing tilted stripe patches
  strokeWeight(3);
  for (int stripeX1=50;stripeX1<200;stripeX1+=20){
    line(stripeX1,100,stripeX1+70,250);
  }
  for (int stripeX2=300;stripeX2>100;stripeX2-=10){
    line(stripeX2, 600,stripeX2-20,700);
  }
  
  //drawing two rectangles with different thickness
  noFill();
  strokeWeight(10);
  rect(50, 270, 100, 160);
  strokeWeight(5);
  rect(300, 140, 80, 600);
  
  //printing "what?" on the background 
  for (int whatX=0; whatX<500; whatX+=50) {
    for (int whatY=0; whatY<800; whatY+=16) {
      textFont(f, 16);
      fill(0);
      text("What?", whatX, whatY);
    }
  }
  
  //drawing tilted black rectanges
  int quadY=50;
  while (quadY<height) {
    quad(0, quadY, 500, quadY+20, 500, quadY+40, 0, quadY+20);
    quadY+=150;
  }
  
  //printing "Restricted" in red
  f=createFont("Times New Roman", 30);
  textFont(f, 30);
  fill(255, 0, 0);
  for (int txtY=70; txtY<800; txtY+=150) {
    for (int txtX=0; txtX<700; txtX+=140) {
      text("Restricted ", txtX, txtY);
    }
  }
}

//Generating mouseWasPressed variable
int mouseClickCount=0;
void mousePressed() {
  mouseWasPressed=true;
  mouseClickCount+=1;
}

//function that prints "Answer" whereever clicked for two times 
void draw() {
  if (mousePressed==true) {
    if (mouseClickCount<=2) {
      textFont(f, 40);
      fill(255, 255, 255);
      text("Answer", mouseX, mouseY);
    }
    //after two clicks, you can erase the canvas
    if (mouseClickCount>2) {
      fill(255, 255, 255);
      noStroke();
      circle(mouseX, mouseY, 20);
    }
  }
}

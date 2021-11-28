import processing.serial.*;
Serial myPort;

float xPos_ = width/2;
boolean arduinoisReady = false;
int weight = 2;

void setup() {
  size(700, 500);
  noFill();
  
  String port = Serial.list()[0];
  myPort = new Serial(this,port,9600);
  myPort.clear();
  myPort.bufferUntil('\n');
  delay(2000);
}

void draw(){
  ellipse(xPos_,height/2,weight,weight);
  fill(0);
  
  if (arduinoisReady == true){
    myPort.write(1+"\n");
    arduinoisReady =false;
  }
  
}

void serialEvent(Serial myPort){
  String xPos = myPort.readStringUntil('\n');
  
  if (xPos != null){
    xPos = trim(xPos);
    xPos_ = float(xPos);
    arduinoisReady = true;
  }
}

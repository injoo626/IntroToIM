import processing.serial.*;
Serial myPort;

boolean arduinoisReady = false;

// initial brightness is set to 0 (dark)
float bright=0;
float light = 0;

void setup() {
  size(500, 500);

  String port = Serial.list()[0];

  myPort = new Serial(this, port, 9600);
  myPort.clear();
  myPort.bufferUntil('\n');
}

void draw() {
  background(light);                 //changes the color displayed on processing

  if (arduinoisReady == true) {     //check if arduino is ready for a new command
    myPort.write(light+"\n");       //send brightness value to arduino
    arduinoisReady = false;
  }
}

// When mouse is pressed, the light turns on and off
void mouseReleased() {
  bright += 1;
  
  if (bright%2 == 0) {          
    light = 0;
  }
  if (bright%2 == 1) {
    light = 255;
  }
}

void serialEvent(Serial myPort) {
  String s = myPort.readStringUntil('\n');
  arduinoisReady = true;
}

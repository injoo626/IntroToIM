
import processing.serial.*;

float clr;
int chooseColor = 0;
int whichRGB = 0;
boolean arduinoisReady = false;

Serial myPort;                 

void setup() {
  size(500, 500);

  myPort = new Serial(this, Serial.list()[0], 9600);
  myPort.clear();
  myPort.bufferUntil('\n');
}


void draw() {
  if (whichRGB == 0) {                 // displays variations of RED
    background(clr, 0, 0);
  } 
  if (whichRGB == 1) {                 // displays variations of GREEN
    background(0, clr, 0);
  }
  if (whichRGB == 2) {
    background(0, 0, clr);             // displays variations of BLUE
  }

  if (arduinoisReady == true) {        // sends which color has been selected to Arduino
    myPort.write(whichRGB+"\n");
    arduinoisReady = false;
  }
}

void serialEvent (Serial myPort) {
  String s = myPort.readStringUntil('\n');       // read from Arudino

  if (s != null) {                    // if string is NOT empty
    clr = float(s);                   // read the value 
    arduinoisReady = true;            // ready to receive new message
  }
}

void mouseReleased() {                // whenever mouse is released, the displayed color changes
  chooseColor+=1;                   

  if (chooseColor%3 == 0) {
    whichRGB = 0;
  }
  if (chooseColor%3 == 1) {
    whichRGB = 1;
  }
  if (chooseColor%3 == 2) {
    whichRGB = 2;
  }
}

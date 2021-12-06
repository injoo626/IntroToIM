import processing.serial.*;   //import Serial from Arduino
import processing.sound.*;    //import Sound

Serial myPort;
boolean arduinoisReady = false;

String xPosString;           // x position read from Arduino
String yPosString;           // y position read from Arduino
int clr;                     // color information from Arduino

float xPosFloat = width/2;   // current x position
float xPosOld = width/2;     // x position one frame ago

float yPosFloat = height/2;  // current y position
float yPosOld = width/2;     // y position one frame ago

int weight = 5;              // thickness of the line
color c = color(65);         // color of the line

PImage sketch;               // background image
SoundFile page;              // page turning sound effect


void setup() {\\\\\\\\\\\\\\\\
  // Load background image and page turning sound
  sketch = loadImage("/Users/user/Desktop/IntrotoIM/finalProject/background.png");
  page = new SoundFile(this, "/Users/user/Desktop/IntrotoIM/finalProject/page.mp3");

  // create canvas
  size(1023, 700);
  background(255);
  image(sketch, 0, 0, 1023, 700);

  // prepare to read information from Arduino
  String port = Serial.list()[0];
  myPort = new Serial(this, port, 9600);
  myPort.clear();
  myPort.bufferUntil('\n');
  delay(2000);                      // give some time to Arduino to set up
}

void draw() {
  clrDefinition();                 // generate color value based on info from Arduino
  stroke(c);                       // draw with the color value
  //draw a line that connects previous position with current position
  line(xPosOld, yPosOld, xPosFloat, yPosFloat);
  strokeWeight(weight);            // draw with a desired thickness

  if (arduinoisReady == true) {    // handshake
    myPort.write(1+"\n");
    arduinoisReady =false;
  }
}


// designates RGB values to color information read from Arduino
void clrDefinition() {
  if (clr == 0) {             // if no button is pressed
    c = color(65);            // draws black line
  }
  if (clr == 1) {            // if red button is pressed
    c = color(201, 50, 50);  // draws red line
  }
  if (clr == 2) {            // if yellow button is pressed
    c = color(255, 204, 0);  // draws yellow line
  }
  if (clr == 3) {            // if green button is pressed
    c = color(67, 182, 44);  // draws green line
  }
}

void serialEvent(Serial myPort) {
  String posString = myPort.readStringUntil('\n');    // read from Arduino
  posString = trim(posString);                        // trims empty spaces

  String posDivide[] = split(posString, ",");         // split the string

  xPosString = posDivide[0];                          // x Position
  yPosString = posDivide[1];                          // y Position
  clr = int(posDivide[2]);                            // color

  //println(xPosString, yPosString, clr);             // checking right information is received

  if (posString != null) {              // if string is not empty
    xPosOld = xPosFloat;                // current xPosition is saved as old xPosition
    xPosFloat = float(xPosString);      // newly read position becomes current xPosition

    yPosOld = yPosFloat;                // current yPosition is saved as old yPosition
    yPosFloat = float(yPosString);      // newly read position becomes current yPosition

    arduinoisReady = true;              // ready to receive new value
  }
}


// when mouse is pressed, board is cleared and sound effect is played
void mousePressed() {
  background(255);
  image(sketch, 0, 0, 1023, 700);    // clears board
  page.play();                       // plays sound effect
}

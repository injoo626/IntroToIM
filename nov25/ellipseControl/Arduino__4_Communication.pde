// Simple movement of ellipse based on values from Arduino
// Based on Graphing example by Tom Igoe

import processing.serial.*;

Serial myPort;
float x = 0;

void setup () {
  size(400, 300);
  myPort = new Serial(this, Serial.list()[0], 9600);
  myPort.bufferUntil('\n');                     // serialEvent() only when there is a newline character:
}

void draw () {
  background(0);
  circle(x, height/2, 50);                        // draw a circle in the middle
}

void serialEvent (Serial myPort) {
  String inString = myPort.readStringUntil('\n');

  if (inString != null) {                       // make sure the string isn't empty
    x = float(inString);                        // convert string to float
    x = map(x, 0, 1023, 0, width);              // map to the width of the screen
  }
}

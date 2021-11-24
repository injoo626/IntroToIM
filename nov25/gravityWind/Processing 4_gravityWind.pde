PVector velocity;
PVector gravity;
PVector position;
PVector acceleration;
PVector wind;
float drag = 0.99;
float mass = 50;
float hDampening;

import processing.serial.*;
Serial myPort;
boolean arduinoisReady = false;


void setup() {
  size(640, 360);
  noFill();

  // values needed to move the ball
  position = new PVector(width/2, 0);
  velocity = new PVector(0, 0);
  acceleration = new PVector(0, 0);
  gravity = new PVector(0, 0.5*mass);
  wind = new PVector(0, 0);
  hDampening=map(mass, 15, 80, .98, .96);

  // Read from Arduino's Serial port
  String port = Serial.list()[0];
  myPort = new Serial(this, port, 9600);
  myPort.clear();
  myPort.bufferUntil('\n');

  // delay to make sure first bounce is not missed
  delay(2000);
}

void draw() {
  background(255);

  //wind blows even when key is not pressed
  if (!keyPressed) {
    velocity.x*=hDampening;
  }

  // force (wind and gravity) applied to move the ball
  applyForce(wind);
  applyForce(gravity);
  velocity.add(acceleration);
  velocity.mult(drag);
  position.add(velocity);
  acceleration.mult(0);

  // draw the ball
  ellipse(position.x, position.y, mass, mass);

  // ball bounces when it hits the bottom
  if (position.y > height-mass/2) {
    velocity.y *= -0.9;  // A little dampening when hitting the bottom
    position.y = height-mass/2;
  }

  //send message to Arduino
  if (arduinoisReady) {
    myPort.write(1+"\n");
    arduinoisReady = false;
  }
}


// Gravity and wind force
void applyForce(PVector force) {
  PVector f = PVector.div(force, mass);
  acceleration.add(f);
}

void serialEvent(Serial myPort) {
  // Get value from Arduino analog sensor
  String s = myPort.readStringUntil('\n');

  // Checking if the string isn't empty
  if (s != null) {
    s = trim(s);
    float windValue = float(s);
    wind.x = map(windValue, 0, 1023, -5, 5);   // map the value within a reasonable range
    arduinoisReady = true;                     // ready to receive the next order
  }
}

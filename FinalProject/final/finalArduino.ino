// input from potentiometer
const int xPosRead = A1;
const int yPosRead = A2;

// input from colored buttons
const int buttonRed = 7;
const int buttonYellow = 8;
const int buttonGreen = 9;

// when no button is pressed
int color = 0;

void setup() {
  Serial.begin(9600);

  pinMode(A1, INPUT);
  pinMode(A2, INPUT);

  pinMode(7, INPUT);
  pinMode(8, INPUT);
  pinMode(9, INPUT);
}

void loop() {
  // read values from each potentiometer
  int x = analogRead(xPosRead);
  int y = analogRead(yPosRead);

  // read values from three colored buttons
  int redState = digitalRead(buttonRed);
  int yellowState = digitalRead(buttonYellow);
  int greenState = digitalRead(buttonGreen);

  // map x and y to the desired range (within the canvas)
  x = map(x, 0, 1023, 283, 1640);
  y = map(y, 0, 1023, 193, 830);

  if (redState == HIGH) {     // if red button is pressed
    color = 1;                // color value is set to 1
  }
  if (yellowState == HIGH) {  // if yellow button is pressed
    color = 2;                // color value is set to 2
  }
  if (greenState == HIGH) {   // if green button is pressed
    color = 3;                // color value is set to 3
  }

  // combines three values (x position, y position, color)
  // and send them to Processing
  Serial.println(String(x) + "," + String(y) + "," + String(color));
  delay(100);
}

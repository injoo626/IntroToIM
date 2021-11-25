const int color = A1;                 // controls brightness of the color

const int red = 9;
const int green = 8;
const int blue = 7;

void setup() {
  Serial.begin(9600);
  Serial.println("0");

  pinMode(red, OUTPUT);
  pinMode(green, OUTPUT);
  pinMode(green, OUTPUT);
}

void loop() {
  while (Serial.available()) {
    float LEDcolor = Serial.parseFloat();         // reads from Processing which LED should be turned on

    if (Serial.read() == '\n') {
      if (LEDcolor == 0) {                        // when Processing displays variations of red,
        turnoff();                                // turns off whatever was on previously
        digitalWrite(red, HIGH);                  // and red LED is turned on
      }
      if (LEDcolor == 1) {                        // when procesing displays variations of green
        turnoff();                                // turns off whatever was on previously
        digitalWrite(green, HIGH);                // and green LED is turned on
      }
      if (LEDcolor == 2) {                        // when procesing displays variations of green
        turnoff();                                // turns off whatever was on previously
        digitalWrite(blue, HIGH);                 // and blue LED is turned on
      }

      float clr = analogRead(color);              // reads the value from potentiometer
      clr = map(clr, 0, 1023, 0, 255);            // maps within 0,255
      Serial.println(clr);                        // send message to Processing
    }
  }
}

void turnoff() {
  digitalWrite(red, LOW);
  digitalWrite(green, LOW);
  digitalWrite(blue, LOW);
}

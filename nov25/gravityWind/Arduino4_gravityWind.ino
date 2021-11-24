const int led = 7;
const int wind = A1;

const int flashDuration = 50;
unsigned long turnedLEDOnAt = 0;

void setup() {
  Serial.begin(9600);
  Serial.println("0");           // initiate the communication
  pinMode(led, OUTPUT);
}

void loop() {

  while (Serial.available()) {
    int valueFromProcessing = Serial.parseInt();   // read message from Processing

    if (Serial.read() == '\n') {
      if (valueFromProcessing == 1) {          // if the ball has hit the bottom in the Processing
        digitalWrite(led, HIGH);               // turn on the LED
        turnedLEDOnAt = millis();              // and note the time
      }

      Serial.println(analogRead(wind));        // read analog sensor and send it to Processing
    }
  }

  if (millis() - turnedLEDOnAt >= flashDuration) {  // after certain time has passed
    digitalWrite(led, LOW);                         // turn off LED
  }
}

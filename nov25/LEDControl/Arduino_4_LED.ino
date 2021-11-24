const int led = 7;

void setup() {
  Serial.begin(9600);
  Serial.println("0");                            //initiate the program
  pinMode(LED_BUILTIN, OUTPUT);
}

void loop() {
  while (Serial.available()) {
    float light = Serial.parseFloat();             //read float value from Serial

    if (Serial.read() == '\n') {
      digitalWrite(led, light);                    //turn on/off the led 
      Serial.println(0);
    }
  }
}

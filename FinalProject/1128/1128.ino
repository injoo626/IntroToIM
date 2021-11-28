const int xPos = A1;

void setup() {
  Serial.begin(9600);
}

void loop() {
  int x = analogRead(xPos);
  Serial.println(x);
  delay(1);
}

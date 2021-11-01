const int arm = A2;
const int led = 13;

void setup() {
  // put your setup code here, to run once:
  pinMode(LED_BUILTIN, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  int armState = digitalRead(arm);

  if (armState == HIGH) {
    digitalWrite(led, HIGH);
    delay(300);
    digitalWrite(led, LOW);
  }
}

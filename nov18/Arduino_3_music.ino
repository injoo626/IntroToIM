const int spkr = 7;
const int pitchCtrl = A1;
const int button = 12;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);

}

void loop() {
  // put your main code here, to run repeatedly:

  int pitch = analogRead(pitchCtrl);
  int buttonState = digitalRead(button);
  Serial.println(buttonState);

  map(pitch, 0, 1024, 400, 800);
  tone(spkr, pitch);
  
  if (buttonState == HIGH) {
    noTone(spkr);
    exit(0);
  } 
}

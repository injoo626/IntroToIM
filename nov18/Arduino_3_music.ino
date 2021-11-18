const int spkr = 7;
const int pitchCtrl = A1;
const int button = 12;

void setup() {
  //  Serial.begin(9600);             Used to check the buttonState
}

void loop() {
  int pitch = analogRead(pitchCtrl);         //controls pitch of the sound
  int buttonState = digitalRead(button);
  //  Serial.println(buttonState);      Used to check the buttonState

  map(pitch, 0, 1024, 400, 800);             //map pitch value to audible range
  tone(spkr, pitch);                         //produce sound 

  if (buttonState == HIGH) {                 //stops playing once button is pressed
    noTone(spkr);
    exit(0);
  }
}

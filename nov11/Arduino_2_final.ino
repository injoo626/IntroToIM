//input and output channels
const int redButton = A2;
const int greenButton = A3;
const int ldr = A1;

const int red = 13;
const int green = 7;


void setup() {
  pinMode(7, OUTPUT);
  pinMode(A2, INPUT);
  pinMode(A1, INPUT);
  pinMode(13, OUTPUT);
}

//green led lights shortly when this function is called
void greenShort() {
  int ldrValue = analogRead(ldr);                   //ldr value is read and constrained
  ldrValue = constrain(ldrValue, 200, 800);

  //ldr value controls how fast the light blinks
  digitalWrite(green, 255);
  delay(ldrValue / 2);
  digitalWrite(green, 0);
  delay(ldrValue);
}

//green led lights longer when this function is called
void greenLong() {
  int ldrValue = analogRead(ldr);
  ldrValue = constrain(ldrValue, 200, 800);

  digitalWrite(green, 255);
  delay(ldrValue);
  digitalWrite(green, 0);
  delay(ldrValue);
}

//red led lights shortly when this function is called
void redShort() {
  int ldrValue = analogRead(ldr);
  ldrValue = constrain(ldrValue, 200, 800);

  digitalWrite(red, 255);
  delay(ldrValue / 2);
  digitalWrite(red, 0);
  delay(ldrValue);
}

//red led lights longer when this function is called
void redLong() {
  int ldrValue = analogRead(ldr);
  ldrValue = constrain(ldrValue, 200, 800);

  digitalWrite(red, 255);
  delay(ldrValue);
  digitalWrite(red, 0);
  delay(ldrValue);
}



void loop() {
  //reads which of the button is pressed
  int greenState = digitalRead(greenButton);
  int redState = digitalRead(redButton);

  //when greenbutton is pressed, green light blinks "love" in morse code
  if (greenState == HIGH) {
    greenShort();         //l
    greenLong();
    greenShort();
    greenShort();

    delay(300);

    greenLong();          //o
    greenLong();
    greenLong();

    delay(300);

    greenShort();         //v
    greenShort();
    greenShort();
    greenLong();

    delay(300);

    greenShort();          //e
  }

  //when red button is pressed, red light blinks "hate" in morse code
  if (redState == HIGH) {
    redShort();           //h
    redShort();
    redShort();
    redShort();

    delay(300);

    redShort();            //a
    redLong();

    delay(300);

    redLong();             //t

    delay(300);

    redShort();            //e
  }
}

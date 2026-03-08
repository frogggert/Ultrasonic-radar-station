#include <Servo.h>

const int sigPin = 6; 
const int servoPin = 3; 

Servo myservo;
const int minAngle = 15;
const int maxAngle = 165;
const int stepSize = 2;
const int settleDelay = 20;
const unsigned long timeout = 30000UL;

long getDistanceCM() {
  pinMode(sigPin, OUTPUT);
  digitalWrite(sigPin, LOW);
  delayMicroseconds(5);
  digitalWrite(sigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(sigPin, LOW);

  pinMode(sigPin, INPUT);
  long duration = pulseIn(sigPin, HIGH, timeout);

long cm = duration / 58;
if (cm < 2 || cm > 40) return 0;  // ignore noise and out-of-range readings
return cm;
}

void setup() {
  Serial.begin(115200);
  myservo.attach(servoPin);
}

void loop() {
  for (int angle = minAngle; angle <= maxAngle; angle += stepSize) {
    myservo.write(angle);
    delay(settleDelay);

    long distance = getDistanceCM();

    Serial.print(angle);
    Serial.print(",");
    Serial.println(distance);
  }

  for (int angle = maxAngle; angle >= minAngle; angle -= stepSize) {
    myservo.write(angle);
    delay(settleDelay);

    long distance = getDistanceCM();

    Serial.print(angle);
    Serial.print(",");
    Serial.println(distance);
  }
}

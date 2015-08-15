#include <SoftwareSerial.h>

int P1 = 2;
int P2 = 3;
int P3 = 4;
int P4 = 5;
int P5 = 6;
int P6 = 7;
int P7 = 8;
int P8 = 9;
int P9 = 10;
int P10 = 11;



void setup(){
Serial.begin(9600);
pinMode(P1, OUTPUT);
pinMode(P2, OUTPUT);
pinMode(P3, OUTPUT);
pinMode(P4, OUTPUT);
pinMode(P5, OUTPUT);
pinMode(P6, OUTPUT);
pinMode(P7, OUTPUT);
pinMode(P8, OUTPUT);
pinMode(P9, OUTPUT);
pinMode(P10, OUTPUT);
}
void loop(){
char RXval;
RXval = Serial.read();
if (RXval == 'A'){
  digitalWrite(P1, HIGH);
}
if (RXval == 'a'){
  digitalWrite(P1, LOW);
}
if (RXval == 'B'){
  digitalWrite(P2, HIGH);
}
if (RXval == 'b'){
  digitalWrite(P2, LOW);
}
if (RXval == 'C'){
  digitalWrite(P3, HIGH);
}
if (RXval == 'c'){
  digitalWrite(P3, LOW);
}
if (RXval == 'D'){
  digitalWrite(P4, HIGH);
}
if (RXval == 'd'){
  digitalWrite(P4, LOW);
}
if (RXval == 'E'){
  digitalWrite(P5, HIGH);
}
if (RXval == 'e'){
  digitalWrite(P5, LOW);
}
if (RXval == 'F'){
  digitalWrite(P6, HIGH);
}
if (RXval == 'f'){
  digitalWrite(P6, LOW);
}
if (RXval == 'G'){
  digitalWrite(P7, HIGH);
}
if (RXval == 'g'){
  digitalWrite(P7, LOW);
}
if (RXval == 'H'){
  digitalWrite(P8, HIGH);
}
if (RXval == 'h'){
  digitalWrite(P8, LOW);
}
if (RXval == 'I'){
  digitalWrite(P9, HIGH);
}
if (RXval == 'i'){
  digitalWrite(P9, LOW);
}
if (RXval == 'J'){
  digitalWrite(P10, HIGH);
}
if (RXval == 'j'){
  digitalWrite(P10, LOW);
}
}

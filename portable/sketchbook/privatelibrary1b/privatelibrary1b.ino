// File: sketchbook/privatelibrary1/privatelibrary1.ino
// Info: step 1 - separate functionality into program and library 

#include "privatelibrary1.h" // application library

void setup() {
  PLib.init();
}

void loop() {
  PLib.exec();
  delay(1000);
}

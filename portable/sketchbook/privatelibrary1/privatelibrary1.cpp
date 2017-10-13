// File: sketchbook/privatelibrary1/privatelibrary1.cpp
// Info: step 1 - implementation of the application library

#include <Arduino.h>
#include "privatelibrary1.h"

PrivateLibrary PLib;

void PrivateLibrary::init() {
  if (!Serial) {
    Serial.begin(115200);
    delay(10);
    Serial.println("*PLib: init()");
  }
}

void PrivateLibrary::exec() {
  Serial.println("*PLib: exec()");
}


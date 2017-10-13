# Arduino IDE Object Library

Publish precompiled libraries for Arduino IDE (1.6.8 / 1.8.4)

## Publish object code based libraries

* hide away source code for various reasons
* comply with open source license like LGPL
* based on the hook feature of Arduino IDE
* supports object code for various microcontrollers
* supports different IDE versions

## How does it works with Arduino IDE

* you have to add some hooks to [hardware/platform.txt](https://github.com/iotool/Arduino-IDE-Object-Library/blob/master/hardware/platform.txt)
* the Arduino IDE [execute each hook](https://github.com/iotool/Arduino-IDE-Object-Library/blob/master/portable/hook-plattform.cmd) during the build process
* first the IDE compile a empty [dummy library](https://github.com/iotool/Arduino-IDE-Object-Library/blob/master/portable/sketchbook/privatelibrary1b/privatelibrary1.cpp) (cpp.o)
* our hook replace all dummy libraries (cpp.o.hook-mcuname)
* second the IDE link all object codes to firmware binary

## Private Library Example

I build an example to demonstrate the development process.

* private version: [portable/sketchbook/privatelibrary1](https://github.com/iotool/Arduino-IDE-Object-Library/tree/master/portable/sketchbook/privatelibrary1)
* public version: [portable/sketchbook/privatelibrary1b](https://github.com/iotool/Arduino-IDE-Object-Library/tree/master/portable/sketchbook/privatelibrary1b)

You have to create two different sketches. The first sketch contain the private source code and the second sketch use the precompiled object code. To enable the Arduino IDE to compile the second sketch we have to add a dummy library.

We separate the application into program and library to protect some parts of your code. The library contain all the particularly valuable code which you want to hide. Activate the compiler output at settings and compile the sketch for the target controller. At the compiler output you find a temporary build path. Copy the object file of your library "temp\sketch\privatelibrary1.cpp.o" to the second sketch and rename it to "sketchbook\privatelibrary1b\privatelibrary1.cpp.o-hook-atmega328p-10608" (atmega328p is the name of the microcontroller and 10608 the IDE version 1.6.8).

To support multiple microcontrollers you have to compile the first sketch for each target and copy the object code to the second sketch.

* xxx.cpp.o.hook-atmega328p-10608 = Arduino Uno (based on ATmega328P / IDE 1.6.8)
* xxx.cpp.o.hook-atmega32u4-10608 = Arduino Leonardo (based on ATmega32U4 / IDE 1.6.8)
* xxx.cpp.o.hook-esp8266-10608 = ESP8266 Wemos D1 mini (based on ESP8266 16 MBit / IDE 1.6.8 / SDK 2.3.0)

Now you can publish the second application. Every user are able to recompile your application or replace other open source libraries with exactly the same Arduion IDE version like you. You must compile the source with the original release of each library and disable updates because of object code compartibility. In addition to that you can backup a portable IDE and include the used source of each shared library as subfolder of portable/sketchbook/libraries. At the moment I only support windows os. You can adopt IDE hook for the other operating systems.

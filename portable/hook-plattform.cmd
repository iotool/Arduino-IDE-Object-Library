@echo off

set phook=%1
set pruntime=%2
set pbuild=%3
set psource=%4
set pproject=%5
set pmcu=%6
set pversion=%7

if "%phook%"=="sketch.prebuild" (
  rem.
  echo ### HOCK.SKETCH.PREBUILD ### %pbuild%\sketch
  del %pbuild%\sketch\*.cpp.o /F
)

if "%phook%"=="linking.prebuild" (
  rem.
  echo ### HOCK.LINKING.PREBUILD ### %psource%\*.cpp.o.hook-%pmcu%
  xcopy %psource%\*.cpp.o.hook-%pmcu%-%pversion% %pbuild%\sketch /F /R /Y
  for %%G in ("%pbuild%\sketch\*.cpp.o") do (
    if exist "%%G.hook-%pmcu%-%pversion%" (
      echo ### HOOK %pmcu%-%pversion% ### %%G
      xcopy %%G.hook-%pmcu%-%pversion% %%G /F /R /Y
    )
  )
)

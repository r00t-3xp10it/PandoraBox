@echo off
echo ---
echo - Change the Description Of Executables Applications (exe)
echo -
echo - Examples:
echo - Enter VERSION: 11.0.18362.350
echo - Enter FILE DESCRIPTION: Automatic CAB file extraction program for win32
echo - Enter PRODUCT NAME: Microsoft® Windows® Operative System
echo - Enter COPYRIGTHS: ©Microsoft Corporation. All Rights Reserved
echo - Enter ORIGINAL FILENAME: vstudio.exe
echo ---


:: User Inputs
set /p file="Enter BINARY PATH (or drag and drop): "
set /p one="Enter VERSION: "
set /p two="Enter FILE DESCRIPTION: "
set /p four="Enter PRODUCT NAME: "
set /p five="Enter COPYRIGTHS: "
set /p six="Enter ORIGINAL FILENAME: "

:: Setting values for resource file
echo .
echo Writting Resource File ..
set VERSION="%one%"
set FILEDESCR=/s desc "%two%"
set BUILDINFO=/s pb "%one%"
set PRODINFO=/s product "%four%" /pv "%one%"
set COOPYR=/s copyright "%five%"
set INTERN=/s OriginalFilename "%six%"
timeout /t 2 > NUL

:: Using verpatch to change file description
echo Using verpatch to change file description ..
verpatch /va %file% %VERSION% %FILEDESCR% %BUILDINFO% %PRODINFO% %COOPYR% %INTERN%
timeout /t 2 > NUL
echo Successful Changed %file% File Description ..
timeout /t 3 > NUL
exit
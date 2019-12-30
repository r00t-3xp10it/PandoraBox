## PandoraBox Project

**Objective:** Transform your batch (bat) script into one binary.exe<br />
**Description:** This Project allow us to transform one batch script into one binary.exe without beeing<br />
flaged by Anti-Virus solutions (BATtoEXE and AdvancedBATtoEXE Applications flags AV detection)<br />
**Remark:** I have written 'example_script.bat' to demonstrate 'BATtoEXEconverter.bat' working<br />

<br />

#### How To:
- 1º - Drag and Drop your 'script.bat' on top of 'BATtoEXEconverter.bat'.<br />
  - **{ The 'transformed.exe' File will be saved in working directory and ready to be used }** ..<br />

<br />

---

## FileDescription Project

**Objective:** Change the Description Of Executable Applications (exe)<br />
**Description:** This Project let us change Executables (exe) File Description like: 'COPYRIGTHS,FILE DESCRIPTION,VERSION,etc'.<br />
**Remark:** 'FileDescriptionChanger.bat' script it will use 'verpatch.exe' and 'resource.rc' to acomplish that.

<br /> 

#### How To:
- 1º Execute 'FileDescriptionChanger.bat' script and follow the instructions (User Inputs).<br />
  - **{ The 'transformed.exe' File will be saved in working directory and ready to be used }** ..<br />
    - Edit File 'Properties' -> 'Details' to make sure the values have been correct changed.<br />

<br />

### Limitations:
1º **'verpatch.exe'** will not work in **'wine'** under Linux Distros (only under Windows systems).<br />
2º IF you use **'FileDescriptionChanger.bat'** in an Original Apllication, that binary file will be changed.<br />
**{ So its adviced to 'COPY' the File to be transformed to a new location to leave the Original application intact }**<br />
3º Sometimes Anti-Virus solluctions will ask us if we want to send the 'temp' file for analyzes (offcourse not)<br />
**{ So Remmenber to turn off Windows Defender 'automatic sample submission' from sending samples to Microsoft }**

---

## Suspicious Shell Activity @2019

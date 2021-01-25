## PandoraBox Project

**Objective:** Transform your batch (bat) script into one binary.exe<br />
**Description:** This Project allow us to transform one batch script into one binary.exe without beeing<br />
flaged by Anti-Virus solutions (BATtoEXE and AdvancedBATtoEXE Applications flags AV detection)<br />
**Original Script:** https://github.com/npocmaka/batch.scripts/edit/master/hybrids/iexpress/bat2exeIEXP.bat
![um](https://user-images.githubusercontent.com/23490060/71759053-72dd3980-2e9f-11ea-8d3e-435def757fc7.png)
**Remark:** I have written 'example_script.bat' to demonstrate 'BATtoEXEconverter.bat' working<br />
**Remark:** Turn OFF your Windows Defender from 'sending samples' to $Microsoft (just in case they want to analyze tmp files)<br />


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
![cinco](https://user-images.githubusercontent.com/23490060/71759067-96a07f80-2e9f-11ea-8ff2-4e87b3ef9832.png)

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

### Some Screenshots
![um](https://user-images.githubusercontent.com/23490060/71759053-72dd3980-2e9f-11ea-8d3e-435def757fc7.png)
![dois](https://user-images.githubusercontent.com/23490060/71759058-7f619200-2e9f-11ea-9d54-dc45b30565ad.png)
![tres](https://user-images.githubusercontent.com/23490060/71759061-8688a000-2e9f-11ea-9fa8-fc718df41798.png)
![quatro](https://user-images.githubusercontent.com/23490060/71759063-90120800-2e9f-11ea-90c6-27536fa3a1ec.png)
**FileDescription Project**
![cinco](https://user-images.githubusercontent.com/23490060/71759067-96a07f80-2e9f-11ea-8ff2-4e87b3ef9832.png)
![seis](https://user-images.githubusercontent.com/23490060/71759070-9c966080-2e9f-11ea-80c5-45900e83a9fa.png)
![sete](https://user-images.githubusercontent.com/23490060/71759071-a15b1480-2e9f-11ea-86e4-bc7198de670d.png)
![oito](https://user-images.githubusercontent.com/23490060/71759074-a5873200-2e9f-11ea-942d-305c5a227066.png)
![nove](https://user-images.githubusercontent.com/23490060/71759075-a9b34f80-2e9f-11ea-9896-979129015c1f.png)

**It only misses sign the binary ...**<br />
[url] https://github.com/r00t-3xp10it/venom/blob/master/obfuscate/CarbonCopy.py


<p align="center">
  <a href="https://github.com/r00t-3xp10it//github-readme-stats">
    <img
      align="center"
      height="165"
      src="https://github-readme-stats.vercel.app/api?username=r00t-3xp10it&count_private=true&show_icons=true&custom_title=Github%20Status&hide=issues&theme=radical"
    />
  </a>
</p>


## Suspicious Shell Activity @2019

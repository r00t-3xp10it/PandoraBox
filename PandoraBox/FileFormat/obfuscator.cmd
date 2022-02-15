@echo off
:: Author: @BiggerDABOSS
:: Uri: https://github.com/BiggerDABOSS/BatchObfuscator
:: ---
if "%~1"=="" exit /b
if /i "%~x1" neq ".bat" if /i "%~x1" neq ".cmd" exit /b
for /f %%i in ("certutil.exe") do if not exist "%%~$path:i" (
  echo CertUtil.exe not found.
  pause
  exit /b
)
>"temp.~b64" echo(//4mY2xzDQo=
certutil.exe -f -decode "temp.~b64" "%~n1o%~x1"
del "temp.~b64"
copy "%~n1o%~x1" /b + "%~1" /b
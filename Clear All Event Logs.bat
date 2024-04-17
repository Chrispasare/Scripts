

@echo off

FOR /F "tokens=1,2*" %%V IN ('bcdedit') DO SET adminTest=%%V
IF (%adminTest%)==(Access) goto noAdmin
for /F "tokens=*" %%G in ('wevtutil.exe el') DO (call :do_clear "%%G")
echo.

echo All Event Logs have been cleared!
goto theEnd

:do_clear
echo clearing %1
wevtutil.exe cl %1
goto :eof

:noAdmin
echo Danger, Will Robinson!
echo This bat file must be run as administrator 
echo Press the Enter key to close this window 
echo Right-click on "Clear All Event Logs.bat" and select "Run as administrator"  
pause >nul
